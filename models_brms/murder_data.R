library(tidyverse)
library(brms)

murder_data <- read_csv('data_sets/murder_rates.csv') %>% 
  rename(murder_rate = annual_murder_rate_per_million_inhabitants,
         low_income = percentage_low_income, 
         unemployment = percentage_unemployment) %>% 
  select(murder_rate, low_income, unemployment, population)

fit_brms_murder <- brm(
  # specify what to explain in terms of what
  #  using the formula syntax
  formula = murder_rate ~ unemployment,
  # which data to use
  data = murder_data
)

# save data 
saveRDS(fit_brms_murder, 'models_brms/murder_data.rds')
# fit_brms_murder <- readRDS('models_brms/murder_data.rds')
