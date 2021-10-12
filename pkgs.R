## load packages
library(tidyverse)
library(brms)
library(ggsignif)
library(gridExtra)
# library(Rlab)        # for dbern (used in appendix; maybe solve differently?)
library(rcartocolor) # color-blind friendly palettes: https://github.com/Nowosad/rcartocolor
library(extraDistr)  # create beta-binomial and bernoulli rvs
library(boot)        # bootstrapped (mainly: 95% CIs for the mean)
library(naniar)      # turn numbers (e.g. -5,99,..) into NA (handling of missing values in data sets)
library(latex2exp)   # for TeX in plots
library(cowplot)     # to arrange plots
library(scales)      # to massage scales in plots
# library(greta)       # probabilistic modeling package
# library(ggmcmc)      # tidy Bayes samples
# library(tidybayes)   # tidy Bayes samples
# library(HDInterval)  # credible intervals
# library(binom)       # for binomial confidence intervals 
# library(BSDA)        # for z.test
# library(polspline)   # for reliable density estimates at point-values
# library(GGally)      # for ally plots 
# library(LaplacesDemon) # for student t-distribution with different means and SDs
library(magrittr)    # more fun with pipes
library(zeallot)     # unpacking / multiple assignment operator %<-%
# library(mvtnorm)     # for multi-variate normal (used in lin. regression chapter)
# for visualizing dirichlet distribution; 
# needs github version, see .travis.yml for that
# if (!("dirichlet" %in% installed.packages())) {
#   devtools::install_github("dkahle/dirichlet")
# }
library(dirichlet)
# # same/similar  for aida-package:
# if (!("aida" %in% installed.packages())) {
#   devtools::install_github("michael-franke/aida-package")
# }
# library(aida)

## set defaults
# source("theme_ida.R")
theme_set(
  aida::theme_aida()
)

# parallel execution of Stan code
options(mc.cores = parallel::detectCores())
