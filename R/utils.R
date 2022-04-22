#' Input parser
#'
#' Parse the input from Shiny
#'
#' @param content Content from Shiny
#'
#' @export
parse_input <- function(content) {
  tibble::tibble(
    id = vapply(content, getElement, character(1), "id", USE.NAMES = FALSE),
    title = vapply(content, getElement, character(1), "title", USE.NAMES = FALSE),
    content = lapply(content, getElement, "items")
  )
}
