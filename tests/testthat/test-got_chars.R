test_that("got_chars list hasn't changed", {
  expect_snapshot_value(got_chars, style = "json2")
})

test_that("got_chars JSON gives rise to same list as the built-in", {
  skip_if_not_installed("jsonlite")
  expect_identical(
    got_chars,
    jsonlite::fromJSON(got_chars_json(),
      simplifyDataFrame = FALSE
    )
  )
})
