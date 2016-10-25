#' Color palettes from Wes Anderson movies
#'
#' A list of color palettes inspired by Wes Anderson movies, taken from the from
#' \code{\link{wesanderson}} package.
#'
#' @format A named list with 15 components, each containing a color palette from
#'   a specific movie. Each palette consists of 4 or 5 hexadecimal color values.
#'
#' @source \url{https://cran.r-project.org/package=wesanderson}
#' @source \url{http://wesandersonpalettes.tumblr.com}
#' @family wesanderson data and functions
#' @examples
#' wesanderson[4:5]
#' wesanderson[["Rushmore"]]
"wesanderson"

#' Path to wesanderson JSON and XML
#'
#' @return Local path to JSON or XML file containing Wes Anderson color palettes
#' @export
#'
#' @family wesanderson data and functions
#' @examples
#' wesanderson_json()
#' if (require("jsonlite")) {
#'   jsonlite::fromJSON(wesanderson_json())
#' }
wesanderson_json <- function() {
  system.file("extdata", "wesanderson.json", package = "repurrrsive")
}

#' @export
#' @rdname wesanderson_json
#' @examples
#' wesanderson_xml()
#' if (require("xml2")) {
#'   xml2::read_xml(wesanderson_xml())
#' }
wesanderson_xml <- function() {
  system.file("extdata", "wesanderson.xml", package = "repurrrsive")
}
