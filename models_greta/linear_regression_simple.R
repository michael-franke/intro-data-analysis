library(tidyverse)
library(greta)
library(ggmcmc)
library(bayesplot)



## --- greta model code ---

## --- --- data --- ---

avocado_data <- read_csv('data_sets/avocado.csv') %>% 
  # remove currently irrelevant columns
  select( -X1 , - contains("Bags"), - year, - region) %>% 
  # rename variables of interest for convenience
  rename(
    total_volume_sold = `Total Volume`,
    average_price = `AveragePrice`,
    small  = '4046',
    medium = '4225',
    large  = '4770',
  )


price     <- as_data(avocado_data$average_price)
log_sold  <- as_data(avocado_data$total_volume_sold %>% log)

## --- --- latent variables --- ---

intercept <- student(df= 1, mu = 0, sigma = 10)
slope     <- student(df= 1, mu = 0, sigma = 10)
sigma     <- normal(0 , 5, truncation = c(0, Inf))

# intercept <- variable()
# slope     <- variable()
# sigma     <- variable(lower = 0)

mean <- intercept + slope * log_sold

## --- --- likelihood --- ---

distribution(price) <- normal(mean, sigma)

## --- --- model --- ---

m <- model(intercept, slope, sigma)

# plot(m)

## --- sampling ---

draws <- greta::mcmc(m, n_samples = 2000, chains = 4, warmup = 1000)

# save data 
saveRDS(draws, 'models_greta/linear_regression_simple_draws.rds')
# draws <- readRDS('models_greta/linear_regression_simple_draws.rds')

# cast results (type 'mcmc.list') into tidy tibble
tidy_draws = ggmcmc::ggs(draws)

Bayes_estimates <- tidy_draws %>% 
  group_by(Parameter) %>%
  summarise(mean = mean(value),
            '|95%' = HDInterval::hdi(value)[1],
            '95|%' = HDInterval::hdi(value)[2])

dens <- filter(tidy_draws, Parameter == "slope") %>% pull(value) %>% 
  density()

tibble(
  parameter = dens$x,
  density = dens$y
) %>% 
  ggplot(aes(x = parameter, y = density)) +
  geom_line() +
  geom_area(aes(x = ifelse(parameter > Bayes_estimates[3,3] %>% as.numeric & parameter < Bayes_estimates[3,4] %>% as.numeric , parameter, 0)),
            fill = "firebrick", alpha = 0.5) +
  ylim(0, max(dens$y)) +
  xlim(min(dens$x), max(dens$x)) +
  xlab("slope")

bayesplot::mcmc_pairs(draws)

opt(m)
