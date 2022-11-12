test_that("sw_* lists haven't changed", {
  expect_snapshot_value(sw_people, style = "json2")
  expect_snapshot_value(sw_films, style = "json2")
  expect_snapshot_value(sw_planets, style = "json2")
  expect_snapshot_value(sw_species, style = "json2")
  expect_snapshot_value(sw_vehicles, style = "json2")
  expect_snapshot_value(sw_starships, style = "json2")
})
