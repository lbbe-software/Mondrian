\name{Mondrian-package}

\alias{Mondrian-package}
\alias{Mondrian}

\docType{package}

\title{A Simple Graphical Representation of the Relative Occurrence and Co-Occurrence of Events}

\description{The unique function of this package allows representing in a single graph the relative occurrence and co-occurrence of events measured in a sample.\cr
  As examples, the package was applied to describe the occurrence and co-occurrence of different species of bacterial or viral symbionts infecting 
  arthropods at the individual level. The graphics allows determining the prevalence of each symbiont and the patterns of multiple infections 
  (i.e. how different symbionts share or not the same individual hosts). \cr
  We named the package after the famous painter as the graphical output recalls Mondrian’s paintings.
  
  A shiny application \code{MondrianShiny} is available to use the functionalities of the \code{Mondrian} package in an interactive way.
  In this application, two examples are shown. The user can also upload its own data and compute the \code{mondrian} function on it. 
  The display output can then be saved. \code{MondrianShiny} can be run on a R session, doing \code{shiny::runApp(system.file("MondrianShiny", package = "Mondrian"))}
  or online at \url{http://lbbe-shiny.univ-lyon1.fr/MondrianShiny/}. 
}

\author{
  Aurélie Siberchicot <aurelie.siberchicot@univ-lyon1.fr>, Delphine Charif, Gabriel Terraz and Fabrice Vavre
}

\examples{

# About using the MondrianShiny app
# 

if(interactive()) {
  shiny::runApp(system.file("MondrianShiny", package = "Mondrian"))
}

}

\keyword{package}

\seealso{
  \code{\link{mondrian}}
}
