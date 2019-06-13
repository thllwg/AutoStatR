autostatr <- function(data, target,
                      type = c("regr","classif"),
                      output_dir = "~/Desktop") {

  # Render the Report ---------------------------------------------------------
  rmarkdown::render(system.file("rmarkdown", "Preprocessing.Rmd",
                                package = "AutoStatR"),
                    params = list(data = data, target = target, type = type),
                    output_dir = output_dir)
}

