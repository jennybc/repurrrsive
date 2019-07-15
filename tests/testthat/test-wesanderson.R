test_that("wesanderson list hasn't changed", {
  expect_equal_to_reference(wesanderson,
                            reference_file("wesanderson.rds"))
})

test_that("wesanderson JSON gives rise to same list as the built-in", {
  skip_if_not_installed("jsonlite")
  expect_identical(wesanderson,
                   jsonlite::fromJSON(wesanderson_json())$wesanderson)
})
