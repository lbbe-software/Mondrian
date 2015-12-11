\name{mondrian}
\alias{mondrian}

\title{Compute and display the relative occurrence of multi-infectious statuses}

\description{This function computes and represents the relative occurrence of individual multi-infectious statuses.
Individuals can belong to an unique population or to several ones.

The main graphical output looks like Mondrian paintings.}

\usage{
  mondrian(data, labels = colnames(data), xlab = "", ylab = "", main = "", 
    col = NULL , pop = NULL, indiv = TRUE, ...)
}

\arguments{
  \item{data}{a data frame or a matrix containing individual infection statuses in which rows corresponds to individuals and columns to infectious factors}
  \item{labels}{a vector containing the infectious factors' names. If \code{data} is a data frame, labels are the columns name by default.}
  \item{xlab}{a string of characters indicating the x-axis label}
  \item{ylab}{a string of characters indicating the y-axis label}
  \item{main}{a string of characters indicating the main title of the displayed output. The main title is updated with the number of individuals.}
  \item{col}{a vector containing the colors combined with the infectious factors. See}
  \item{pop}{a number index indicating the number of the column containing the population's factor. If it is missing, individuals are an unique population.}
  \item{indiv}{a logical to draw horizontal lines to separate each individual multi-infectious status.}
  \item{\dots}{graphical parameters. See \code{\link[graphics:plot]{plot}} and \code{\link[graphics:par]{par}}}
}

\details{
  Rectangles' colors use the palette \code{Set1} defined by the function \code{brewer.pal} of the \code{RColorBrewer} package. This palette
  automatically proposes distinct colors (more than 2 and less than 10 values). 
}

\value{
  The display of the relative occurrence of individual multi-infectious statuses.
  When it is printed, the output shows the proportion of each status.
  
  If individuals belong to different populations (\code{pop} is not null), the graphical output is a layout with one display for each sub-population 
  and one display where all individuals are considered belonging to an unique population.
  In this case, the print output is a list: the first element contains the statuses' proportion for each sub-population and the second element contains the statuses' proportion of the whole of individuals.
}

\seealso{
  \link[RColorBrewer:brewer.pal]{brewer.pal}
}

\examples{
  data(endosymbiont_1pop)
  out1 <- mondrian(endosymbiont_1pop)
  out1
  
  data(endosymbiont_3pop)
  out2 <- mondrian(endosymbiont_3pop, pop = 1)
  out2
  names(out2)
}

\keyword{dplot}
\keyword{hplot}
