d <- iris
d[c(1:10),5] <- NA

autostatr <- function(data, data_to_predict=NULL, target,
                      type = c("regr","classif"),
                      explain = c("importance","lime","ale"),
                      output_dir = "~/Desktop",
                      title) {

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
  rmarkdown::render(system.file("rmarkdown", "Preprocessing.Rmd",
                                package = "AutoStatR"),
                    params = list(data = train, data_to_predict = test,
                                  target = target, type = type, title = title),
                    output_dir = output_dir)
}

