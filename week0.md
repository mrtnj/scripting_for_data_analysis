# Week 0: Preliminaries

There are a few things we need to get out of the way before the course. Please do this in good time before the first seminar. Feel free to contact me if you have trouble, but if you plan to use your work computer for the course, you will probably have to seek help from the IT support with installation.

The software is free and open source and available for the major platforms.


## Installing R and RStudio

R is the engine, and RStudio is a convenient user interface and working environment. I strongly recommend RStudio, but it is quite possible to use R without it.

First, install [R](https://www.r-project.org/). You can find the download page of the Swedish mirror  here: <https://ftp.acc.umu.se/mirror/CRAN/>

Then, install [RStudio](https://www.rstudio.com/). The download page is here: <https://www.rstudio.com/products/rstudio/download/>


## Getting acquainted with RStudio

Launch RStudio. Look around. The RStudio interface consists of a set of panels:

* On the top left: a code editor and table viewer. This is where you will write your scripts.

* On the bottom left is the console where R is running inside RStudio. You can type commands and have them run immediately. Try putting in `1+1` and pressing enter.

* On the top right there is a panel that shows the objects that exist within the current R session, i.e. the numbers, tables, custom functions etc that R currently has in memory. There is also a second tab that shows the history of things you've entered into the console.

* Finally, on the bottom right there is a multi-purpose panel with tabs showing the built-in R documentation, graphics that you make, which packages are available and loaded, etc.

![Rstudio screenshot](rstudio.png "RStudio screenshot")


## Installing packages

A lot of R's power comes from packages by developers in the community. The package system within R can download and install them for you. Many are hosted on the R package repository called CRAN. We will need several packages for this course. To install them, go to the Console in RStudio, and write:

```
install.packages(c("ggplot2", "plyr", "reshape2"))
```

Press enter. R will download and install these packages and a series of other packages that they depend on. 

Important: If RStudio asks you if you want to compile some of the packages or download binary versions, choose the binaries. Compilation is the process when a piece of a program is translated into machine code. This requires special tools, and if you aren't a developer, chances are that they are not installed on your computer.