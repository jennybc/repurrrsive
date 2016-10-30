str1 <- function(...) utils::str(..., max.level = 1, list.len = 6)
str2 <- function(...) utils::str(..., max.level = 2, list.len = 6)
jsonprint <- function(x) {
  if (!requireNamespace("jsonlite", quietly = TRUE)) {
    stop("Install the jsonlite package if you want to use `jsonprint()`.")
  }
  print(jsonlite::toJSON(unclass(x), pretty = TRUE, auto_unbox = TRUE))
  invisible(x)
}
