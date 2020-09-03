cat("\n\ndelete old output...\n")
unlink("_book", recursive = TRUE)
unlink("_bookdown_files", recursive = TRUE)
unlink("I2DA.Rmd")

cat("\n\nrender gitbook...\n")
bookdown::render_book("index.Rmd", quiet = TRUE,
                      output_format = "bookdown::gitbook")

# cat("\n\nrender pdf...")
# bookdown::render_book("index.Rmd", quiet = FALSE,
#                       output_format = "bookdown::pdf_book")