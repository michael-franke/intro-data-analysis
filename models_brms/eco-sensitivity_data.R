library(tidyverse)
library(brms)

# eco-sensitivity data
x_A <- c(
  104, 105, 100, 91, 105, 118, 164, 168, 111, 107, 136, 149, 104, 114, 107, 95, 
  83, 114, 171, 176, 117, 107, 108, 107, 119, 126, 105, 119, 107, 131
)
x_B <- c(
  133, 115, 84, 79, 127, 103, 109, 128, 127, 107, 94, 95, 90, 118, 124, 108, 
  87, 111, 96, 89, 106, 121, 99, 86, 115, 136, 114
)

eco_sensitivity_data <- tibble(
  group = c(rep("A", length(x_A)), rep("B", length(x_B))),
  measurement = c(x_A, x_B)
) 

fit_brms_eco_sensitivity <- brm(
  # specify what to explain in terms of what
  #  using the formula syntax
  formula = measurement ~ group,
  # which data to use
  data = eco_sensitivity_data
)

# save data 
saveRDS(fit_brms_murder, 'models_brms/fit_brms_eco_sensitivity.rds')
# fit_brms_eco_sensitivity <- readRDS('models_brms/fit_brms_eco_sensitivity.rds')
