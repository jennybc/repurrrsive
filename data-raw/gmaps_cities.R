library(tidyverse)
library(jsonlite)

has_key <- !identical(Sys.getenv("GOOGLE_MAPS_API_KEY"), "")
if (!has_key) {
  stop("Needs `GOOGLE_MAPS_API_KEY` env var")
}

# https://developers.google.com/maps/documentation/geocoding
geocode <- function(address, api_key = Sys.getenv("GOOGLE_MAPS_API_KEY")) {
  url <- "https://maps.googleapis.com/maps/api/geocode/json"
  url <- paste0(url, "?address=", URLencode(address), "&key=", api_key)

  read_json(url)
}

# Washington matches Washington state and Washington DC
# Arlington matches Arlington TX and Arlington VA
city <- c("Houston", "Washington", "New York", "Chicago", "Arlington")
city_geo <- map(city, geocode)
write_json(city_geo, "data-raw/gmaps_cities.json", pretty = TRUE)

gmaps_cities <- tibble(city = city, json = city_geo)

# Quick exploration
gmaps_cities |>
  unnest_wider(json) |>
  unnest_longer(results) |>
  unnest_wider(results)

# If re-generating, remember to update date in documentation too
usethis::use_data(gmaps_cities, overwrite = TRUE)

