\name{endosymbiont_3pop}
\alias{endosymbiont_3pop}
\docType{data}

\title{Multi-infectious statuses in three populations}

\description{Presence/absence data about 8 endosymbionts for 30 individuals belonging to three populations}

\usage{data("endosymbiont_3pop")}

\format{
  A data frame with 30 observations on the following 9 variables.
  \describe{
    \item{\code{pop}}{a factor with levels \code{AlxT} \code{MalD} \code{MslCh} for the three populations}
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
  data(endosymbiont_3pop)
  table(endosymbiont_3pop$pop)
}

\keyword{datasets}
