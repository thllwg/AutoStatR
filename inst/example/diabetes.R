library("mlbench")
data(PimaIndiansDiabetes, package = "mlbench")
df <- PimaIndiansDiabetes

# Select test split -----------------------------------------------------------
smp_size <- floor(0.99 * nrow(df))

# Set the seed to make partition reproducible ---------------------------------
set.seed(43)
train_ind <- sample(seq_len(nrow(df)), size = smp_size)
train <- df[train_ind, ]
test <- df[-train_ind, ]

# Call the automatic statistician ---------------------------------------------
autostatr(data = train, data_to_predict = test, target = "diabetes", type = "classif", title = "Diabetes")

