cat("delete old output...")
unlink("_book", recursive = TRUE)
unlink("_bookdown_files", recursive = TRUE)
unlink("I2DA.Rmd")

cat("render gitbook...")
bookdown::render_book("index.Rmd", 
                      output_format = "bookdown::gitbook",
                      quiet = TRUE, clean_envir = FALSE)

# cat("render pdf...")
# bookdown::render_book("index.Rmd",
#                       output_format = "bookdown::pdf_book",
#                       quiet = TRUE, clean_envir = FALSE)