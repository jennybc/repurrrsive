## devtools::install_github("krlmlr/here")
library(here)
library(wesanderson)
library(devtools)
library(jsonlite)
library(xml2)
# library(xmlview)
library(purrr)

wesanderson <- wes_palettes
use_data(wesanderson, overwrite = TRUE)

list(wesanderson = wes_palettes) %>%
  toJSON() %>%
  prettify() %>%
  writeLines(here("inst", "extdata", "wesanderson.json"))

wes_xml <- xml_new_document() %>%
  xml_add_child("package", name = "wesanderson") %>%
  xml_root()
# xml_view(wes_xml)
walk2(names(wes_palettes), wes_palettes, function(pal_name, pal_cols) {
  pal_node <- xml_add_child(wes_xml, "palette", name = pal_name)
  map(pal_cols, ~ xml_add_child(pal_node, "hex", .x))
})
# xml_view(wes_xml)

write_xml(
  wes_xml,
  here("inst", "extdata", "wesanderson.xml")
)

## my personal XML journey
# wes_xml2 <- xml_new_document() %>%
#   xml_add_child("package", name = "wesanderson") %>%
#   xml_root()
# xml_view(wes_xml2)

## install parents (= palette nodes)
# names(wesanderson) %>%
#   walk(~ xml_add_child(wes_xml2, "palette", name = .x))
#  xml_view(wes_xml)

## install children (= colors inside palettes)
# f <- function(parent, kids) {
#   map(kids, ~ xml_add_child(parent, "hex", .x))
# }
# walk2(xml_children(wes_xml), wesanderson, ~ f(.x, .y))
# xml_view(wes_xml)
