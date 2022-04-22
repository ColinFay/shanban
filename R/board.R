#' Build on board
#'
#'
#' @export
#'
Board <- R6::R6Class(
  "Board",
  public = list(
    #' @field id,title,class Values passed to build the board
    #' @field dragTo Where can the items be dragged?
    #' @field items Board content
    id = "",
    title = "",
    class = "",
    dragTo = c(),
    items = list(),
    #' @description
    #' Create a new board.
    #' @param id,title,class Values passed to build the board
    #' @param dragTo Where can the items be dragged?
    initialize = function(
  id,
  title,
  class = "",
  dragTo = c()
    ) {
      self$id <- id
      self$title <- title
      self$class <- class
      self$dragTo <- dragTo
      invisible(self)
    },
    #' @description
    #' Add an item to the board
    #' @param id,title,class Values passed to build the board
    #' @param ... further elements passed to the item object
    add_item = function(
  id,
  title,
  ...
    ) {
      item_id <- paste0(self$id, id)
      if (item_id %in% private$item_ids) {
        stop("item ids should be unique")
      }
      private$item_ids <- c(private$item_ids, item_id)
      self$items[[
      length(
        self$items
      ) + 1
      ]] <- list(
        id = item_id,
        title = title,
        ...
      )
      invisible(self)
    },
    #' @description
    #' Return the list of elements that will be used
    #' by `kanban()` to build the board.
    serve = function() {
      list(
        id = self$id,
        title = self$title,
        class = self$class,
        dragTo = list(self$dragTo),
        item = self$items
      )
    }
  ),
  private = list(
    item_ids = c()
  )
)
