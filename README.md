
<!-- README.md is generated from README.Rmd. Please edit that file -->

# shanban

<!-- badges: start -->
<!-- badges: end -->

**WORK IN PROGRESS**

`htmlwidgets` for [jkanban](https://github.com/riktar/jkanban)

## Installation

You can install the development version of `{shanban}` like so:

``` r
remotes::install_github("thinkr-open/shanban")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(shanban)
kanban(
  boards = list(
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
    )$serve(),
    Board$new(
      id = "two",
      title = "Second board",
      dragTo = "one"
    )$add_item(
      id = "one",
      title = "First item"
    )$add_item(
      id = "two",
      title = "Second item"
    )$serve()
  )
)
```

``` r
one_board <- function(
  id,
  dragTo = NULL
) {
  Board$new(
    id = id,
    title = sprintf("Board %s", id),
    dragTo = dragTo
  )$add_item(
    id = "one",
    title = "Do this"
  )$add_item(
    id = "two",
    title = "And also this"
  )$serve()
}
```

``` r
library(shanban)
options(shiny.port = httpuv::randomPort())
library(shiny)
ui <- function(request) {
  fluidPage(
    column(
      12,
      fluidRow(
        kanbanOutput("x")
      ),
      fluidRow(
        column(
          4,
          actionButton("rm", "Remove board two"),
          actionButton("add", "Add board two")
        ),
        column(
          4,
          textInput("id", "id of item to add"),
          textInput("title", "Content of item to add"),
          actionButton("additem", "Add the item to board one")
        ),
        column(
          4,
          verbatimTextOutput("content")
        )
      )
    )
  )
}

server <- function(
  input,
  output,
  session
) {
  observeEvent(
    input$rm,
    {
      removeBoard(
        "x",
        "two"
      )
    }
  )

  observeEvent(
    input$add,
    {
      addBoard(
        "x",
        one_board(
          "two",
          dragTo = "one"
        )
      )
    }
  )

  observeEvent(input$additem, {
    addElement(
      "x",
      boardId = "one",
      id = input$id,
      title = input$title
    )
  })

  output$x <- renderKanban({
    kanban(
      boards = list(
        # First board
        one_board(
          id = "one",
          dragTo = "two"
        ),
        # Second board
        one_board(
          "two",
          dragTo = "one"
        )
      )
    )
  })

  output$content <- renderPrint({
    parse_input(input$x_content)
  })

  observeEvent(input$x_content, {
    cli::cat_rule("input$x_content")
    print(parse_input(input$x_content))
  })
  observeEvent(input$x_last_item_clicked, {
    cli::cat_rule("input$x_last_item_clicked")
    print(input$x_last_item_clicked)
  })
  observeEvent(input$x_last_item_contexted, {
    cli::cat_rule("input$x_last_item_contexted")
    print(input$x_last_item_contexted)
  })
  observeEvent(input$x_last_item_dragged, {
    cli::cat_rule("input$x_last_item_dragged")
    print(input$x_last_item_dragged)
  })
}

shinyApp(ui, server)
```
