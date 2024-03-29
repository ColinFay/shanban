% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/board.R
\name{Board}
\alias{Board}
\title{Build on board}
\description{
Build on board

Build on board
}
\section{Public fields}{
\if{html}{\out{<div class="r6-fields">}}
\describe{
\item{\code{id, title, class}}{Values passed to build the board}

\item{\code{dragTo}}{Where can the items be dragged?}

\item{\code{items}}{Board content}
}
\if{html}{\out{</div>}}
}
\section{Active bindings}{
\if{html}{\out{<div class="r6-active-bindings">}}
\describe{
\item{\code{id, title, class}}{Values passed to build the board}
}
\if{html}{\out{</div>}}
}
\section{Methods}{
\subsection{Public methods}{
\itemize{
\item \href{#method-new}{\code{Board$new()}}
\item \href{#method-add_item}{\code{Board$add_item()}}
\item \href{#method-serve}{\code{Board$serve()}}
\item \href{#method-clone}{\code{Board$clone()}}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-new"></a>}}
\if{latex}{\out{\hypertarget{method-new}{}}}
\subsection{Method \code{new()}}{
Create a new board.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Board$new(id, title, class = "", dragTo = c())}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{id, title, class}}{Values passed to build the board}

\item{\code{dragTo}}{Where can the items be dragged?}
}
\if{html}{\out{</div>}}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-add_item"></a>}}
\if{latex}{\out{\hypertarget{method-add_item}{}}}
\subsection{Method \code{add_item()}}{
Add an item to the board
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Board$add_item(id, title, ...)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{id, title, class}}{Values passed to build the board}

\item{\code{...}}{further elements passed to the item object}
}
\if{html}{\out{</div>}}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-serve"></a>}}
\if{latex}{\out{\hypertarget{method-serve}{}}}
\subsection{Method \code{serve()}}{
Return the list of elements that will be used
by \code{kanban()} to build the board.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Board$serve()}\if{html}{\out{</div>}}
}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-clone"></a>}}
\if{latex}{\out{\hypertarget{method-clone}{}}}
\subsection{Method \code{clone()}}{
The objects of this class are cloneable with this method.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Board$clone(deep = FALSE)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{deep}}{Whether to make a deep clone.}
}
\if{html}{\out{</div>}}
}
}
}
