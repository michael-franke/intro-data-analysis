library(tidyverse)
library(greta)
library(ggmcmc)
library(bayesplot)

## load the MC data

mc_data_cleaned <- read_csv('data_sets/mental-chrono-data_cleaned.csv')

means_and_diffs <- 
mc_data_cleaned %>% 
  group_by(block) %>% 
  summarise(
    mean_RT = mean(RT)
  ) %>% 
  pivot_wider(
    names_from = block,
    values_from = mean_RT
  ) %>% 
  mutate(
    `discr - gng` = discrimination - goNoGo,
    `gng - react` = goNoGo - reaction,
  )

mc_data_ttest <- 
  mc_data_cleaned %>% 
  filter(block %in% c("discrimination", "goNoGo")) %>% 
  mutate(group = as.numeric(block == "discrimination")) %>% 
  select(RT, group)

RT_goNoGo <- mc_data_ttest %>% filter(group == 0) %>% pull(RT)
RT_discrm <- mc_data_ttest %>% filter(group == 1) %>% pull(RT)

## --- greta model code ---

## --- --- greta data --- ---

y0 <- as_data(RT_goNoGo)
y1 <- as_data(RT_discrm)

## --- --- latent variables --- ---

# regularizing priors that enable a good fit
mean_0   <- normal(430, 50)
delta    <- normal(0, 50)
sigma    <- normal(100, 10, truncation = c(0, Inf))
# # mean_0 <- variable()
# delta     <- variable()
# sigma     <- variable(lower = 0)
mean_1   <- mean_0 + delta

## --- --- likelihood --- ---

distribution(y0) <- normal(mean_0, sigma)
distribution(y1) <- normal(mean_1, sigma)

## --- --- model --- ---

m <- model(mean_0, delta, sigma)
# plot(m)

## --- sampling ---

draws <- greta::mcmc(m, n_samples = 4000)

# save data 
saveRDS(draws, 'models_greta/ttest_draws.rds')
# draws <- readRDS('models_greta/ttest_draws.rds')

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



opt(m)
