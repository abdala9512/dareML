test_that("Test base datasets, correct loading and import", {

  iristDF <- getIris()
  expect_equal(nrow(irisDF), 150)
})
