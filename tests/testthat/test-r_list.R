test_that("r_list can set n of individual functions", {
  expect_length(r_list(10, age)[[1]], 10)
})
