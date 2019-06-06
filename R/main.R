autostatr <- function(data) {
  require("rmarkdown")
  rmarkdown::render(system.file("rmarkdown", "Preprocessing.Rmd", package = "AutoStatR"), params = list(data=iris),output_dir = "~/Desktop")
}

