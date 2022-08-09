#' Gapminder data frame in various forms
#'
#' The main data frame from the `gapminder` package in three forms:
#' \enumerate{
#' \item `gap_simple`, same as `gapminder::gapminder`
#' \item `gap_nested`, nested by country and continent
#' \item `gap_split`, split by country
#' }
#'
#' @examples
#' gap_simple
#' gap_nested
#'
#' str(gap_split, max.level = 1, list.len = 10)
#' str(gap_split[[1]])
"gap_simple"

#' @format NULL
#' @rdname gap_simple
"gap_nested"

#' @format NULL
#' @rdname gap_simple
"gap_split"
