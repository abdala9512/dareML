
library(httr)
library(tidyr)
library(jsonlite)

calculateSize <-
function(obj){
  sprintf("Total size %s Mb", object.size(obj) / 1000000)
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

