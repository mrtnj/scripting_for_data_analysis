#Week 1


##Reading

* An introduction to R -- the "official" introuction, very thorough and good for looking things up. The first three chapters are a good place to start. -- <https://cran.r-project.org/doc/manuals/r-release/R-intro.pdf>

* If you are not so used to programming at all, I suggest having a look at Try R -- Code School's very gentle introduction to R <http://tryr.codeschool.com/>

* The university library also has several books on R as e-books, e.g. Norman Matloff's The art of R programming. <http://www.bibl.liu.se>

* Cookbook for R, ggplot2 -- particularly helpful for changing options and formatting in ggplot2 -- <http://www.cookbook-r.com/Graphs/>



##Exercises

Hints:

Every time you encounter a function name that you don't recognize, try looking at the help file (e.g. enter `?sum` to see the help file for the `sum` function).

The `qplot` function is part of ggplot2. To load the package, use `library(ggplot2)`.

* The `mens_long_jump_records.txt` contains the world records in men's long jump from 1901 up until now. Read this file into R, and make a plot of the record progression. Look through the available kinds of graphics ("geoms") in the ggplot2 documentation <http://docs.ggplot2.org/current/> and try a couple of different ones. Use the xlim() function to extend the x-axis of the graph so that it ends in 2016. Convert the jumps to feet (1 foot is 0.3048 meters), and store in a new column of the data frame.

* Read the help file on the seq() function. Use it to make a vector of the even numbers between 1 and 100.

* Use R's inbuilt sin() and cos() functions in combination with qplot() to draw a sine and a cosine wave. (Hint: first, use `x <- seq(from = 0, to = 2 * pi, by = 0.1)` to generate an x-variable to operate on). Can you draw them on top of each other in the same plot?

* The file `coin_toss.R` contains these two functions. The first simulates a series of coin tosses, returning a vector where "h" means heads and "t" means tails. The second takes such a vector of tosses, and finds the length of runs of the same coin. Run this script with the source() function. Now you can use the functions. Try them out! Use the table() function to count the numbers of heads and tails in simulated tosses. Combine it with the prop.test() function for a statistical test of the hypothesis that the tosses are fair. Use the max() function to find the longest run in a simulated series of 10000 tosses.  

```R
sim_data <- function(nsim = 20) {
  sample(c("h", "t"), nsim, replace = TRUE)
}


runs <- function(tosses) {
  runs <- numeric(length(tosses))
  runs[1] <- 1
  j <- 1
  for (i in 2:length(tosses)) {
    if (tosses[i] == tosses[i - 1]) {
      runs[j] <- runs[j] + 1
    } else {
      j <- j + 1
      runs[j] <- 1
    }
  }
  runs[1:j]
}
```

* Assign two vectors `v <- c(1, 2, 1)` and `w <- c(2, 2, 2).` If we multiply them together with the multiplication operator `*`, we will get elementwise multiplication. If we want the scalar product (dot product), how is that done?


##Homework

The first homework consists of some statisical analysis of the fictious unicorn dataset.

Write down your code to solve the problem in an R script file with comments. It should run without intervention and produce the answers to the questions.

If you prefer, you can use one of the systems (knitr or Sweave) for embedding R code in a document. In that case, hand in the resulting html or pdf output file.