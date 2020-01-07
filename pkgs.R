## load packages
suppressPackageStartupMessages(library(tidyverse))
suppressPackageStartupMessages(library(brms))
suppressPackageStartupMessages(library(ggsignif))
suppressPackageStartupMessages(library(gridExtra))
suppressPackageStartupMessages(library(Rlab)) # for dbern (used in appendix; maybe solve differently?)
suppressPackageStartupMessages(library(rcartocolor)) # color-blind friendly palettes: https://github.com/Nowosad/rcartocolor
suppressPackageStartupMessages(library(extraDistr))  # create beta-binomial and bernoulli rvs
suppressPackageStartupMessages(library(boot))  # bootstrapped (mainly: 95% CIs for the mean)
# suppressPackageStartupMessages(library(rethinking))
suppressPackageStartupMessages(library(naniar)) # turn numbers (e.g. -5,99,..) into NA (handling of missing values in data sets)
suppressPackageStartupMessages(library(latex2exp)) # for TeX in plots
suppressPackageStartupMessages(library(cowplot)) # to arrange plots
suppressPackageStartupMessages(library(scales)) # to massage scales in plots
suppressPackageStartupMessages(library(greta)) # probabilistic modeling package
suppressPackageStartupMessages(library(ggmcmc)) # tidy Bayes samples
suppressPackageStartupMessages(library(HDInterval)) # credible intervals
suppressPackageStartupMessages(library(binom)) # for binomial confidence intervals 


## set defaults
source("theme_ida.R")
theme_set(
  theme_ida()
)

# parallel execution of Stan code
options(mc.cores = parallel::detectCores())
