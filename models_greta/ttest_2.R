library(tidyverse)
library(greta)
library(ggmcmc)
library(bayesplot)

## get fictitious data from two groups (same as in HW 9)

x_A <- c(
  104, 105, 100, 91, 105, 118, 164, 168, 111, 107, 136, 149, 104, 114, 107, 95, 
  83, 114, 171, 176, 117, 107, 108, 107, 119, 126, 105, 119, 107, 131
)
x_B <- c(
  133, 115, 84, 79, 127, 103, 109, 128, 127, 107, 94, 95, 90, 118, 124, 108, 
  87, 111, 96, 89, 106, 121, 99, 86, 115, 136, 114
)

mean(x_A)
mean(x_B)

# data as greta array
y0 <- as_data(x_A)
y1 <- as_data(x_B)
# priors (regularizing (data-informed) for smooth fitting)
sd_delta <- sd(c(x_A,x_B))
mean_0   <- normal(mean(x_A), 10)
delta    <- normal(0, sd_delta)
sigma_0  <- normal(sd(x_A), 10, truncation = c(0, Inf))
sigma_1  <- normal(sd(x_B), 10, truncation = c(0, Inf))
mean_1   <- mean_0 + delta
# likelihood 
distribution(y0) <- normal(mean_0, sigma_0)
distribution(y1) <- normal(mean_1, sigma_1)
# model
m <- model(delta)
# sampling
draws_t_test_t <- greta::mcmc(m, n_samples = 4000)

# save data 
saveRDS(draws_t_test_2, 'models_greta/ttest_2_draws.rds')
# draws_t_test_2 <- readRDS('models_greta/ttest_2_draws.rds')

# cast results (type 'mcmc.list') into tidy tibble
tidy_draws_tt2 = ggmcmc::ggs(draws_t_test_2)

Bayes_estimates <- tidy_draws_tt2 %>% 
  group_by(Parameter) %>%
  summarise(mean = mean(value),
            '|95%' = HDInterval::hdi(value)[1],
            '95|%' = HDInterval::hdi(value)[2])

dens <- filter(tidy_draws_tt2, Parameter == "delta") %>% pull(value) %>% 
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

# estimating density of posterior at delta = 0 with Savage-Dickey
delta_samples <- tidy_draws_tt2 %>% filter(Parameter == "delta") %>% pull(value)
fit.posterior <- polspline::logspline(delta_samples)
posterior_delta_null <- polspline::dlogspline(0, fit.posterior)
prior_delta_null <- dnorm(0,0,sd_delta) 
BF_delta_null = posterior_delta_null / prior_delta_null

# estimating BF for ROPE-d hypothesis with encompassing priors
# set the scene
delta_null <- 0
epsilon <- 0.25          # epsilon margin for ROPE
upper <- delta_null + epsilon   # upper bound of ROPE
lower <- delta_null - epsilon   # lower bound of ROPE
# calculate prior odds of the ROPE-d hypothesis
prior_of_hypothesis <- pnorm(upper, 0, sd_delta) - pnorm(lower, 0, sd_delta)
prior_odds <- prior_of_hypothesis / (1 - prior_of_hypothesis)
# calculate posterior odds of the ROPE-d hypothesis
posterior_of_hypothesis <- mean( lower <= delta_samples & delta_samples <= upper )
posterior_odds <- posterior_of_hypothesis / (1 - posterior_of_hypothesis)
# calculate Bayes Factor
bf_ROPEd_hypothesis <- posterior_odds / prior_odds
bf_ROPEd_hypothesis

