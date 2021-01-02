

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
