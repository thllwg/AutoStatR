require("rmarkdown")
data <- read.csv("./Bank.csv", header = TRUE, sep = ";")
rmarkdown::render("Preprocessing.Rmd", params = list(data= data))

