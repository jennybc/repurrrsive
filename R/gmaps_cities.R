#' Geocoded cities from Google Maps
#'
#' This tibble contains the results of geocoding five cities
#' ("Houston", "Washington", "New York", "Chicago", "Arlington") using
#' the Google Maps API on 2022-06-08. Two cities, Washington and Arlington,
#' were deliberately picked for their ambiguity: Washington could refer
#' to the city or the state, and Arlington could mean the one in Virginia or
#' the one in Texas.
#'
#' @format A tibble with 5 rows and two columns. `city` gives the original
#' search term and `json` gives the returned JSON converted to a list.
#' @source <https://developers.google.com/maps/documentation/geocoding>
#' @examples
#' gmaps_cities
"gmaps_cities"
