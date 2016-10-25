
-   [repurrrsive](#repurrrsive)
    -   [Installation](#installation)
    -   [Usage](#usage)
        -   [wesanderson color palettes](#wesanderson-color-palettes)
        -   [GitHub user and repo data](#github-user-and-repo-data)

<!-- README.md is generated from README.Rmd. Please edit that file -->
repurrrsive
===========

The repurrrsive package provides recursive lists that are handy when teaching or exampling functions such as `purrr::map()`.

Will eventually be used in this tutorial:

<https://jennybc.github.io/purrr-tutorial/>

Installation
------------

You can install repurrrsive from github with:

``` r
# install.packages("devtools")
devtools::install_github("jennybc/repurrrsive")
```

Usage
-----

*at least one more example on the way ... have an idea?*

#### wesanderson color palettes

`wesanderson` is a recursive list of color palettes, from the [wesanderson package](https://cran.r-project.org/package=wesanderson). Here's a glimpse: one component per palette, each containing a character vector of hex colors.

![](img/wesanderson-listviewer-jsonedit.png)

``` r
devtools::load_all()
#> Loading repurrrsive
library(purrr)
wesanderson[1:3]
#> $GrandBudapest
#> [1] "#F1BB7B" "#FD6467" "#5B1A18" "#D67236"
#> 
#> $Moonrise1
#> [1] "#F3DF6C" "#CEAB07" "#D5D5D3" "#24281A"
#> 
#> $Royal1
#> [1] "#899DA4" "#C93312" "#FAEFD1" "#DC863B"
```

Use `wesanderson` to demonstrate mapping functions over a list.

``` r
map_chr(wesanderson, 1)
#>  GrandBudapest      Moonrise1         Royal1      Moonrise2     Cavalcanti 
#>      "#F1BB7B"      "#F3DF6C"      "#899DA4"      "#798E87"      "#D8B70A" 
#>         Royal2 GrandBudapest2      Moonrise3      Chevalier         Zissou 
#>      "#9A8822"      "#E6A0C4"      "#85D4E3"      "#446455"      "#3B9AB2" 
#>   FantasticFox     Darjeeling       Rushmore   BottleRocket    Darjeeling2 
#>      "#DD8D29"      "#FF0000"      "#E1BD6D"      "#A42820"      "#ECCBAE"
map_int(wesanderson, length)
#>  GrandBudapest      Moonrise1         Royal1      Moonrise2     Cavalcanti 
#>              4              4              4              4              5 
#>         Royal2 GrandBudapest2      Moonrise3      Chevalier         Zissou 
#>              5              4              5              4              5 
#>   FantasticFox     Darjeeling       Rushmore   BottleRocket    Darjeeling2 
#>              5              5              5              7              5
map_chr(wesanderson[7:9], paste, collapse = ", ")
#>                                GrandBudapest2 
#>          "#E6A0C4, #C6CDF7, #D8A499, #7294D4" 
#>                                     Moonrise3 
#> "#85D4E3, #F4B5BD, #9C964A, #CDC08C, #FAD77B" 
#>                                     Chevalier 
#>          "#446455, #FDD262, #D3DDDC, #C7B19C"
```

The same `wesanderson` data is also present as JSON and XML files. Accessor functions provide the local file path.

``` r
wesanderson_json()
#> [1] "/Users/jenny/rrr/repurrrsive/inst/extdata/wesanderson.json"
wesanderson_xml()
#> [1] "/Users/jenny/rrr/repurrrsive/inst/extdata/wesanderson.xml"
```

Practice bringing data from JSON into an R list.

``` r
library(jsonlite)
json <- fromJSON(wesanderson_json())
json$wesanderson[1:3]
#> $GrandBudapest
#> [1] "#F1BB7B" "#FD6467" "#5B1A18" "#D67236"
#> 
#> $Moonrise1
#> [1] "#F3DF6C" "#CEAB07" "#D5D5D3" "#24281A"
#> 
#> $Royal1
#> [1] "#899DA4" "#C93312" "#FAEFD1" "#DC863B"
identical(wesanderson, json$wesanderson)
#> [1] TRUE
```

Practice bringing data into R from XML. You can get it into an R list with `xml2::as_list()`, but to get a list as nice as those above? That requires a bit more work. Such is XML life.

``` r
library(xml2)
xml <- xml2::read_xml(wesanderson_xml())
xml_child(xml)
#> {xml_node}
#> <palette name="GrandBudapest">
#> [1] <hex>#F1BB7B</hex>
#> [2] <hex>#FD6467</hex>
#> [3] <hex>#5B1A18</hex>
#> [4] <hex>#D67236</hex>
as_list(xml_child(xml))
#> [[1]]
#> [[1]][[1]]
#> [1] "#F1BB7B"
#> 
#> 
#> [[2]]
#> [[2]][[1]]
#> [1] "#FD6467"
#> 
#> 
#> [[3]]
#> [[3]][[1]]
#> [1] "#5B1A18"
#> 
#> 
#> [[4]]
#> [[4]][[1]]
#> [1] "#D67236"
#> 
#> 
#> attr(,"name")
#> [1] "GrandBudapest"
```

#### GitHub user and repo data

`gh_users` and `gh_repos` are lists with information for 6 GitHub users and 30 of each user's repositories.

GitHub users.

``` r
library(purrr)
map_chr(gh_users, "login")
#> [1] "gaborcsardi" "jennybc"     "jtleek"      "juliasilge"  "leeper"     
#> [6] "masalmon"
map_chr(gh_users, 18)
#> [1] "Gábor Csárdi"           "Jennifer (Jenny) Bryan"
#> [3] "Jeff L."                "Julia Silge"           
#> [5] "Thomas J. Leeper"       "Maëlle Salmon"
map_df(gh_users, `[`, c("login", "name", "id", "location"))
#> # A tibble: 6 × 4
#>         login                   name       id               location
#>         <chr>                  <chr>    <int>                  <chr>
#> 1 gaborcsardi           Gábor Csárdi   660288         Chippenham, UK
#> 2     jennybc Jennifer (Jenny) Bryan   599454  Vancouver, BC, Canada
#> 3      jtleek                Jeff L.  1571674           Baltimore,MD
#> 4  juliasilge            Julia Silge 12505835     Salt Lake City, UT
#> 5      leeper       Thomas J. Leeper  3505428 London, United Kingdom
#> 6    masalmon          Maëlle Salmon  8360597       Barcelona, Spain
```

First ~30 repos of these users.

``` r
str(gh_repos, max.level = 1)
#> List of 6
#>  $ :List of 30
#>  $ :List of 30
#>  $ :List of 30
#>  $ :List of 26
#>  $ :List of 30
#>  $ :List of 30
map(gh_repos, ~ map_chr(.x, "name")[1:3])
#> [[1]]
#> [1] "after"  "argufy" "ask"   
#> 
#> [[2]]
#> [1] "2013-11_sfu"      "2014-01-27-miami" "2014-05-12-ubc"  
#> 
#> [[3]]
#> [1] "advdatasci"       "advdatasci-swirl" "advdatasci16"    
#> 
#> [[4]]
#> [1] "2016-14"                  "choroplethrCaCensusTract"
#> [3] "choroplethrUTCensusTract"
#> 
#> [[5]]
#> [1] "ampolcourse"     "apsa-leeper.bst" "arco"           
#> 
#> [[6]]
#> [1] "aqi_pdf"               "catan_card_game"       "colourlovers_patterns"
```

Path to JSON files.

``` r
gh_users_json()
#> [1] "/Users/jenny/rrr/repurrrsive/inst/extdata/gh_users.json"
gh_repos_json()
#> [1] "/Users/jenny/rrr/repurrrsive/inst/extdata/gh_repos.json"
```
