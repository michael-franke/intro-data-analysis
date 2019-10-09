## load packages
suppressPackageStartupMessages(library(tidyverse))
suppressPackageStartupMessages(library(brms))
suppressPackageStartupMessages(library(ggsignif))
suppressPackageStartupMessages(library(gridExtra))
suppressPackageStartupMessages(library(Rlab)) # for dbern (used in appendix; maybe solve differently?)
suppressPackageStartupMessages(library(rcartocolor)) # color-blind friendly palettes: https://github.com/Nowosad/rcartocolor
suppressPackageStartupMessages(library(extraDistr))  # create beta-binomial and bernoulli rvs
# suppressPackageStartupMessages(library(rethinking))

## set defaults
# hrbrthemes::import_public_sans()
theme_set(
  hrbrthemes::theme_ipsum(plot_margin = margin(10, 10, 10, 10)) +
    theme(legend.position = "top")
)
