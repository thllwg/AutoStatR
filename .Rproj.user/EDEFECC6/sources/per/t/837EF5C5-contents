library(mlbench)
library(mlr)
library(caret)

data("Glass")

## 75% of the sample size
## set the seed to make your partition reproducible
set.seed(123)
train_ind <- createDataPartition(Glass$Type, p = .75,
                                 list = FALSE,
                                 times = 1)

train <- Glass[train_ind, ]
test <- Glass[-train_ind, ]

autostatr(data = train, data_to_predict =  test, target = "Type", type = "classif", title= "Glass")
