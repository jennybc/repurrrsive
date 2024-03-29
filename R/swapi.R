#' Entities from the Star Wars Universe
#'
#' Data retrieved from the swapi API on the Star Wars Universe.
#'
#' \itemize{
#'   \item `sw_people` List of individual people or characters within the Star Wars universe.
#'   \item `sw_starships` List of transport crafts with hyperdrive capability.
#'   \item `sw_vehicles` List of transport crafts without hyperdrive capability.
#'   \item `sw_films` List of Star Wars films.
#'   \item `sw_species` List of types of people or characters within the Star Wars Universe.
#'   \item `sw_planets` List of large masses, planets or planetoids in the Star Wars Universe, at the time of 0 ABY.
#' }
#'
#' @format Unnamed lists with varying number of components.
#' @source Data originally obtained from `http://swapi.co/` using the rwars
#'   package: <https://github.com/Ironholds/rwars>. The Star Wars API appears to
#'   have moved to `https://pipedream.com/apps/swapi` since that time.
#'
#' @examples
#' # sw_people
#' str(sw_people, max.level = 1)
#' str(sw_people[[1]])
#' sapply(sw_people, `[[`, "name")
#'
#' # sw_films
#' str(sw_films, max.level = 1)
#' str(sw_films[[1]])
#' sapply(sw_films, `[[`, "title")
"sw_people"

#' @format NULL
#' @rdname sw_people
"sw_films"

#' @format NULL
#' @rdname sw_people
"sw_planets"

#' @format NULL
#' @rdname sw_people
"sw_species"

#' @format NULL
#' @rdname sw_people
"sw_vehicles"

#' @format NULL
#' @rdname sw_people
"sw_starships"
