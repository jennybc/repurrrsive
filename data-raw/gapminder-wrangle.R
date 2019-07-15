library(gapminder)
library(tidyverse)
library(devtools)
library(broom)

gap_simple <- gapminder
use_data(gap_simple, overwrite = TRUE)

gap_nested <- gapminder %>%
  group_by(country, continent) %>%
  nest()
use_data(gap_nested, overwrite = TRUE)

gap_split <- gapminder %>%
  split(gapminder$country)
use_data(gap_split, overwrite = TRUE)

str1(gap_split)
gap_split[[1]]

which(gap_nested$country == "Canada")
canada <- gap_nested$data[[21]]

cor(canada$lifeExp, canada$year)
gap_nested %>%
  mutate(fit = map_dbl(data, ~ cor(.x$lifeExp, .x$year)))

lm(lifeExp ~ year, data = canada)
lm(lifeExp ~ I(year - 1950), data = canada)
gap_nested %>%
  mutate(fit = map(data, ~ lm(lifeExp ~ I(year - 1950), data = .x)))
