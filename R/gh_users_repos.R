#' GitHub users
#'
#' Info on GitHub users, retrieved from the GitHub API.
#'
#' @format A unnamed list with 6 components, each representing a GitHub user.
#'   Each user's component is a list of length 30, containing information such
#'   as username, GitHub id, and join date.
#'
#' @family GitHub data and functions
#' @source \url{https://developer.github.com/v3/users/#get-a-single-user}
#' @examples
#' gh_users
#' str(lapply(gh_users, `[`, c("login", "name")))
"gh_users"

#' Path to GitHub user JSON
#'
#' @return Local path to JSON file containing GitHub user info
#' @export
#'
#' @family GitHub data and functions
#'
#' @examples
#' gh_users_json()
#' if (require("jsonlite")) {
#'   fromJSON(gh_users_json(), simplifyDataFrame = FALSE)
#' }
gh_users_json <- function() {
  system.file("extdata", "gh_users.json", package = "repurrrsive")
}

#' GitHub repos
#'
#' Info on GitHub repos, retrieved from the GitHub API.
#'
#' @family GitHub data and functions
#'
#' @format A unnamed list with 6 components, each itself a list of 30 repos for
#'   a specific GitHub user. Each repo's component is a list of length >60,
#'   containing information such as name, owner (a list), fork status, and
#'   creation date.
#'
#' @source \url{https://developer.github.com/v3/repos/#list-user-repositories}
#' @examples
#' gh_repos
#' str(lapply(gh_repos[[1]][1:3], `[`, c("full_name", "created_at")))
"gh_repos"

#' Path to GitHub repo JSON
#'
#' @return Local path to JSON file containing GitHub repo info
#' @export
#'
#' @family GitHub data and functions
#'
#' @examples
#' gh_repos_json()
#' if (require("jsonlite")) {
#'   fromJSON(gh_repos_json(), simplifyDataFrame = FALSE)
#' }
gh_repos_json <- function() {
  system.file("extdata", "gh_repos.json", package = "repurrrsive")
}
