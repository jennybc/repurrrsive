test_that("discog hasn't changed", {
  expect_known_value(discog, reference_file("discog.rds"))
})

test_that("discog JSON gives rise to same list as the built-in", {
  skip_if_not_installed("jsonlite")
  expect_identical(
    discog,
    jsonlite::fromJSON(discog_json(), simplifyVector = FALSE)
  )
})
