## https://anapioficeandfire.com

## devtools::install_github("krlmlr/here")
library(here)
library(httr)
library(tidyverse)
library(stringr)
library(listviewer)
library(jsonlite)

## determines number of pages implied by link header in httr response
n_pages <- . %>%
  headers() %>%
  .[["link"]] %>%
  str_split(",") %>%
  .[[1]] %>%
  str_subset('rel=\"last\"') %>%
  str_match("\\?page=([0-9]+)") %>%
  .[ , 2, drop = TRUE] %>%
  as.integer()

## get resource id from URL
get_id <- . %>% basename() %>% as.integer()

## books
## how many books? = # of pages at pageSize = 1
resp <- GET("http://www.anapioficeandfire.com/api/books?pageSize=1")
(n_books <- resp %>% n_pages())
## 12 books

## characters
resp <- GET("http://www.anapioficeandfire.com/api/characters?pageSize=1")
(n_characters <- resp %>% n_pages())
## 2134 characters?!?

## houses
resp <- GET("http://www.anapioficeandfire.com/api/houses?pageSize=1")
(n_houses <- resp %>% n_pages())
## 444 houses?!?

## We will let the 5 main books drive this bus.
## Narrow characters down to POV characters in the 5 main books.
## This will be main list for the package.
## Resolve books and houses that actually appear for these POV characters.

iceandfire <- "http://www.anapioficeandfire.com"

## get all books
iceandfire %>%
  modify_url(path = c("api", "books"), query = list(pageSize = n_books)) %>%
  download.file(here("data-raw", "iceandfire-json", "books.json"))

books <-
  fromJSON(here("data-raw", "iceandfire-json", "books.json"),
           simplifyDataFrame = FALSE)

books_df <- tibble(
     book = books %>% map_chr("name"),
  book_id = books %>% map_chr("url") %>% map_int(get_id),
      pov = books %>% map("povCharacters"),
    n_pov = lengths(pov)
)
books_df
## Confirmed: I can concentrate on only the 5 main books
## A Game of Thrones, A Clash of Kings, A Storm of Swords,
## A Feast for Crows, and A Dance with Dragons
## The others are prequels, graphic novels, etc. and have
## either 0 or 1 povCharacters

## DO NOT, however, filter books_df down to these five books.
## The POV characters are associated with some of these secondary books
## and we use books_df later to look up titles.

pov_urls <- books_df %>%
  filter(book %in% c("A Game of Thrones", "A Clash of Kings",
                     "A Storm of Swords", "A Feast for Crows",
                     "A Dance with Dragons")) %>%
  .[["pov"]] %>%
  unlist() %>%
  unique()

## download JSON for each POV character
pov_df <- tibble(
  url = pov_urls,
  character_id = get_id(url),
  fname = here("data-raw", "iceandfire-json",
               paste0("character-", character_id, ".json"))
)
walk2(pov_df$url, pov_df$fname,
      function(url, file) GET(url) %>% write_lines(file))

## give POV character JSON files better names
pov_df <- pov_df %>%
  mutate(from_api = map(fname, fromJSON),
         name = from_api %>% map_chr("name"),
         fname2 = str_replace(fname, ".json$",
                             paste0("-", str_replace_all(name, "\\s+", "-"), ".json")))
walk2(pov_df$fname, pov_df$fname2, file.rename)
jsonedit(pov_df$from_api)

## download JSON for the houses found in allegiances of POV characters
houses_df <- tibble(
  url = pov_df$from_api %>% map("allegiances") %>% unlist() %>% unique(),
  house_id = get_id(url),
  fname = here("data-raw", "iceandfire-json",
               paste0("house-", house_id, ".json"))
)
walk2(houses_df$url, houses_df$fname,
      function(url, file) GET(url) %>% write_lines(file))

## give house JSON files better names
houses_df <- houses_df %>%
  mutate(from_api = map(fname, fromJSON),
         house = from_api %>% map_chr("name"))
## this should be one nice regex but ... it's not ... wasted too much time here
house_name <- str_match(houses_df$house, "House (.*)")[ , 2, drop = TRUE]
house_name <- map_chr(str_split(house_name, " of"), 1)
houses_df <- houses_df %>%
  mutate(fname2 = str_replace(
    fname, ".json$",
    paste0("-",str_replace_all(house_name, "\\s+", "-"), ".json")))
walk2(houses_df$fname, houses_df$fname2, file.rename)

