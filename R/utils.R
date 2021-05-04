library(httr)
library(dplyr)
library(magrittr)
library(tidyr)
library(writexl)
library(jsonlite)
library(stringr)


# General utils -----------------------------------------------------------

'%!in%' <<- Negate('%in%')

#' Return Object size in megabytes
#'
#' @param obj
#'
#' @return
#' @export
#'
#' @examples
calculateSize <-
function(obj){
  sprintf("Total size %s Mb", object.size(obj) / 1000000)
}


#' Title
#'
#' @param data
#' @param format
#' @param filename
#' @param path
#' @param ...
#'
#' @return
#' @export
#'
#' @examples
downloadData <- function(data, format, filename, path=getwd(), ...){

  if (format %!in% c("csv", "rds", "xlsx")) {
    stop("Invalid Format file. Try with 'csv', 'rds' or 'xlsx'")
  }

  fullPath = paste(file.path(path, filename),".", format, sep="")

  switch (format,
    "csv"  = write.csv(data, file = fullPath),
    "rds"  = saveRDS(data, file = fullPath),
    "xlsx" = write_xlsx(data, path = fullPath)
  )

}

#' Title
#'
#' @param data
#' @param varname
#'
#' @return
#' @export
#'
#' @examples
loadDatainEnvironment <- function(data, varname, ...){
  assign(varname, data, ...)
}


unZipDownload <- function(path, file, format = c("csv", "data"), ...){


  tempf <- tempfile()
  download.file(path, tempf)

  if(format == "csv"){
    data_ <- read.csv(unz(tempf,  paste(file, ".csv", sep= "")), ...)
  } else  {
    data_ <- read.table(unz(tempf,  paste(file, ".", format, sep = "")), ...)
  }

  unlink(tempf)

  return(data_)

}

# Coin Market Cap - API  --------------------------------------------------

#' Title
#'
#' @param API_KEY
#'
#' @return
#' @export
#'
#' @examples
getCryptoData <- function(API_KEY){

  # https://towardsdatascience.com/top-5-best-cryptocurrency-apis-for-developers-32475d2eb749
  # https://cran.r-project.org/web/packages/httr/vignettes/quickstart.html
  # https://medium.com/@traffordDataLab/querying-apis-in-r-39029b73d5f1

  BASE_URL = 'https://pro-api.coinmarketcap.com/v1/cryptocurrency/ohlcv/historical'

  request <- GET(url = BASE_URL,
                 query = list(start = '1',
                              limit = '5000',
                              convert = 'USD'),
                 config = add_headers(
                   "Accepts" = "application/json",
                   "X-CMC_PRO_API_KEY" =  API_KEY
                   )
                 )

}



# Quandl ------------------------------------------------------------------


#' getQuandlStockData
#'
#' @param stock
#' @param database
#'
#' @return
#' @export
#'
#' @examples
getQuandlStockData  <- function(stock, database="WIKI"){

  url = sprintf("https://www.quandl.com/api/v3/datasets/%s/%s.json",database, stock)
  apiData <- fromJSON(url)

  message(sprintf("Loading data from %s", url))

  stockData <- apiData$dataset$data %>% data.frame()
  names(stockData) <- apiData$dataset$column_names

  return(stockData)

}
