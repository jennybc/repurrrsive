#' Entities from the Star Wars Universe
#'
#' Data retrieved from the swapi API on the Star Wars Universe.
#'
#' \itemize{
#'   \item \code{sw_people} List of individual people or characters within the Star Wars universe.
#'   \item \code{sw_starships} List of transport crafts with hyperdrive capability.
#'   \item \code{sw_vehicles} List of transport crafts without hyperdrive capability.
#'   \item \code{sw_films} List of Star Wars films.
#'   \item \code{sw_species} List of types of people or characters within the Star Wars Universe.
#'   \item \code{sw_planets} List of large masses, planets or planetoids in the Star Wars Universe, at the time of 0 ABY.
#' }
#'
#' @format Unnamed lists with varying number of components.
#' @source Data comes from \url{http://swapi.co/} retrieved using
#'    the \code{rwars} package: \url{https://github.com/Ironholds/rwars}
#' @examples
#' # sw_people
#' length(sw_people)
#' names(sw_people[[1]])
#' sapply(sw_people, `[[`, "name")
#'
#' # sw_films
#' length(sw_films)
#' names(sw_films[[1]])
#' sapply(sw_films, `[[`, "title")
"sw_people"

#' @rdname sw_people
"sw_films"

#' @rdname sw_people
"sw_planets"

#' @rdname sw_people
"sw_species"

#' @rdname sw_people
"sw_vehicles"

#' @rdname sw_people
"sw_starships"


