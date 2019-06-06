autostatr <- function(data) {
  require("rmarkdown")
  rmarkdown::render("Preprocessing.Rmd", params = list(data=iris))
}

