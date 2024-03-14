test_that("lmforecast make prediction", {
  expect_equal(
    lmforecast(
      x = c(1),
      a = 0.1,
      m = 0.5,
      e = 0.01
    ),
    data.frame(
      pred = 0.61,
      x = 1,
      error = 0.01
    )
  )
})
