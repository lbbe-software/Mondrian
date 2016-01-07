\name{mondrian}
\alias{mondrian}

\title{Computes and displays the relative occurrence and co-occurence of multiple infectious profiles}

\description{This function computes and represents the relative occurrence and co-occurence of individual multiple infectious profiles.
Individuals can belong to a unique population or to several ones.

The graphical output looks like Mondrian paintings.}

\usage{
  mondrian(data, labels = colnames(data), xlab = "", ylab = "", main = "", 
    col = NULL , pop = NULL, indiv = FALSE, ...)
}

\arguments{
  \item{data}{a data frame or a matrix containing the infection profile of each individual for each symbiont. Rows corresponds to individuals and columns to the symbionts.}
  \item{labels}{a vector containing the symbionts name. By default, labels are the columns name of \code{data}.}
  \item{xlab}{a string of characters indicating the x-axis label.}
  \item{ylab}{a string of characters indicating the y-axis label.}
  \item{main}{a string of characters indicating the main title of the displayed output. This string is followed by the number of individuals to constitute the actual main title.}
  \item{col}{a vector containing as many colors as symbionts. See \code{Details}.}
  \item{pop}{a number index indicating the number of the column containing the population's factor in \code{data}. If it is missing, individuals are considering belonging to a unique population and \code{data} must not contain a \code{pop} column.}
  \item{indiv}{a logical to draw horizontal lines separating each individual profile.}
  \item{\dots}{graphical parameters. See \code{\link[graphics:plot]{plot}} and \code{\link[graphics:par]{par}}.}
}

\details{
  By default, rectangles' colors come from the \code{Set1} palette defined by the \code{brewer.pal} function of the \code{RColorBrewer} package. This palette
  automatically proposes distinct colors (more than 2 and less than 10 values). 
}

\value{
  The \code{mondrian} function yields two outputs:
  
  - a plot representing the occurence and co-occurence of symbionts within individuals, recalling famous Mondrian paintings.
    For each column (the columns in the plot match with the columns in \code{data}), the coloured area corresponds to the total prevalence of this symbiont. 
    When coloured areas are present in different columns, this indicates co-infection.
    If individuals belong to different populations (\code{pop} is not null), the graphical output is a layout with one display for each sub-population 
    and one display where all individuals are considered belonging to a unique population.
  
  - the distinct profiles of multiple infection (considering all symbionts in \code{data}) and their presence percentage in the whole population and in each sub-population (when \code{pop} is not null).
}

\seealso{
  \link[RColorBrewer:brewer.pal]{brewer.pal}
}

\examples{
  data(endosymbiont_1pop)
  out1 <- mondrian(endosymbiont_1pop)
  out1
  
  ## 10001100 10000101 10000100 
  ##      0.6      0.2      0.2
  
  
  data(endosymbiont_3pop)
  out2 <- mondrian(endosymbiont_3pop, pop = 1)
  out2
  
  ## $AlxT
  ## 10001100 
  ##        1 
  ## $MalD
  ## 10001101 10000100 10000000 01010111 01010011 
  ##      0.1      0.6      0.1      0.1      0.1 
  ## $MslCh
  ## 01010111 01010011 01010010 01010001 01000110 01000010 
  ##      0.1      0.1      0.4      0.1      0.1      0.2 
  ## $pop
  ##   10001101   10001100   10000100   10000000   01010111  
  ## 0.03333333 0.33333333 0.20000000 0.03333333 0.06666667
  ##   01010011   01010010   01010001   01000110   01000010 
  ## 0.06666667 0.13333333 0.03333333 0.03333333 0.06666667 

  names(out2)
  ## [1] "AlxT"  "MalD"  "MslCh" "pop"
}

\keyword{dplot}
\keyword{hplot}
