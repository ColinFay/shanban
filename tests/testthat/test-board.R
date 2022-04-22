test_that("board fails on duplicate ids", {
  expect_error(
    Board$new(
      id = "one",
      title = "First board",
      dragTo = "two"
    )$add_item(
      id = "one",
      title = "First item"
    )$add_item(
      id = "one",
      title = "Second item"
    )
  )
})

test_that("board works", {
  res <- Board$new(
    id = "one",
    title = "First board",
    dragTo = "two"
  )$add_item(
    id = "one",
    title = "First item"
  )$add_item(
    id = "two",
    title = "Second item"
  )
  expect_true(
    inherits(
      res,
      "Board"
    )
  )
  expect_true(
    inherits(
      res,
      "R6"
    )
  )
})
