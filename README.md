
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

`wesanderson` is a recursive list of color palettes, from the [wesanderson package](https://cran.r-project.org/package=wesanderson).

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
map_chr(wesanderson, 1)
#>  GrandBudapest      Moonrise1         Royal1      Moonrise2     Cavalcanti 
#>      "#F1BB7B"      "#F3DF6C"      "#899DA4"      "#798E87"      "#D8B70A" 
#>         Royal2 GrandBudapest2      Moonrise3      Chevalier         Zissou 
#>      "#9A8822"      "#E6A0C4"      "#85D4E3"      "#446455"      "#3B9AB2" 
#>   FantasticFox     Darjeeling       Rushmore   BottleRocket    Darjeeling2 
#>      "#DD8D29"      "#FF0000"      "#E1BD6D"      "#A42820"      "#ECCBAE"
map_chr(wesanderson[7:9], paste, collapse = ", ")
#>                                GrandBudapest2 
#>          "#E6A0C4, #C6CDF7, #D8A499, #7294D4" 
#>                                     Moonrise3 
#> "#85D4E3, #F4B5BD, #9C964A, #CDC08C, #FAD77B" 
#>                                     Chevalier 
#>          "#446455, #FDD262, #D3DDDC, #C7B19C"
```

Practice bringing data from JSON into an R list.

``` r
library(jsonlite)
#> 
#> Attaching package: 'jsonlite'
#> The following object is masked from 'package:purrr':
#> 
#>     flatten
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
