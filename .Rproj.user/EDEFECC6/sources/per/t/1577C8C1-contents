#' Creating a report with the Automated Statistican.
#'
#' \code{autostatr} creates a report for the dataset given as a functions argument.
#'
#'
#' @param data data.frame containing the data the report should be based upon on.
#' @param data_to_predict You can provide data that you want to be predicted as a data.frame
#' if you don't provide \code{data_to_predict}, the tools looks for \code{NA} target values in
#' \code{data}.
#' @param target character name of the target column in data (and data_to_predict)
#' @param type character type of ML-procedure. Only classification is supported.
#' @param output_dir character target folder for report
#' @param title Name of the report.
#' @return Report can be found at \code{output_dir}
#' @export
autostatr <- function(data, data_to_predict=NULL, target,
                      type = c("regr","classif"),
                      output_dir = "~/Desktop",
                      title) {

  # Checking arguments --------------------------------------------------------
  checkmate::assertDataFrame(data)
  checkmate::assertDataFrame(data_to_predict, null.ok = TRUE)
  if (!is.null(data_to_predict)){
    checkmate::assertTRUE((ncol(data)-ncol(data_to_predict))<=1)
  }
  checkmate::assertChoice(type, "classif")
  checkmate::assertCharacter(title)


  # Convert target column to factor -------------------------------------------
  if(!is.factor(data[,target])){
    data[,target] <- as.factor(data[,target])
  }

  # Identify train and test data ----------------------------------------------
  test <- data[is.na(data[target]),]
  train <- data[!is.na(data[target]),]
  if(!is.null(data_to_predict)){
    test <- rbind(data_to_predict,test)
  }
  print(train)

  # Render the Report ---------------------------------------------------------
  rmarkdown::render(system.file("rmarkdown", "Report.Rmd",
                                package = "AutoStatR"),
                    params = list(data = train, data_to_predict = test,
                                  target = target, type = type, title = title),
                    output_dir = output_dir)
}

