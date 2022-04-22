#' Methods to interact with your boards
#'
#' @param inputId shiny input
#' @param boardId Id of the board to interact with
#' @param position If position is set, inserts at position starting from 0
#' @param itemId Id of the item to add
#' @param title Content of the item to add
#' @param ... further args passed to the JS object
#' @param session Shiny Session object
#'
#' @rdname kanban_methods
#' @export
removeBoard <- function(
  inputId,
  boardId,
  session = shiny::getDefaultReactiveDomain()
) {
  session$sendCustomMessage(
    "kanban:removeBoard",
    list(
      inputId = inputId,
      boardId = boardId
    )
  )
}

#' @rdname kanban_methods
#' @export
addBoard <- function(
  inputId,
  boardId,
  session = shiny::getDefaultReactiveDomain()
) {
  session$sendCustomMessage(
    "kanban:addBoard",
    list(
      inputId = inputId,
      boardId = boardId
    )
  )
}
#' @rdname kanban_methods
#' @export
addElement <- function(
  inputId,
  boardId,
  itemId,
  title,
  ...,
  position = NULL,
  session = shiny::getDefaultReactiveDomain()
) {
  session$sendCustomMessage(
    "kanban:addElement",
    list(
      inputId = inputId,
      boardId = boardId,
      element = list(
        id = itemId,
        title = title,
        ...
      ),
      position = position
    )
  )
}
