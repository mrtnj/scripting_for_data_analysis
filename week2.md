#Week 1


##Reading

* The Split-Apply-Combine Strategy for data analysis, by guru Hadley Wickham -- a paper that introduces the ideas behind plyr -- <http://vita.had.co.nz/papers/plyr.pdf>

* R for data science, particularly chapters 12 about tidy data and 21 about iteration, also by Hadley Wickham and Garrett Grolemund -- will teach you modern advanced R packages right away, and make you look like a genius -- <http://r4ds.had.co.nz/>.


##Exercises

* Look back at the  `mens_long_jump_records.txt` from last week. There is also a file called `mens_long_jump_year_best.txt`, which contains the season best in men's long jump from 1960 to 2015. Read both files into R, and make a graph that shows both time series together. This can be achieved in multiple ways. One way is to 1) add an indicator column that tells whether the observation is a record or a season best; 2) combined both data sets to one long dataframe with the `rbind` function; and 3) use the indicator column to colour the points differently. Another is to add, with the `+` operator, the second dataset as another layer (`geom_point`) to the plot.

* Another way to combine two data frames is to merge them, i.e. join them based on some column that identifies the rows. Read `womens_long_jump_year_best.txt`. Now `merge` that table with the one containing men's season best by year. It is perhaps useful to change the `colnames` of the table, either before or after the merging. What happens to 1986? (Hint: It is missing from the male file.) Make a scatterplot of male and female results, and calculate the correlation (with `cor` or `cor.test`), and the regression (with `lm`).

* It is often useful to go back and forth between "long form" and "short form" data frames. To demonstrate the difference: the combined table of long jump results is in short form (each year is one row, and the two season best are stored in columns). In long form, each value (season best) would have its own row. Use the `melt` function (from the `reshape2` package) to create this data frame. Use `nrows` on the result, and the original data frame. Does the long form data frame have the expected number of rows?

* Look back at the problem of generating sine and cosine waves. First, rewrite your code it returns a `data.frame` with three columns containing x, sin(x), and cos(x). Then, encapsulate this code in a function of x. Show its output for different input vectors.




##Homework

The second homework combines the unicorn dataset with some additional (just as fictional) molecular data.

Again, write down your code to solve the problem in an R script file with comments, or a knitr/Sweave report with embedded R code and results.