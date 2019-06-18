# The following code illustrates how the Automatic statitician can be used on
# the iris data set.

# load the iris data
iris <- iris
d <- iris
d[c(1:10),5] <- NA

# Call the automatic statistician
autostatr(data=d, target="Species", type="classif", title="Iris")
