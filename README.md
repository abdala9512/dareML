# dareML

Data Repository for practice with classic Machine Learning algorithms and deep learning models.

Library for easily obtain clean and real datasets for machine learning projects or practice, suitable for differente types of algorithms.

## Installation

```r
devtools::install_github("abdala9512/dareML")
library(dareML)
```


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

## Current Sources

* [DataHub.io](https://datahub.io/)
* [WorldBank](https://databank.worldbank.org/home.aspx)
* [Kaggle](https://www.kaggle.com/)
* [UCI machine learning repository](https://archive.ics.uci.edu/ml/index.php)
* [Quandl](https://www.quandl.com/tools/api)


# Contact
You can contribute or send me an email to miguel.arquez12@gmail.com :)
