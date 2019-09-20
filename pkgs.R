## load packages
suppressPackageStartupMessages(library(dplyr))
suppressPackageStartupMessages(library(ggplot2))
suppressPackageStartupMessages(library(brms))
suppressPackageStartupMessages(library(ggsignif))
# suppressPackageStartupMessages(library(rethinking))

## set defaults
# hrbrthemes::import_public_sans()
theme_set(hrbrthemes::theme_ipsum(plot_margin = margin(10, 10, 10, 10)))
