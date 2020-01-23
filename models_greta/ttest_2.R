library(tidyverse)
library(greta)
library(ggmcmc)
library(bayesplot)

## get fictitious data from two groups (same as in HW 9)

group_1 <- c(
  104, 105, 100, 91, 105, 118, 164, 168, 111, 107, 136, 149, 104, 114, 107, 95, 
  83, 114, 171, 176, 117, 107, 108, 107, 119, 126, 105, 119, 107, 131
)
group_2 <- c(
  133, 115, 84, 79, 127, 103, 109, 128, 127, 107, 94, 95, 90, 118, 124, 108, 
  87, 111, 96, 89, 106, 121, 99, 86, 115, 136, 114
)

mean(group_1)
mean(group_2)


## --- greta model code ---

## --- --- greta data --- ---

y0 <- as_data(group_1)
y1 <- as_data(group_2)

## --- --- latent variables --- ---

# should this rather be "pooled SD for unequal variance?"
sd_delta <- sd(c(group_1,group_2))

# regularizing priors that enable a good fit
mean_0   <- normal(mean(group_1), 50)
delta    <- normal(0, sd_delta)
sigma_0  <- normal(100, 10, truncation = c(0, Inf))
sigma_1  <- normal(100, 10, truncation = c(0, Inf))
mean_1   <- mean_0 + delta

## --- --- likelihood --- ---

distribution(y0) <- normal(mean_0, sigma_0)
distribution(y1) <- normal(mean_1, sigma_0)

## --- --- model --- ---

m <- model(mean_0, delta, sigma)
# plot(m)

## --- sampling ---

draws <- greta::mcmc(m, n_samples = 4000)

# save data 
# saveRDS(draws, 'models_greta/ttest_2_draws.rds')
# draws <- readRDS('models_greta/ttest_2_draws.rds')

# cast results (type 'mcmc.list') into tidy tibble
tidy_draws = ggmcmc::ggs(draws)

Bayes_estimates <- tidy_draws %>% 
  group_by(Parameter) %>%
  summarise(mean = mean(value),
            '|95%' = HDInterval::hdi(value)[1],
            '95|%' = HDInterval::hdi(value)[2])

dens <- filter(tidy_draws, Parameter == "delta") %>% pull(value) %>% 
  density()

tibble(
  delta = dens$x,
  density = dens$y
) %>% 
  ggplot(aes(x = delta, y = density)) +
  geom_line() +
  geom_area(aes(x = ifelse(delta > Bayes_estimates[1,3] %>% as.numeric & delta < Bayes_estimates[1,4] %>% as.numeric , delta, 0)),
            fill = "firebrick", alpha = 0.5) +
  ylim(0, max(dens$y)) +
  xlim(min(dens$x), max(dens$x))

bayesplot::mcmc_pairs(draws)

# estimating density of posterior at delta = 0
fit.posterior <- polspline::logspline(tidy_draws %>% filter(Parameter == "delta") %>% pull(value))
posterior_delta_null <- polspline::dlogspline(0, fit.posterior)
# prior delta = 0
prior_delta_null <- dnorm(0,0,sd_delta) 

BF_delta_null = posterior_delta_null / prior_delta_null


