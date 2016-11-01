## devtools::install_github("krlmlr/here")
library(here)
library(tibble)
library(purrr)

udf <- tibble(
  unames =   c("gaborcsardi", "jennybc", "masalmon", "juliasilge", "leeper",
               "jtleek"),
  url_user = paste0("https://api.github.com/users/", unames),
  url_repos = paste0(url_user, "/repos")
)
walk2(udf$url_user,
      here("data-raw", "github-json", paste0(udf$unames, ".json")),
      download.file)
walk2(udf$url_repos,
      here("data-raw", "github-json", paste0(udf$unames, "-repos.json")),
      download.file)
