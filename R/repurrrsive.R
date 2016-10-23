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
