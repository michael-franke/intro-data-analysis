## load packages
suppressPackageStartupMessages(library(dplyr))
suppressPackageStartupMessages(library(ggplot2))
suppressPackageStartupMessages(library(brms))
suppressPackageStartupMessages(library(ggsignif))
suppressPackageStartupMessages(library(gridExtra))
suppressPackageStartupMessages(library(rcartocolor)) # color-blind friendly palettes: https://github.com/Nowosad/rcartocolor
# suppressPackageStartupMessages(library(rethinking))

## set defaults
# hrbrthemes::import_public_sans()
theme_set(hrbrthemes::theme_ipsum(plot_margin = margin(10, 10, 10, 10)))
