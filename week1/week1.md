# Week 1


## Reading

* If you are not so used to programming at all, I suggest having a look at Try R -- Code School's very gentle introduction to R <http://tryr.codeschool.com/>

* An introduction to R -- the "official" introuction, very thorough and good for looking things up, but somewhat old-fashioned in places. -- <https://cran.r-project.org/doc/manuals/r-release/R-intro.pdf>
    * The first sections 1-3, introduction, vectors and objects, are a good place to start.
    * You can also have a look at section 6.3.1 and 6.3.3 about data frames. (But skip 6.3.2. This subsection deals with `attach` and `detach`, which I only recommend for playing practical jokes on dear friends.)
    * Section 11 introduces statistical models in R. Read this to refresher on linear models and an introduction to R's formula syntax. Don't get to bogged down with the more advanced formula functions (`poly`, `Error` and the like) unless you have a special interest. I'd suggest reading 11.1-11.4, and skipping subsection 11.1.1. If you use generalized linear models in your work, you can keep going with 11.6.

* R for data science by Hadley Wickham and Garrett Grolemund -- will teach you modern advanced R packages right away, and make you look like a genius -- <http://r4ds.had.co.nz/>. Chapters 1-4 and 6 introduce R and RStudio, some statistical graphics, and coding. 


* The university library also has several books on R as e-books, e.g. Norman Matloff's The art of R programming. <http://www.bibl.liu.se>

* Cookbook for R, ggplot2 -- particularly helpful for changing options and formatting in ggplot2 -- <http://www.cookbook-r.com/Graphs/>



## Exercises

Hints:  
Every time you encounter a function name that you don't recognize, try looking at the help file (e.g. enter `?sum` to see the help file for the `sum` function).  
The `qplot` function is part of ggplot2. To load the package, use `library(ggplot2)`. Everything else uses base R.

* The `mens_long_jump_records.txt` contains the world records in men's long jump from 1901 up until now. Read this file into R, and make a plot of the record progression. Look through the available kinds of graphics ("geoms") in the [ggplot2 documentation](http://docs.ggplot2.org/current/) and try a couple of different ones. Use the `xlim` function to extend the x-axis of the graph so that it ends in 2016. Convert the jumps to feet (1 foot is 0.3048 meters), and store in a new column of the data frame.

* The following code fits a linear regression model for the record progression (assuming that the data frame with the records is called `mens_long_jump_records`): `model <- lm(meters ~ year, data = mens_long_jump_records)`. Use `summary(model)` and `coef(model)` to investigate the output. How much does the model say that the record improves each year? Use the coefficients to calculate the model's prediction for the long jump record in 1950.

* If we instead use `model_recoded <- lm(meters ~ I(year - 1900), data = mens_long_jump_records)` to fit the model, what is the difference? (Hint: look at the documention for the `I` function, under Details.) Why does one coefficient change while the other doesn't?

* Read the help file on the `seq` function. Use it to make a vector of the even numbers between 1 and 100.

* Use R's inbuilt `sin` and `cos` functions in combination with `qplot` to draw a sine and a cosine wave. (Hint: first, use `x <- seq(from = 0, to = 2 * pi, by = 0.1)` to generate an x-variable to operate on). Can you draw them on top of each other in the same plot?

* The file `coin_toss.R` contains these two functions. Don't worry too much about the code inside the functions now, but after week 3 you will be able to re-read them and understand how they work. The first simulates a series of coin tosses, returning a vector where "h" means heads and "t" means tails. The second takes such a vector of tosses, and finds the length of runs of the same coin. Run this script with the `source` function. Now you can use the functions. Try them out! Use the `table` function to count the numbers of heads and tails in simulated tosses. Combine it with the `prop.test` function for a statistical test of the hypothesis that the tosses are fair. Use the `max` function to find the longest run in a simulated series of 10000 tosses.  

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


## Homework

The first homework consists of some statisical analysis of the fictious unicorn dataset. Feel free to ask me for help if you get stuck.

Write down your code to solve the problem in an R script file with comments. It should run without intervention and produce the answers to the questions.

If you prefer, you can use one of the systems (knitr or Sweave) for embedding R code in a document. In that case, hand in the resulting html or pdf output file.

### 1. Start a new script

Either use New > R script in RStudio, or open a new file in your favourite text editor. Save the file as `unicorn_analysis.R`, in some appropriate folder. While working through the exercises, put all the R commands you use into this file. The next time you need it, you can simply source the script file, and the whole analysis will be replayed.

### 2. Reading data

Today's dataset is stored in `unicorn_data.csv`. It is of course totally fictitious -- let us imagine that we've measured weight (kg) and horn length (cm) of unicorns of two colours fed two different diets. Read it through RStudio's import button or with `read.csv`. Inspect the resulting table.

When using Import dataset in RStudio, the program will generate a line of R code for you. It is this code that does the importing. Copy it into your script file.

(Below I've assumed that you named your data frame `unicorns`).


### 3. Data summaries

Calculate some summary statistics for the variables. Try `summary(unicorns)`. What does the output mean?

Cross tabulate the colour and diet variables with `table(unicorns$colour, unicorns$diet)`. Also try `table(unicorns$diet)` and `table(unicorns$colour)`.

How many individuals are there of each class? Is the design balanced? 
	

### 4. Weight--horn length regression

Load the ggplot2 package with `library(ggplot2)`. This needs to be done every time you start a new session. Therefore, put this line into your script file as well.

Make a scatterplot of weight and horn length using `qplot`.

Make a simple regression model of horn length as a function of weight, using the `lm` function. What is the value of the regression coefficient that represents the slope of the line? What unit is it?


### 5. Diagnostic plots

Plot residuals versus fitted values and look for obvious departures from constant errors. `qplot(x = fitted(model), y = residuals(model))`

Make a normal quantile-quantile plot of residuals to check for gross departures from normality. `qplot(sample = residuals(model))`


### 6. Comparisons of means

For now, ignore diet and run a t-test (function `t.test`) comparing the weight of pink and green unicorns.

Make boxplots and jittered scatterplots of weight and horn length as a function of diet and colour. (Use `qplot` but change the default geom to "jitter" and "boxplot", respectively.)

Then, use the `lm` functon to fit a model of weight that includes both diet and colour. Add an interaction between diet and colour. Interpret the results.
