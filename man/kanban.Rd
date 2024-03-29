% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/shanban.R
\name{kanban}
\alias{kanban}
\title{Create a kanban}
\usage{
kanban(
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
  itemHandleOptions_customHandler = "<span class='item_handle'>+</span> \%title\% ",
  width = NULL,
  height = NULL,
  elementId = NULL
)
}
\arguments{
\item{boards}{Kanban boards}

\item{gutter}{gutter of the board}

\item{widthBoard}{width of the board}

\item{responsivePercentage}{if it is true I use percentage
in the width of the boards and it is not
necessary gutter and widthBoard}

\item{dragItems}{if false, all items are not draggable}

\item{dragBoards}{the boards are draggable, if false
only item can be dragged}

\item{click}{callback when any board's item are clicked}

\item{context}{callback when any board's item are right clicked}

\item{dragEl}{callback when any board's item are dragged}

\item{dragendEl}{callback when any board's item stop drag}

\item{dropEl}{callback when any board's item drop in a board}

\item{dragBoard}{callback when any board is drag}

\item{dragendBoard}{callback when any board stop drag}

\item{buttonClick}{callback when the board's button is clicked}

\item{propagationHandlers}{the specified callback does not cancel
the browser event. possible values: "click", "context"}

\item{itemAddOptions_enabled}{add a button to board
for easy item creation}

\item{itemAddOptions_content}{text or html content
of the board button}

\item{itemAddOptions_class}{default class of the button}

\item{itemAddOptions_footer}{position the button on footer}

\item{itemHandleOptions_enabled}{if board item handle is enabled or not}

\item{itemHandleOptions_handleClass}{css class for your custom item handle}

\item{itemHandleOptions_customCssHandler}{when customHandler
is undefined,
Kanban will use this property to set main handler class}

\item{itemHandleOptions_customCssIconHandler}{when
customHandler is undefined,
Kanban will use this property to set
main icon handler class. If you want,
you can use font icon libraries here}

\item{itemHandleOptions_customHandler}{your entirely customized handler. Use \%title\% to position item title
any key's value included in item collection can be replaced with \%key\%}

\item{width}{Must be a valid CSS unit (like \code{'100\%'},
\code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
string and have \code{'px'} appended.}

\item{height}{Must be a valid CSS unit (like \code{'100\%'},
\code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
string and have \code{'px'} appended.}

\item{elementId}{htmlwidget requirements}
}
\description{
Create a kanban
}
