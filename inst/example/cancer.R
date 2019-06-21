#Preprocessing
data <- read.csv(url("https://archive.ics.uci.edu/ml/machine-learning-databases/breast-cancer-wisconsin/breast-cancer-wisconsin.data"), header = FALSE)
colnames(data) <- c('Sample code number', 'Clump Thickness','Uniformity of Cell Size','Uniformity of Cell Shape','Marginal Adhesion','Single Epithelial Cell Size','Bare Nuclei','Bland Chromatin','Normal Nucleoli','Mitoses','Class')
missing <- (apply(data, 1, function(x){any(x == "?")}))
data <- data[!missing,]
data$"Bare Nuclei" <- as.integer(as.character(data$"Bare Nuclei"))
data <- data[,c(2:11)]

