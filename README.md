# AutoStatR
An R package for automatic exploratory data analysis

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

The Automatic Statistician works on macOS and Linux systems, that have a working installation of the python/R data science platform [Anaconda](https://www.anaconda.com/distribution/). Additionally, [XQuartz](https://www.xquartz.org/) needs to be installed on macOS.

### Installing

Make sure that in your R environment the `devtools`package is installed, or install it with:
```r
install.packages("devtools")
```
Now, install the tpotr R package from GitHub as follows:
```r
devtools::install_github("thllwg/AutoStatR")
```
The Automatic Statistician uses python libraries (e.g. TPOT via tpotr). The required python libraries are installed during package load. On package load, the systems verifies the availability of the required dependencies and installs them (again) if necessary.

## Using AutoStatR

AutoStatR is not delivered with automated unit tests. Instead, the examples in the example directory can be used to test the functionality. 
Usage is as simple as it should be. Select as dataset and use the single function interface of AutoStatR to get the dataset analysed:
```r
# Load the iris dataset
data(iris)

# perform a train_test_split on the dataset
smp_size <- floor(0.95 * nrow(iris))
train_ind <- sample(seq_len(nrow(iris)), size = smp_size)
train <- iris[train_ind, ]
test <- iris[-train_ind, ]

# Call the automatic statistician 
autostatr(data=train, data_to_predict=test, target="Species", type="classif", title="Iris")
```
## Documentation
You can read more about *tpotr* and its application in AutoML in the corresponding [docs](https://thllwg.github.io/tpotr).

## Authors

* **Thorben Hellweg** - [thllwg](https://github.com/thllwg)
* **Christopher Olbrich** - [ChristopherOlbrich](https://github.com/ChristopherOlbrich) 
* **Christian Werner** - [Bl7tzcrank](https://github.com/Bl7tzcrank)

