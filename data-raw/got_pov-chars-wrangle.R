library(here)
library(jsonlite)
library(assertthat)
library(tidyverse)
## devtools::install_github("jennybc/xml2@as-xml-first-try")
## experimental as_xml() in this branch of my fork, used below
library(xml2)

## get resource id from URL
get_id <- . %>% basename() %>% as.integer()

books <- fromJSON(
  here("data-raw", "iceandfire-json", "books.json"),
  simplifyDataFrame = FALSE
)
assert_that(length(books) == 12)
#str(books, max.level = 1)
#View(books)

books_df <- tibble(
  book = books %>% map_chr("name"),
  book_id = books %>% map_chr("url") %>% map_int(get_id),
  pov = books %>% map("povCharacters"),
  n_pov = lengths(pov)
)
books_df

pov_json_files <- list.files(
  here("data-raw", "iceandfire-json"),
  pattern = "^character",
  full.names = TRUE
)
assert_that(length(pov_json_files) == 30)

pov_df <- tibble(
  from_api = map(pov_json_files, fromJSON),
  name = from_api %>% map_chr("name")
)

houses_json_files <- list.files(
  here("data-raw", "iceandfire-json"),
  pattern = "^house",
  full.names = TRUE
)
assert_that(length(houses_json_files) == 17)
houses_df <- tibble(
  from_api = map(houses_json_files, fromJSON),
  house = from_api %>% map_chr("name"),
  house_id = from_api %>% map_chr("url") %>% get_id()
)

## each character has two book components: povBooks and books
##   each holds a list of books as API URLs
##   swap out with book names
##   simplify to atomic character vector at same time
## each character has an allegiance component
##   holds a list of houses as API URLs
##   swap out with house names
##   simplify to atomic character vector at same time
book_lookup <- function(i) books_df$book[match(i, books_df$book_id)]
house_lookup <- function(i) houses_df$house[match(i, houses_df$house_id)]
pov_df <- pov_df %>%
  mutate(from_api = map(from_api, function(chr_list) {
    if (length(chr_list$povBooks) > 0) {
      chr_list$povBooks <- chr_list$povBooks %>%
        map_int(get_id) %>%
        map_chr(book_lookup)
    }
    if (length(chr_list$books) > 0) {
      chr_list$books <- chr_list$books %>%
        map_int(get_id) %>%
        map_chr(book_lookup)
    }
    if (length(chr_list$allegiances) > 0) {
      chr_list$allegiances <- chr_list$allegiances %>%
        map_int(get_id) %>%
        map_chr(house_lookup)
    }
    chr_list
  }))
View(pov_df)

## create integer and logical elements for each character for pedagogy
pov_df <- pov_df %>%
  mutate(from_api = map(from_api, function(chr_list) {
    ## logical vector
    chr_list$alive <- !nzchar(chr_list$died)
    ## integer vector
    chr_list$id <- chr_list$url %>% get_id()
    ## insert them in logical locations
    nms <- c("url", "id",
             "name", "gender", "culture", "born", "died", "alive",
             "titles", "aliases", "father", "mother", "spouse",
             "allegiances", "books", "povBooks", "tvSeries", "playedBy")
    chr_list[nms]
  }))
View(pov_df)

## this is the basically the list that will go in the package
got_chars <- pov_df$from_api

## Delete Cersei's alias
cersei <- which(map_chr(got_chars, "name") == "Cersei Lannister")
got_chars[[cersei]][["aliases"]] <- list()


use_data(got_chars, overwrite = TRUE)

## null = "null" is necessary for roundtrips to work:
## list --> JSON --> original list
got_chars %>%
  toJSON(null = "null", auto_unbox = TRUE) %>%
  prettify() %>%
  writeLines(here("inst", "extdata", "got_chars.json"))

got_chars %>%
  xml2:::as_xml() %>%
  as.character() %>% ## workaround to get explicit UTF-8 encoding
  read_xml() %>%
  write_xml(here("inst", "extdata", "got_chars.xml"))
