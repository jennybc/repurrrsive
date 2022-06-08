#' Sharla Gelfand's music collection
#'
#' A music collection, as represented in a recursive list returned from the
#' Discogs API.
#'
#' @format A unnamed list with 155 components, each representing an item in
#'   Sharla's music collection.
#'
#' @source
#'   * Data retrieved on 2019-07-15 from <https://www.discogs.com>
#'   * Original blog post by Sharla Gelfand
#'   <https://sharla.party/post/discog-purrr/>
#'
#' @family Discogs data and functions
#'
#' @examples
#' length(discog)
#'
#' str(discog, max.level = 2, list.len = 2)
#'
#' vapply(discog[1:6], `[[`, c("basic_information", "title"), FUN.VALUE = "")
"discog"

#' Path to Discogs data as JSON
#'
#' @return Local path to JSON file containing Discogs data
#' @export
#'
#' @family Discogs data and functions
#'
#' @examples
#' discog_json()
#' if (require("jsonlite")) {
#'   d <- fromJSON(discog_json(), simplifyVector = FALSE)
#'   identical(discog, d)
#' }
discog_json <- function() {
  system.file("extdata", "discog.json", package = "repurrrsive")
}
