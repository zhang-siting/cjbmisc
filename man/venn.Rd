% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/venn.R
\name{venn}
\alias{venn}
\title{Venn diagram plotting functions}
\usage{
venn(l, n = NULL, title = NULL, filename = NULL, fill = NULL,
  dist = 0.08, mar = 0.1, ...)
}
\arguments{
\item{l}{list of vectors to be drawn. for named list the names would be the label}

\item{n}{alternative label of the names}

\item{title}{main title of the diagram}

\item{filename}{if not NULL, will be saved as a file (tiff); if NULL, the plot will be printed to the default device}

\item{fill}{character vector giving the colour of each circle's area}

\item{dist}{numeric vector giving the distance (in npc units) of each category name from the edge of the circle (can be negative)}

\item{mar}{numeric giving the amount of whitespace around the diagram in grid units}

\item{...}{pass to \code{\link[VennDiagram]{venn.diagram}}}
}
\description{
Plot the venn diagram.
}
