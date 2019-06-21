require("caTools")

# Preprocessing ---------------------------------------------------------------
df <- read.csv(url("https://archive.ics.uci.edu/ml/machine-learning-databases/breast-cancer-wisconsin/breast-cancer-wisconsin.data"), header = FALSE)
colnames(df) <- c('SampleCodenumber', 'ClumpThickness', 'UniformityOfCellSize',
                  'UniformityofCellShape', 'MarginalAdhesion', 'SingleEpithelialCellSize',
                  'BareNuclei', 'BlandChromatin', 'NormalNucleoli', 'Mitoses', 'Class')
missing <- (apply(df, 1, function(x){any(x == "?")}))
df <- df[!missing,]
df$"BareNuclei" <- as.integer(as.character(df$"BareNuclei"))
df <- df[,c(2:11)]

# Replace numerical values by string to avoid FeatureImp error ----------------
df[df[]["Class"] == 2, "Class"] <- "two"
df[df[]["Class"] == 4, "Class"] <- "four"

# Training and Test Split -----------------------------------------------------
set.seed(101)
sample = sample.split(df$"ClumpThickness", SplitRatio = 2/3)
train = subset(df, sample == TRUE)
test  = subset(df, sample == FALSE)
test[,10] <- NA
data = rbind(train,test)
str(data)

# Call the automatic statistician ---------------------------------------------
autostatr(data=data, target="Class", type="classif", title="Breast Cancer")
