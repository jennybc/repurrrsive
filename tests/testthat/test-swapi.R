test_that("sw_* lists haven't changed", {
  expect_known_value(sw_people, reference_file("sw_people.rds"))
  expect_known_value(sw_films, reference_file("sw_films.rds"))
  expect_known_value(sw_planets, reference_file("sw_planets.rds"))
  expect_known_value(sw_species, reference_file("sw_species.rds"))
  expect_known_value(sw_vehicles, reference_file("sw_vehicles.rds"))
  expect_known_value(sw_starships, reference_file("sw_starships.rds"))
})
