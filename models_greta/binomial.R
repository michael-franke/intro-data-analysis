library(tidyverse)
library(greta)
library(ggmcmc)
library(bayesplot)

## load the MC data

k <- 109
N <- 311

## --- --- greta data --- ---

k <- as_data(109)
N <- as_data(311)

## --- --- latent variables --- ---

# uninformative prior
theta   <- beta(1,1)

## --- --- likelihood --- ---

distribution(k) <- binomial(N, theta)

## --- --- model --- ---

m <- model(theta)
# plot(m)

## --- sampling ---

draws <- greta::mcmc(m, n_samples = 1000)

# save data 
saveRDS(draws, 'models_greta/binomial_draws.rds')
# draws <- readRDS('models_greta/binomial_draws.rds')

# cast results (type 'mcmc.list') into tidy tibble
tidy_draws = ggmcmc::ggs(draws)


Bayes_estimates <- tidy_draws %>% 
  group_by(Parameter) %>%
  summarise(mean = mean(value),
            '|95%' = HDInterval::hdi(value)[1],
            '95|%' = HDInterval::hdi(value)[2])

dens <- filter(tidy_draws, Parameter == "theta") %>% pull(value) %>% 
  density()

tibble(
  parameter = dens$x,
  density = dens$y
) %>% 
  ggplot(aes(x = parameter, y = density)) +
  geom_line() +
  geom_area(aes(x = ifelse(parameter > Bayes_estimates[1,3] %>% as.numeric & parameter < Bayes_estimates[1,4] %>% as.numeric , parameter, 0)),
            fill = "firebrick", alpha = 0.5) +
  ylim(0, max(dens$y)) +
  xlim(min(dens$x), max(dens$x)) +
  xlab("theta")

opt(m)
