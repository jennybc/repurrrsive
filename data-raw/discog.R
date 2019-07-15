# pak::pkg_install("ewenme/discogger")
library(discogger)

# this will require a DISCOGS_API_TOKEN
discog <- discogs_user_collection(user_name = "sharlagelfand")[["content"]]

# View(discog)

str(discog, max.level = 1, list.len = 3)

discog %>%
  jsonlite::toJSON(null = "null", auto_unbox = TRUE) %>%
  jsonlite::prettify() %>%
  writeLines(here::here("inst", "extdata", "discog.json"))

usethis::use_data(discog, overwrite = TRUE)
