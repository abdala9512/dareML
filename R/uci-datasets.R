
#' UCI Repository functions catalog
#'
#' @return
#' @export
#'
#' @examples
uciCatalog <- function(){
  message("source: https://archive.ics.uci.edu/ml/index.php")
  message("Available datasets:")
  message("|-----------------------------------------|")
  message("|      Dataset      |   Associated task   |")
  message("|-----------------------------------------|")
  message("| Auto MPG Dataset  |     Regression      |")
  message("|-----------------------------------------|")
  message("|  Gender by Name   |   Classification    |")
  message("|-----------------------------------------|")
  message("|   Air Quality     |   Regression - TS   |")
  message("|-----------------------------------------|")
}

#' load or download Auto mpg dataset
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
    "load"     = loadDatainEnvironment(data = autoMPG, varname = "autoMPG", envir = parent.frame()),
    "download" = downloadData(autoMPG, filename ="autoMPG", ...)
  )
}

#' Gender by name - classification dataset
#'
#' @param mode
#' @param ...
#'
#' @return
#' @export
#'
#' @examples
loadGenderByName <- function(mode=c("load", "download"), ...){

 mode <- match.arg(mode)

 message("Dataset information at https://archive.ics.uci.edu/ml/datasets/Gender+by+Name")

 genderBN <- read.csv("https://archive.ics.uci.edu/ml/machine-learning-databases/00591/name_gender_dataset.csv")
 genderBN %<>% rename(Name = `ï..Name`)

 switch (mode,
         "load"     = loadDatainEnvironment(data = genderBN, varname = "genderBN", envir = parent.frame()),
         "download" = downloadData(genderBN, filename ="genderBN", ...)
 )
}



#' airQuality time series dataset
#'
#' @param mode
#' @param ...
#'
#' @return
#' @export
#'
#' @examples
loadAirQuality <- function(mode=c("load", "download"), ...){

  mode <- match.arg(mode)

  message("Dataset information at https://archive.ics.uci.edu/ml/datasets/Air+Quality")

  tempf <- tempfile()
  download.file("https://archive.ics.uci.edu/ml/machine-learning-databases/00360/AirQualityUCI.zip", tempf)
  airQuality <- read.csv(unz(tempf, "AirQualityUCI.csv"), sep =";")
  unlink(tempf)


   airQuality %<>%   select(-c(X, `X.1`)) %>%
    mutate(`CO.GT.`  = as.numeric(str_replace(`CO.GT.`, ",", ".")),
           `C6H6.GT.` = as.numeric(str_replace(`C6H6.GT.`, ",", ".")),
           `T` = as.numeric(str_replace(`T`, ",", ".")),
           RH = as.numeric(str_replace(RH, ",", ".")),
           AH = as.numeric(str_replace(AH, ",", "."))
    )

   switch (mode,
           "load"     = loadDatainEnvironment(data = airQuality, varname = "airQuality", envir = parent.frame()),
           "download" = downloadData(airQuality, filename ="airQuality", ...)
   )
}


