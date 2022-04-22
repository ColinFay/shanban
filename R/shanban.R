#' Create a kanban
#'
#' @import htmlwidgets
#'
#' @param boards Kanban boards
#' @param gutter gutter of the board
#' @param widthBoard width of the board
#' @param responsivePercentage if it is true I use percentage
#' in the width of the boards and it is not
#' necessary gutter and widthBoard
#' @param dragItems if false, all items are not draggable
#' @param dragBoards the boards are draggable, if false
#'  only item can be dragged
#' @param click callback when any board's item are clicked
#' @param context callback when any board's item are right clicked
#' @param dragEl callback when any board's item are dragged
#' @param dragendEl callback when any board's item stop drag
#' @param dropEl callback when any board's item drop in a board
#' @param dragBoard callback when any board is drag
#' @param dragendBoard callback when any board stop drag
#' @param buttonClick callback when the board's button is clicked
#' @param propagationHandlers the specified callback does not cancel
#' the browser event. possible values: "click", "context"
#' @param itemAddOptions_enabled add a button to board
#' for easy item creation
#' @param itemAddOptions_content text or html content
#' of the board button
#' @param itemAddOptions_class default class of the button
#' @param itemAddOptions_footer position the button on footer
#' @param itemHandleOptions_enabled if board item handle is enabled or not
#' @param itemHandleOptions_handleClass css class for your custom item handle
#' @param itemHandleOptions_customCssHandler when customHandler
#' is undefined,
#' Kanban will use this property to set main handler class
#' @param itemHandleOptions_customCssIconHandler when
#' customHandler is undefined,
#' Kanban will use this property to set
#' main icon handler class. If you want,
#' you can use font icon libraries here
#' @param itemHandleOptions_customHandler your entirely customized handler. Use %title% to position item title
#' any key's value included in item collection can be replaced with %key%
#' @param elementId htmlwidget requirements
#'
#' @inheritParams shanban-shiny
#'
#' @export
kanban <- function(
  boards = list(),
  gutter = "15px",
  widthBoard = "250px",
  responsivePercentage = FALSE,
  dragItems = TRUE,
  dragBoards = TRUE,
  click = htmlwidgets::JS("function (el) {}"),
  context = htmlwidgets::JS("function (el, event) {}"),
  dragEl = htmlwidgets::JS("function (el, source) {}"),
  dragendEl = htmlwidgets::JS("function (el) {}"),
  dropEl = htmlwidgets::JS("function (el, target, source, sibling) {}"),
  dragBoard = htmlwidgets::JS("function (el, source) {}"),
  dragendBoard = htmlwidgets::JS("function (el) {}"),
  buttonClick = htmlwidgets::JS("function(el, boardId) {}"),
  propagationHandlers = list(),
  itemAddOptions_enabled = FALSE,
  itemAddOptions_content = "+",
  itemAddOptions_class = "kanban-title-button btn btn-default btn-xs",
  itemAddOptions_footer = FALSE,
  itemHandleOptions_enabled = FALSE,
  itemHandleOptions_handleClass = "item_handle",
  itemHandleOptions_customCssHandler = "drag_handler",
  itemHandleOptions_customCssIconHandler = "drag_handler_icon",
  itemHandleOptions_customHandler = "<span class='item_handle'>+</span> %title% ",
  width = NULL,
  height = NULL,
  elementId = NULL
) {
  if (!is.null(names(boards))) {
    stop("All boards in the board list should be unnamed.")
  }
  all_ids <- vapply(
    boards,
    function(x) {
      x$id
    },
    character(1)
  )
  if (length(all_ids) != length(unique(all_ids))) {
    stop("All board ids should be unique")
  }

  # forward options using x
  x <- list(
    boards = boards,
    gutter = gutter,
    widthBoard = widthBoard,
    responsivePercentage = responsivePercentage,
    dragItems = dragItems,
    dragBoards = dragBoards,
    itemAddOptions = list(
      enabled = itemAddOptions_enabled,
      content = itemAddOptions_content,
      class = itemAddOptions_class,
      footer = itemAddOptions_footer
    ),
    itemHandleOptions = list(
      enabled = itemHandleOptions_enabled,
      handleClass = itemHandleOptions_handleClass,
      customCssHandler = itemHandleOptions_customCssHandler,
      customCssIconHandler = itemHandleOptions_customCssIconHandler,
      customHandler = itemHandleOptions_customHandler
    ),
    click = click,
    context = context,
    dragEl = dragEl,
    dragendEl = dragendEl,
    dropEl = dropEl,
    dragBoard = dragBoard,
    dragendBoard = dragendBoard,
    buttonClick = buttonClick,
    propagationHandlers = propagationHandlers
  )

  # create widget
  htmlwidgets::createWidget(
    name = "shanban",
    x,
    width = width,
    height = height,
    package = "shanban",
    elementId = elementId
  )
}

#' Shiny bindings for shanban
#'
#' Output and render functions for using shanban within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a shanban
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name shanban-shiny
#'
#' @export
kanbanOutput <- function(
  outputId,
  width = "100%",
  height = "400px"
) {
  htmlwidgets::shinyWidgetOutput(
    outputId,
    "shanban",
    width,
    height,
    package = "shanban"
  )
}

#' @rdname shanban-shiny
#' @export
renderKanban <- function(
  expr,
  env = parent.frame(),
  quoted = FALSE
) {
  if (!quoted) {
    expr <- substitute(expr)
  } # force quoted
  htmlwidgets::shinyRenderWidget(
    expr,
    kanbanOutput,
    env,
    quoted = TRUE
  )
}
