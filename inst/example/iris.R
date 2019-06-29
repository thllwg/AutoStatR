# In this example AutostatR is called with the iris data set. First NA columns are
# added to the data set. This columns are detected by autostat and used for prediction.

# Add NA columns to the iris set ----------------------------------------------
iris.data <- iris
iris.data[c(1:10),5] <- NA

# Call the automatic statistician ---------------------------------------------
autostatr(data=iris.data, target="Species", type="classif", title="Iris")

