# dareML

Data Repository for practice with classic Machine Learning algorithms and deep learning models. This repository centralizes, cleans and makes available data sets of different types of tasks (regression, classification, clustering, time series, recommendation systems, etc.) for statistical analysis and the practice of machine learning.

Library for easily obtain simple and real datasets for machine learning projects,practice or study suitable for differente types of algorithms.

## Library Installation

```r
devtools::install_github("abdala9512/dareML")
library(dareML)
```

## Current Data Sources

```r
# show data repositories currently working on dareML
dataSources()
```

* [DataHub.io](https://datahub.io/)
* [WorldBank](https://databank.worldbank.org/home.aspx)
* [Kaggle](https://www.kaggle.com/)
* [UCI machine learning repository](https://archive.ics.uci.edu/ml/index.php)
* [Quandl](https://www.quandl.com/tools/api)


## Examples

Explore Catalog (Each source has its own catalog)

```r
<sourceName>Catalog()

#example
quandlCatalog()
```

loading data in Current R environemnt

```r
load<DataSetNameinCatalog>(mode ="load")

# example - "load" is the default mode
loadVIX()
```

Download data in Current working directory

```r
load<DataSetNameinCatalog>(mode ="download", format = c("csv", "xlsx", "rds"))

# example
loadVIX(mode ="download", format = "csv")
```


# Contact
You can contribute or send me an email to miguel.arquez12@gmail.com :)
