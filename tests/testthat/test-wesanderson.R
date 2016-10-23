context("wesanderson")

test_that("wesanderson JSON gives rise to same list as the built-in", {
  skip_if_not_installed("jsonlite")
  expect_identical(wesanderson,
                   jsonlite::fromJSON(wesanderson_json())$wesanderson)
})
