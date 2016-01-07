[![Travis-CI Build Status](https://travis-ci.org/aursiber/Mondrian.svg?branch=master)](https://travis-ci.org/aursiber/Mondrian)
[![AppVeyor Build status](https://ci.appveyor.com/api/projects/status/y3771xk9a4obepas/branch/master?svg=true)](https://ci.appveyor.com/project/aursiber/Mondrian/branch/master)


# Mondrian

The `Mondrian` package contains only one function.
This function, named `mondrian`, computes and displays relative occurences and co-occurences.
When the output is recorded, the relative scores of each status and status combinaison are reported.



### Installing `Mondrian`

The `Mondrian` package is not yet on CRAN.
To install the development version from GitHub:

1. Install the release version of `devtools` from CRAN with `install.packages("devtools")`.

2. Make sure you have a working development environment.
    * **Windows**: Install [Rtools](http://cran.r-project.org/bin/windows/Rtools/).
    * **Mac**: Install Xcode from the Mac App Store.
    * **Linux**: Install a compiler and various development libraries (details vary across different flavors of Linux).
    
3. Then:

```r
library(devtools)
install_github("aursiber/Mondrian")
```

4. Once installed, the package can be loaded using:

```r
library("adegraphics")
```


### Articles which use `Mondrian` functionalities

* *Competitive outcome of multiple infections in a behavior-manipulating virus/wasp interaction.*
Martinez et al. (2015). Ecology and Evolution, 5(24):5934–5945. doi: 10.1002/ece3.1749

* *Nuclear and cytoplasmic differentiation among Mediterranean populations of Bemisia tabaci: testing the biological relevance of cytotypes.* 
Terraz et al. (2014). Pest Management Science, 70:1503-1513. doi: 10.1002/ps.3792

* *Endosymbiont diversity among sibling weevil species competing for the same resource.*
Merville et al. (2013). BMC Evolutionary Biology, 13:28. doi: 10.1186/1471-2148-13-28

* *Distribution of Bemisia tabaci (Homoptera: Aleyrodidae) biotypes and their associated symbiotic bacteria on host plants in West Africa.*
Gnankiné et al. (2013). Insect Conservation and Diversity, 6(3):411-421. doi: 10.1111/j.1752-4598.2012.00206.x

* *Endosymbiont metacommunities, mtDNA diversity and the evolution of the Bemisia tabaci (Hemiptera: Aleyrodidae) species complex.*
Gueguen et al. (2010). Molecular Ecology, 19(19):4365-76. doi: 10.1111/j.1365-294X.2010.04775.x

