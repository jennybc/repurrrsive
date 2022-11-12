test_that("gh_users and gh_repos lists haven't changed", {
  expect_snapshot_value(gh_users, style = "json2")
  expect_snapshot_value(gh_repos, style = "json2")
})

test_that("gh_users and gh_repos JSON gives rise to same list as the built-in", {
  skip_if_not_installed("jsonlite")
  expect_identical(
    gh_users,
    jsonlite::fromJSON(gh_users_json(),
      simplifyDataFrame = FALSE
    )
  )
  expect_identical(
    gh_repos,
    jsonlite::fromJSON(gh_repos_json(),
      simplifyDataFrame = FALSE
    )
  )
})
