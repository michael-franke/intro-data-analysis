library(tidyverse)
library(brms)

# mental chronometry data
mc_data_cleaned <- read_csv('data_sets/mental-chrono-data_cleaned.csv') %>% 
  mutate(
    block = case_when(
      block == "reaction"         ~ "B_reaction",
      block == "goNoGo"           ~ "A_goNoGo",
      block == "discrimination"   ~ "C_discrimination"
    )
  )

fit_brms_mc <- brm(
  # model 'RT' as a function of 'block'
  formula = RT ~ block,
  data = mc_data_cleaned
)

# save data 
saveRDS(fit_brms_mc, 'models_brms/mc_data_fit.rds')
# fit_brms_mc <- readRDS('models_brms/mc_data_fit.rds')
