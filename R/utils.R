library(httr)
library(tidyr)
library(jsonlite)


# General utils -----------------------------------------------------------


calculateSize <-
function(obj){
  sprintf("Total size %s Mb", object.size(obj) / 1000000)
}


downloadData <- function(data, format, filename, path=getwd()){

  fullPath = paste(file.path(path, filename),".", format, sep="")

  switch (format,
    "csv"  = write.csv(data, file = fullPath),
    "rds"  = saveRDS(data, file = fullPath)
  )

}


# Coin Market Cap - API  --------------------------------------------------

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
