
source("utils.R", encoding = "UTF-8")

#' Title
#'
#' @return
#' @export
#'
#' @examples
loadAutoMPG <- function(mode=c("load", "download"), ...){

  mode <- match.arg(mode)

  message("Dataset information at https://archive.ics.uci.edu/ml/datasets/Auto+MPG")
  autoMPG <- read.table("https://archive.ics.uci.edu/ml/machine-learning-databases/auto-mpg/auto-mpg.data")

  columnNames <- c("mpg",
                   "cylinders",
                   "displacement",
                   "horsepower",
                   "weight",
                   "acceleration",
                   "model year",
                   "origin",
                   "car name")

  names(autoMPG) <- columnNames

  switch (mode,
    "load"     = loadDatainEnvironment("autoMPG", autoMPG),
    "download" = downloadData(autoMPG, filename ="autoMPG", ...)
  )
}
