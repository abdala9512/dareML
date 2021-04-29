


#' Title
#'
#' @param ...
#'
#' @return
#' @export
#'
#' @examples
getVIX <-
function(...){
  #VIX daily from 2004
  vix <- read.csv("https://datahub.io/core/finance-vix/r/vix-daily.csv")
}


#' Title
#'
#' @param ...
#'
#' @return
#' @export
#'
#' @examples
loadVIX <-
function(...){
  vix <<- read.csv("https://datahub.io/core/finance-vix/r/vix-daily.csv")
  message("VIX dataset loaded in the current environment.")
}



#' downloadStockData from Quandl API
#'
#' @param stock
#' @param database
#' @param format
#'
#' @return
#' @export
#'
#' @examples
downloadStockData <- function(stock, database='WIKI', format = c("csv", "rds", "xlsx")){

  data <- getQuandlStockData(stock, database)
  format <- match.arg(format)

  message("See more about Quandl API here https://docs.quandl.com/")

  downloadData(data=data,filename=stock, format=format)

}
