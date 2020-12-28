#' Call iris dataset
#'
#' Ideal dataset for clustering, multi-class
#' problems (tree based models) and EDA.
#'
#' @return \code{iris} dataset with the following columns:
#' \itemize{
#'   \item Sepal.Length
#'   \item Sepal.Width
#'   \item Petal.Length
#'   \item Petal.Width
#'   \item Species
#' }
#' @export
#'
#' @author Miguel Arquez
#'
#' @examples
#' my_iris_df <- getIris()
getIris <-
function(){
  irisDF <- iris
  cat("Classic Iris dataset imported.")
  return(irisDF)
}


#' Load Iris dataset in the current environment
#'
#' Load the iris dataset as a \code{data.frame} object called
#' \code{irisDF}
#'
#' @return
#' @export
#'
#' @examples
#' loadIris()
loadIris <-
function(){
  irisDF <<- iris
  cat("Classic Iris dataset loaded.")
}
