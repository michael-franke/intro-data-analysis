#! /usr/bin/Rscript --no-init-file

## choose webbook style: "tufte" or "git"
style <- "git"

t_alpha <- Sys.time()
if (!("cliapp" %in% installed.packages())){
  install.packages("cliapp")
}
library(cliapp)
start_app(theme = simple_theme())


cli_h1("Let's build a book!")

## clean up
cli_h2("Clean up")
cli_alert("Deleting old output...")
unlink("_book", recursive = TRUE)
unlink("_bookdown_files", recursive = TRUE)
cli_alert_success("done")


## rendering
cli_h2("Rendering")
#### webbook
cli_alert("Rendering webbook...")
if (style == "git"){
  invisible(
    bookdown::render_book("index.Rmd", 
                          output_format = "bookdown::gitbook",
                          quiet = TRUE, clean_envir = FALSE)
  )
  cli_alert_success("done")
} else if (style == "tufte"){
  invisible(
    bookdown::render_book("index.Rmd", 
                          output_format = "bookdown::tufte_html_book",
                          quiet = TRUE, clean_envir = FALSE)
  )
  cli_alert_success("done")
} else {
  cli_alert_danger("No style selected: choose either \"git\" or \"tufte\".")
  cli_alert_warning("Skipping webbook rendering.")
}

#### pdf
cli_alert("Rendering PDF...")
invisible(
  bookdown::render_book("index.Rmd", 
                        output_format = "bookdown::pdf_book",
                        quiet = TRUE, clean_envir = FALSE)
)
cli_alert_success("done")

#### epub
cli_alert("Rendering epub...")
invisible(
  bookdown::render_book("index.Rmd", 
                        output_format = "bookdown::epub_book",
                        quiet = TRUE, clean_envir = FALSE)
)
cli_alert_success("done")

## copy files
cli_h2("Copying files")
# not yet implemented, mb even unnecessary?

## Finalize
cli_h2("Finished!")
t_omega <- Sys.time()
t_delta <- round(as.numeric(difftime(t_omega, t_alpha, "s")), 2)
cli_alert_info(timestamp(quiet = TRUE))
cli_alert_info(paste("## The whole thing took about", t_delta, "seconds."))

# cleanup
rm(style, t_alpha, t_delta, t_omega)