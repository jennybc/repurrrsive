context("game of thrones pov characters")

test_that("got_chars list hasn't changed", {
  expect_equal_to_reference(got_chars,
                            reference_file("got_chars.rds"))
})

test_that("got_chars JSON gives rise to same list as the built-in", {
  skip_if_not_installed("jsonlite")
  expect_identical(got_chars,
                   jsonlite::fromJSON(got_chars_json(),
                                      simplifyDataFrame = FALSE))
})
