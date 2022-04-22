test_that("jkanban stops on names / ids", {
  expect_error(
    kanban(
      boards = list(
        one = Board$new(
          id = "one",
          title = "First board",
          dragTo = "two"
        )$add_item(
          id = "one",
          title = "First item"
        )$serve(),
        one = Board$new(
          id = "two",
          title = "Second board",
          dragTo = "one"
        )$add_item(
          id = "one",
          title = "First item"
        )$serve()
      )
    )
  )
  expect_error(
    kanban(
      boards = list(
        Board$new(
          id = "one",
          title = "First board",
          dragTo = "two"
        )$add_item(
          id = "one",
          title = "First item"
        )$serve(),
        Board$new(
          id = "one",
          title = "Second board",
          dragTo = "one"
        )$add_item(
          id = "one",
          title = "First item"
        )$serve()
      )
    )
  )
})

test_that("kanban is a widget", {
  res <- kanban(
    boards = list(
      # First board
      Board$new(
        id = "one",
        title = "First board",
        dragTo = "two"
      )$add_item(
        id = "one",
        title = "First item"
      )$add_item(
        id = "two",
        title = "Second item"
      )$serve()
    )
  )
  expect_true(
    inherits(
      res,
      "shanban"
    )
  )
  expect_true(
    inherits(
      res,
      "htmlwidget"
    )
  )
})
