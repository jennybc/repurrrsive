context("swapi data")

test_that("sw_* lists haven't changed", {
  expect_equal_to_reference(sw_people,
    reference_file("sw_people.rds"))
  expect_equal_to_reference(sw_films,
    reference_file("sw_films.rds"))
  expect_equal_to_reference(sw_planets,
    reference_file("sw_planets.rds"))
  expect_equal_to_reference(sw_species,
    reference_file("sw_species.rds"))
  expect_equal_to_reference(sw_vehicles,
    reference_file("sw_vehicles.rds"))
  expect_equal_to_reference(sw_starships,
    reference_file("sw_starships.rds"))
})
