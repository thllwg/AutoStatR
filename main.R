require("rmarkdown")
data <- read.csv("./Bank.csv", header = TRUE, sep = ";")
title <- "Bank"
rmarkdown::render("Preprocessing.Rmd", params = list(data= data, title = title))

