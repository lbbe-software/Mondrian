\name{endosymbiont_3pop}
\alias{endosymbiont_3pop}
\docType{data}

\title{Multiple infection profiles in three populations}

\description{Presence/absence data of 5 endosymbionts in each of 30 individuals belonging to three distinct populations.}

\usage{data("endosymbiont_3pop")}

\format{
  A data frame with 30 observations (each individual, in rows) on the following 6 variables (including 5 endosymbionts, in columns):
  \code{pop} is a factor (with 3 levels: \code{AlxT}, \code{MalD} and \code{MslCh}) indicating which of the three populations each individuals belongs and  
  \code{A}, \code{C}, \code{H}, \code{R} and \code{W} are numeric vectors indicating if the endosymbiont is detected.
  The presence of a symbiont in an individual is indicated by \code{1} and its absence by \code{0}.
}

\examples{
  data(endosymbiont_3pop)
  table(endosymbiont_3pop$pop)
  
  ## AlxT  MalD MslCh 
  ##   10    10    10
}

\keyword{datasets}
