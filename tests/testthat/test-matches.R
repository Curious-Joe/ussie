test_that("uss_make_matches works", {
  italy <- uss_make_matches(engsoccerdata::england, "Italy")
  names <- names(italy)
  expected_col_names <- c("country", "tier", "season", "date",
                          "home", "visitor", "goals_home", "goals_visitor")

  expect_true(tibble::is_tibble(italy))

  # alternative way of checking column names
  expect_named(italy, expected_col_names)
  expect_identical(names, expected_col_names)

  expect_identical(unique(italy$country), "Italy")

  # alternative way of checking data type.
  # Use expect_true if no specific function is available.
  # E.g. between the following two prefer use expect_s3_class() to expect_true()
  expect_s3_class(italy$tier, "factor")
  expect_true(is.factor(italy$tier))
})
