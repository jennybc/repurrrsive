#' Game of Thrones POV characters
#'
#' Info on the point-of-view (POV) characters from the first five books in the
#' Song of Ice and Fire series by George R. R. Martin. Retrieved from An API Of
#' Ice And Fire.
#'
#' @format A unnamed list with 30 components, each representing a POV character.
#'   Each character's component is a named list of length 18, containing
#'   information such as name, aliases, and house allegiances.
#'
#' @family Game of Thrones data and functions
#' @source <https://anapioficeandfire.com>
#' @examples
#' got_chars
#' str(lapply(got_chars, `[`, c("name", "culture")))
"got_chars"

#' Paths to Game of Thrones data as JSON and XML
#'
#' @return Local path to JSON or XML file containing Game of Thrones data
#' @export
#'
#' @family Game of Thrones data and functions
#'
#' @examples
#' got_chars_json()
#' if (require("jsonlite")) {
#'   gotcj <- fromJSON(got_chars_json(), simplifyDataFrame = FALSE)
#'   identical(got_chars, gotcj)
#' }
got_chars_json <- function() {
  system.file("extdata", "got_chars.json", package = "repurrrsive")
}

#' @export
#' @rdname got_chars_json
#' @examples
#' got_chars_xml()
#' if (require("xml2")) {
#'   xml <- read_xml(got_chars_xml())
#'   xml
#' }
got_chars_xml <- function() {
  system.file("extdata", "got_chars.xml", package = "repurrrsive")
}
