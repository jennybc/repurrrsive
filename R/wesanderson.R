#' Color palettes from Wes Anderson movies
#'
#' A list of color palettes inspried by Wes Anderson movies, taken from the from
#' \code{\link{wesanderson}} package.
#'
#' @format A data frame with 53940 rows and 10 variables:
#' \describe{
#'   \item{price}{price, in US dollars}
#'   \item{carat}{weight of the diamond, in carats}
#'   ...
#' }
#' @source \url{https://cran.r-project.org/package=wesanderson}
#' @source \url{http://wesandersonpalettes.tumblr.com}
"wesanderson"

#' Path to wesanderson JSON
#'
#' @return Local path to JSON file containing Wes Anderson color palettes
#' @export
#'
#' @examples
#' wesanderson_json()
#' if (require("jsonlite")) {
#' jsonlite::fromJSON(wesanderson_json())
#' }
wesanderson_json <- function() {
  system.file("extdata", "wesanderson.json", package = "repurrrsive")
}

#' Path to wesanderson XML
#'
#' @return Local path to XML file containing Wes Anderson color palettes
#' @export
#'
#' @examples
#' wesanderson_xml()
#' if (require("xml2")) {
#' read_xml(wesanderson_xml())
#' }
wesanderson_xml <- function() {
  system.file("extdata", "wesanderson.xml", package = "repurrrsive")
}
