data(BreastCancer, package = "mlbench")
df = BreastCancer
df = df[complete.cases(df), ]
df$Id = NULL
df[,1] = as.numeric(df[,1])
df[,2] = as.numeric(df[,2])
df[,3] = as.numeric(df[,3])
df[,4] = as.numeric(df[,4])
df[,5] = as.numeric(df[,5])
df[,6] = as.numeric(df[,6])
df[,7] = as.numeric(df[,7])
df[,8] = as.numeric(df[,8])
df[,9] = as.numeric(df[,9])

smp_size <- floor(0.99 * nrow(df))
## set the seed to make your partition reproducible
set.seed(123)
train_ind <- sample(seq_len(nrow(df)), size = smp_size)

train <- df[train_ind, ]
test <- df[-train_ind, ]

autostatr(data = train, data_to_predict = test, target = "Class", type = "classif", title = "Breast Cancer")
