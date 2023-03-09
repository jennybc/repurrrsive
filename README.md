
<!-- README.md is generated from README.Rmd. Please edit that file -->
<!-- badges: start -->

[![CRAN
status](https://www.r-pkg.org/badges/version/repurrrsive)](https://CRAN.R-project.org/package=repurrrsive)
[![R-CMD-check](https://github.com/jennybc/repurrrsive/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/jennybc/repurrrsive/actions/workflows/R-CMD-check.yaml)
[![Codecov test
coverage](https://codecov.io/gh/jennybc/repurrrsive/branch/main/graph/badge.svg)](https://app.codecov.io/gh/jennybc/repurrrsive?branch=main)
<!-- badges: end -->

# repurrrsive

The repurrrsive package provides recursive lists that are handy when
teaching or exampling functions such as `purrr::map()` and the
[rectangling
functions](https://tidyr.tidyverse.org/articles/rectangle.html) in the
tidyr package. The datasets are stored as R list, JSON, and XML to
provide the full non-rectangular data experience. Enjoy!

This package also includes the main data frame from the [gapminder
package](https://CRAN.R-project.org/package=gapminder) in 3 different
forms: simple data frame (no list-columns), data frame nested by
country, and split into a named list of data frames.

## Installation

You can install repurrrsive from CRAN like so:

``` r
install.packages("repurrrsive")
```

or from GitHub with:

``` r
# install.packages("pak")
pak::pak("jennybc/repurrrsive")
```

## Recursive list examples

repurrrsive contains several datasets that are recursive lists, both in
the form of R objects and as JSON and/or XML files.

For example, `got_chars` is a list with information on the 30
point-of-view characters from the first five books in the Song of Ice
and Fire series by George R. R. Martin. Here’s how to use
`purrr::map_chr()` to extract the character’s names:

``` r
library(repurrrsive)
library(purrr)

map_chr(got_chars, "name")
#>  [1] "Theon Greyjoy"      "Tyrion Lannister"   "Victarion Greyjoy" 
#>  [4] "Will"               "Areo Hotah"         "Chett"             
#>  [7] "Cressen"            "Arianne Martell"    "Daenerys Targaryen"
#> [10] "Davos Seaworth"     "Arya Stark"         "Arys Oakheart"     
#> [13] "Asha Greyjoy"       "Barristan Selmy"    "Varamyr"           
#> [16] "Brandon Stark"      "Brienne of Tarth"   "Catelyn Stark"     
#> [19] "Cersei Lannister"   "Eddard Stark"       "Jaime Lannister"   
#> [22] "Jon Connington"     "Jon Snow"           "Aeron Greyjoy"     
#> [25] "Kevan Lannister"    "Melisandre"         "Merrett Frey"      
#> [28] "Quentyn Martell"    "Samwell Tarly"      "Sansa Stark"
```

Each set of recursive lists has its own article that gives a sense of
what sort of manipulations can be demonstrated with the dataset(s):

- Game of Thrones characters
- Data on entities in the Star Wars universe
- GitHub user and repo data
- Sharla Gelfand’s music collection
- Color palettes from Wes Anderson movies

Learn more at <https://jennybc.github.io/repurrrsive/articles/>.

## Nested and split data frames

The Gapminder data, from the [gapminder
package](https://github.com/jennybc/gapminder), is also here in various
forms to allow practice of different styles of grouped computation.

For example, the `gap_nested` dataset has one row per country, with a
nested `data` column containing longitudinal data for life expectancy,
population, and GDP per capita.

``` r
gap_nested
#> # A tibble: 142 × 3
#>    country     continent data             
#>    <fct>       <fct>     <list>           
#>  1 Afghanistan Asia      <tibble [12 × 4]>
#>  2 Albania     Europe    <tibble [12 × 4]>
#>  3 Algeria     Africa    <tibble [12 × 4]>
#>  4 Angola      Africa    <tibble [12 × 4]>
#>  5 Argentina   Americas  <tibble [12 × 4]>
#>  6 Australia   Oceania   <tibble [12 × 4]>
#>  7 Austria     Europe    <tibble [12 × 4]>
#>  8 Bahrain     Asia      <tibble [12 × 4]>
#>  9 Bangladesh  Asia      <tibble [12 × 4]>
#> 10 Belgium     Europe    <tibble [12 × 4]>
#> # … with 132 more rows
```
