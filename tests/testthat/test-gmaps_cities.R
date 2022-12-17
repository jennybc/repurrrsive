test_that("gmaps_cities hasn't changed", {
  expect_snapshot_value(gmaps_cities, style = "json2")
})
