# Add NA columns to the iris set for prediction -------------------------------
iris <- iris
data <- iris
data[c(1:10),5] <- NA

# Call the automatic statistician ---------------------------------------------
autostatr(data=data, target="Species", type="classif", title="Iris")
