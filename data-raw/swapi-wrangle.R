## Data from http://swapi.co/
## retreived using https://github.com/Ironholds/rwars

# install.packages("rwars")
library(rwars)
library(purrr)
library(devtools)

# recursive function to travel down next pages
get_all <- function(x = NULL, old_data = NULL, fun, ...){
  data <- fun(x, ...)
  next_url <- getElement(data, "next")
  if(is_null(next_url)) {
    return(append(old_data, list(data)))
  } else {
    get_all(next_url, append(old_data, list(data)), fun, ...)
  }
}

entities <- c("species", "people", "films", "vehicles", "starships",
  "planets")
entity_funs <- map(paste0("get_all_", entities), match.fun)

all_ents <- map(entity_funs, ~ get_all(fun = .x, parse_result = TRUE))

all_ents_res <- map(all_ents,
  ~ transpose(.x)[["results"]] %>% flatten())

walk2(paste0("sw_", entities), all_ents_res, assign,
  envir = globalenv())

use_data(sw_films, sw_people, sw_planets, sw_species, sw_starships,
  sw_vehicles, overwrite = TRUE)
