# Week 2


## Reading

* Now that you have started to write code may be a good time to look at coding style. See style guide from Hadley Wickham's Advanced R <http://adv-r.had.co.nz/Style.html> and from Google <https://google.github.io/styleguide/Rguide.xml>. Especially the latter is pretty long, and you don't need to care about all of this. But have a look through and think about how you make your code understandable for your coworkers and future selves.

* Chapter 11 on data import in R for Data Science. <http://r4ds.had.co.nz/data-import.html> Note the difference between the readr package (used by default in new versions of RStudio) and the old base R functions.

* Section 10 on writing your own functions of An Introduction to R. <https://cran.r-project.org/doc/manuals/r-release/R-intro.pdf>

* Cookbook for R -- Converting data between wide and long format. <http://www.cookbook-r.com/Manipulating_data/Converting_data_between_wide_and_long_format/>


## Exercises

* Here is a list of useful R functions. You have encountered many of them, but probably not all. If you don't recognize a function, use the documentation to find out what it does. Invent your own usage example.
    * `summary`
    * `str`
    * `dim`
    * `nrow`
    * `ncol`
    * `which`
    * `any`
    * `all`
    * `colnames`
    * `rownames`
    * `transform`
    * `factor`
    * `rbind`
    * `cbind`
    * `c`

* Look back at the  `mens_long_jump_records.txt` from last week. There is also a file called `mens_long_jump_year_best.txt`, which contains the season best in men's long jump from 1960 to 2015. Read both files into R, and make a graph that shows both time series together. This can be achieved in multiple ways. One way is to 1) add an indicator column that tells whether the observation is a record or a season best; 2) combined both data sets to one long dataframe with the `rbind` function; and 3) use the indicator column to colour the points differently. Another is to add, with the `+` operator, the second dataset as another layer (`geom_point`) to the plot.

* Another way to combine two data frames is to merge them, i.e. join them based on some column that identifies the rows. Read `womens_long_jump_year_best.txt`. Now `merge` that table with the one containing men's season best by year. It is perhaps useful to change the `colnames` of the table, either before or after the merging. What happens to 1986? (Hint: It is missing from the men's file.) Make a scatterplot of men's and women's results, and calculate the correlation (with `cor` or `cor.test`), and the regression (with `lm`).

* It is often useful to go back and forth between "long" and "wide" data frames. To demonstrate the difference: the combined table of long jump results is in short form (each year is one row, and the two season best are stored in columns). In long form, each value (season best) would have its own row. Use the `melt` function (from the `reshape2` package) to create this data frame. Use `nrow` on the result, and the original data frame. Does the long form data frame have the expected number of rows?

* Look back at the problem of generating sine and cosine waves. First, rewrite your code it returns a `data.frame` with three columns containing x, sin(x), and cos(x). Then, encapsulate this code in a function of x. Show its output for different input vectors.

* Quite often, sample names, variable names and other identifiers have slight variation that needs to be ironed out before analysis can proceed. Imagine that we have a series of filenames called "data_1.txt" up to "data_14.txt". First, create a vector with these filenames. (Hint: use `paste` and the `:` operator in conjunction. Also, set the `sep` argument to an empty string with `sep = ""`.) Then, use `str_replace` (from the stringr package) to remove the file extension (".txt").




## Homework

The second homework combines the unicorn dataset with some additional (just as fictional) molecular data.

Again, write down your code to solve the problem in an R script file with comments, or a knitr/Sweave file + the resulting report with embedded results.


### 1. Formatting the expression dataset

Read `unicorn_expression.txt`. Also, using code from last week, read the original unicorn data file.

You will notice that the individual IDs look similar, but not quite identical. They are in fact supposed to refer to the same individuals, but the expression data frame has underscores between the U and the number. Also, the rows are in a different order. Modify one or both of the data frames so that the IDs match. (Hint: use the `str_replace` function from the stringr package.)


### 2. Principal component analysis

Principal component analysis is a common way to simplify, visualize and look for patterns in multivariate data. Use the `prcomp` function to perform principal component analysis of the unicorn expression data.

Make a scatterplot of the first two principal components (the scores for each individual are stored in the `x` component of the object). You should see one point for each individual. Do they form any apparent pattern? Also plot the second against the third principal component.

Combine the principal components with the unicorn data frame, so that you can give the points different colours depending on the colour and diet of the unicorn. Make on coloured by diet and one coloured by unicorn colour. (Hint: Make a data frame that contains the principal component scores and an id column, then use the `merge` function.) Do the apparent clusters correspond with diet or colour of the unicorn?


### 3. Plots broken down by gene

Another useful graph might be to show the expression for all individuals together. 

Transform the expression values to long form with the `melt` function. Then make a plots that have `value` on the y-axis, and `variable` on the x-axis. Try both boxplots and jittered points. What do you see? 

Again, combine this data with the unicorn data, so that you can colour each boxplot or point depending on the diet and colour of the individual.



### 4. Linear models

Make sure that you have a long form ("melted") dataset that contains the expression values combined with diet and colour. (This would be the same dataset that you used for coloured boxplots.) Make sure it is called `expression_melted`.

Write a function that takes a data frame in that long format, and fits a model `value ~ diet + colour`. Call the function `unicorn_expression_model`. Make sure that it works and returns an `lm` object.

Then, use the following code:

```
library(plyr)
models <- dlply(expression_melted, "variable", unicorn_expression_model)
ldply(models, coef)
```

We will go into plyr and its functions in detail next week. But try to reason what this code did. What did it return? Modify it to create a table of confidence intervals.
