#

gecko_api_base_url <- function() {"https://api.coingecko.com/api/v3"}

#' getBitcoin data function
#'
#' @param ...
#'
#' @return
#' @export
#'
#' @examples
getBitcoin <- function(...){
  currentPrice <- fromJSON(paste0(gecko_api_base_url(), "/simple/price?ids=bitcoin&vs_currencies=usd"))
  return(currentPrice$bitcoin$usd)
}
