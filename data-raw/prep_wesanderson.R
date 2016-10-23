## devtools::install_github("krlmlr/here")
library(here)
library(wesanderson)
library(jsonlite)
library(xml2)
#library(xmlview)
library(tidyverse)

wesanderson <- wes_palettes
use_data(wesanderson, overwrite = TRUE)

list(wesanderson = wes_palettes) %>%
  toJSON() %>%
  prettify() %>%
  writeLines(con = here("inst", "extdata", "wesanderson.json"))

wes_df <- enframe(wes_palettes)

wes_xml <- xml_new_document() %>%
  xml_add_child("package", name = "wesanderson") %>%
  xml_root()
#xml_view(wes_xml)
wes_df$name %>%
  walk(~ xml_add_child(wes_xml, "palette", name = .x))
#xml_view(wes_xml)
f <- function(parent, kids) {
  map(kids, ~ xml_add_child(parent, "hex", .x))
}
map2(xml_children(wes_xml), wes_df$value, ~ f(.x, .y))
#xml_view(wes_xml)
write_xml(wes_xml,
          here("inst", "extdata", "wesanderson.xml"))
