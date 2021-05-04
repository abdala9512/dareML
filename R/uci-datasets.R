
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
  message("|  Dow Jones Index  |         TS          |")
  message("|-----------------------------------------|")
  message("|   Bike Sharing    |     Regression      |")
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


  airQuality <- unZipDownload(path = "https://archive.ics.uci.edu/ml/machine-learning-databases/00360/AirQualityUCI.zip",
                              file = "AirQualityUCI",
                              format = "csv",
                              sep = ";")

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



#' dowJones index Time Series Dataset
#'
#' @param mode
#' @param ...
#'
#' @return
#' @export
#'
#' @examples
loadDowJonesIndex <- function(mode=c("load", "download"), ...){

  mode <- match.arg(mode)

  message("Dataset information at https://archive.ics.uci.edu/ml/datasets/Dow+Jones+Index")


  dowJones <- unZipDownload(path = "https://archive.ics.uci.edu/ml/machine-learning-databases/00312/dow_jones_index.zip",
                            file = "dow_jones_index",
                            format = "data",
                            sep = ",",
                            header = T)

  priceCols <- c("open", "high", "low", "close",
                 "next_weeks_open", "next_weeks_close")

  dowJones[priceCols] <- lapply(dowJones[priceCols], function(x) as.numeric(sub( ".", "", x)))

  switch (mode,
          "load"     = loadDatainEnvironment(data = dowJones, varname = "dowJones", envir = parent.frame()),
          "download" = downloadData(dowJones, filename ="dowJones", ...)
  )

}

#' load Bike Sharing data
#'
#' @param mode
#' @param ...
#'
#' @return
#' @export
#'
#' @examples
loadBikeSharing <- function(mode=c("load", "download"), ...){

  files <- c("day", "hour")

  # https://archive.ics.uci.edu/ml/datasets/Bike+Sharing+Dataset
  mode <- match.arg(mode)

  message("Dataset information at https://archive.ics.uci.edu/ml/datasets/Bike+Sharing+Dataset")

  for (i in seq_along(files)) {

    dataset <- unZipDownload(path = "https://archive.ics.uci.edu/ml/machine-learning-databases/00275/Bike-Sharing-Dataset.zip",
                              file = files[i],
                              format = "csv",
                              sep = ",",
                              header = T)

    dataName <- paste("bikeSharing", files[i], sep="")

    switch (mode,
            "load"     = loadDatainEnvironment(data = dataset, varname = dataName, envir = parent.frame()),
            "download" = {

              downloadData(dataset, filename = paste(dataName,".csv"), ...)
              message(paste("Downloaded", dataName))
            }
    )
  }


}

