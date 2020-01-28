library(tidyverse)
library(greta)
library(ggmcmc)
library(bayesplot)



## --- greta model code ---

## --- --- data --- ---

murder_data <- read_csv('data_sets/murder_rates.csv') %>% 
  rename(murder_rate = annual_murder_rate_per_million_inhabitants,
         low_income = percentage_low_income, 
         unemployment = percentage_unemployment) %>% 
  select(murder_rate, low_income, unemployment, population)


# data to be explained / predicted
y <- murder_data %>% pull(murder_rate)
# data to use for prediction / explanation
x <- murder_data %>% pull(unemployment)
y_greta     <- as_data(y)
x_greta     <- as_data(x)
# latent variables and priors
intercept <- student(df= 1, mu = 0, sigma = 10)
slope     <- student(df= 1, mu = 0, sigma = 10)
sigma     <- normal(0, 5, truncation = c(0, Inf))
# derived latent variable (linear model)
y_pred <- intercept + slope * x_greta
# likelihood 
distribution(y) <- normal(y_pred, sigma)
# finalize model, register which parameters to monitor
murder_model <- model(intercept, slope, sigma)

# draw samples
draws_murder_data <- greta::mcmc(
  murder_model, 
  n_samples = 2000, 
  chains = 4, 
  warmup = 1000
)

# save data 
saveRDS(draws_murder_data, 'models_greta/linear_regression_simple_murder_draws.rds')
# draws_murder_data <- readRDS('models_greta/linear_regression_simple_murder_draws.rds')

# get tidy samples
tidy_draws_murder_data <- ggmcmc::ggs(draws_murder_data)


# plot posterior
tidy_draws_murder_data %>% 
  ggplot(aes(x = value)) +
  geom_density(fill = "lightgray", alpha = 0.5) +
  facet_wrap(~ Parameter, scales = "free")


# get means and 95% HDI
Bayes_estimates <- tidy_draws_murder_data %>% 
  group_by(Parameter) %>%
  summarise(
    mean = mean(value),
    '|95%' = HDInterval::hdi(value)[1],
    '95|%' = HDInterval::hdi(value)[2]
  )
Bayes_estimates