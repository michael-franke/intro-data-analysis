suppressPackageStartupMessages(
  source("pkgs.R")
)

options(tinytex.engine_args = '-shell-escape', # to appease the warning spirits
        bookdown.render.file_scope = FALSE)    # incorporate Yihui's suggestion for bookdown issues

# global color scheme
# overwrite ggplot2's color choice for discrete vars
project_colors = carto_pal(11, "Safe")[c(3,4,5,6,7,8,9,10,11,1,2)] # https://github.com/Nowosad/rcartocolor & https://carto.com/carto-colors/
# color blind friendly
# project_colors = c("#000000", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")
# project_colors =RColorBrewer::brewer.pal(8, "Set2")

# setting theme colors globally
## following: https://data-se.netlify.com/2018/12/12/changing-the-default-color-scheme-in-ggplot2/
scale_colour_discrete <- function(...) {
  scale_colour_manual(..., values = project_colors)
}
scale_fill_discrete <- function(...) {
  scale_fill_manual(..., values = project_colors)
} 


knitr::opts_chunk$set(warning = FALSE, message = FALSE, 
                      cache = TRUE, fig.align = 'center')

# use to compile:
# bookdown::render_book("index.Rmd", output_format = "bookdown::gitbook") 

# to create the PDF version
# bookdown::render_book("index.Rmd", "bookdown::pdf_book")

render = function(){
  bookdown::render_book("index.Rmd", output_format = "bookdown::gitbook")
}

# convenience function to save the last plot 

save_last_plot <- function(file_name) {
  ggsave(
    str_c("visuals/graphs_produced/", file_name, ".png"),
    width = 5,
    height = 5
  )
}