\name{endosymbiont_1pop}
\alias{endosymbiont_1pop}
\docType{data}

\title{Multiple infectious profiles in one population}

\description{Presence/absence data about 8 endosymbionts in each of 10 individuals belonging to the same population.}

\usage{data("endosymbiont_1pop")}

\format{
  A data frame with 10 observations (each individual, in rows) on the following 8 variables (each endosymbiont, in columns): 
  \code{Q1}, \code{Q2}, \code{B}, \code{A}, \code{C}, \code{H}, \code{R} and \code{W} are numeric vectors indicating if the endosymbiont is detected.
  The presence of a symbiont in an individual is indicated by \code{1} and its absence by \code{0}.
}

\examples{
  data(endosymbiont_1pop)
  
  ## Compute the occurrence table of multiple infection profiles
  rev(table(apply(endosymbiont_1pop, 1, paste, collapse = "")))
  
  ## 10001100 10000101 10000100 
  ##       6        2        2
}

\keyword{datasets}
