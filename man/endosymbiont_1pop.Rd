\name{endosymbiont_1pop}
\alias{endosymbiont_1pop}
\docType{data}

\title{Multi-infectious statuses in one population}

\description{Presence/absence data about 8 endosymbionts for 10 individuals}

\usage{data("endosymbiont_1pop")}

\format{
  A data frame with 10 observations on the following 8 variables.
  \describe{
    \item{\code{Q1}}{a numeric vector indicating if the endosymbiont \code{Q1} is detected}
    \item{\code{Q2}}{a numeric vector indicating if the endosymbiont \code{Q2} is detected}
    \item{\code{B}}{a numeric vector indicating if the endosymbiont \code{B} is detected}
    \item{\code{A}}{a numeric vector indicating if the endosymbiont \code{A} is detected}
    \item{\code{C}}{a numeric vector indicating if the endosymbiont \code{C} is detected}
    \item{\code{H}}{a numeric vector indicating if the endosymbiont \code{H} is detected}
    \item{\code{R}}{a numeric vector indicating if the endosymbiont \code{R} is detected}
    \item{\code{W}}{a numeric vector indicating if the endosymbiont \code{W} is detected}
  }
}

\examples{
  data(endosymbiont_1pop)
  
  ## Compute the occurrence table of multi-infectious profiles
  rev(table(apply(endosymbiont_1pop, 1, paste, collapse = "")))
}

\keyword{datasets}
