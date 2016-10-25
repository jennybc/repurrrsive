## devtools::install_github("krlmlr/here")
library(here)
library(jsonlite)
library(purrr)
library(stringr)

fls <- list.files(here("data-raw", "github-json"), full.names = TRUE)
is_repo_json <- str_detect(fls, "repos")
user_fls <- fls[!is_repo_json]
repo_fls <- fls[is_repo_json]

gh_users <- user_fls %>%
  map(fromJSON)
gh_repos <- repo_fls %>%
  map(fromJSON, simplifyDataFrame = FALSE)

use_data(gh_users, overwrite = TRUE)
use_data(gh_repos, overwrite = TRUE)

gh_users %>%
  toJSON() %>%
  prettify() %>%
  writeLines(here("inst", "extdata", "gh_users.json"))

gh_repos %>%
  toJSON() %>%
  prettify() %>%
  writeLines(here("inst", "extdata", "gh_repos.json"))
