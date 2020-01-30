library(tidyverse)
library(brms)

# mental chronometry data
politeness_data <- read_csv('data_sets/politeness_data.csv') 

fit_brms_politeness <- brm(
  # model 'pitch' as a function of 'gender' and 'context',
  #  also including the interaction between `gender` and `context`
  formula = pitch ~ gender * context,
  data = politeness_data
)

# save data 
saveRDS(fit_brms_politeness, 'models_brms/politeness_fit.rds')
# fit_brms_politeness <- readRDS('models_brms/politeness_fit.rds')
