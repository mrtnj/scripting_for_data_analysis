#Week 3

##Reading

* The Split-Apply-Combine Strategy for data analysis, by guru Hadley Wickham -- a paper that introduces the ideas behind plyr -- <http://vita.had.co.nz/papers/plyr.pdf>

* R for data science, particularly chapters 12 about tidy data and 21 about iteration, also by Hadley Wickham and Garrett Grolemund -- <http://r4ds.had.co.nz/>.

* The R Inferno by Patrick Burns -- Tongue in cheek (?!) epic about the horrors of R; in particular chapters 1-4 -- <http://www.burns-stat.com/documents/books/the-r-inferno/>

* Program better for fun and profit -- <https://inattentionalcoffee.wordpress.com/2017/01/13/program-better-for-fun-and-for-profit/>

##Exercises





##Homework

The third homework is much more open-ended than the previous ones. The task is to perform design analysis by simulation of a study (actual or hypothetical) that is of interest to you. You will simulate data, implement the analysis in R, apply it to many simulated datasets, and evaluate the results. The report should include conclusions and informative statistical graphics.

You should follow, more or less, the following steps:

* Pick a potential data analysis that you know and care about. It should be reasonably simple, so if you pick something from a research project of yours, you will likely have to simplify a bit. Maybe you can focus or just one comparison.

* What kind of data have you got, or would you get? Invent a model that can simulate that kind of data. Feel free to simplify and make assumptions. For instance, if we were analyzing a linear regression problem, we would probably draw the errors from a normal distribution, even if that is an idealization.

* Think especially about the parameter of the model that will determine how big an effect there is, and the parameters that determine the variation. In a linear model context, this would be the coefficient associated with some continuous or categorical predictor. Sometimes, it's not so easy to find reasonable estimates for effects and errors. Maybe you can find something in the literature, or from existing previous data?

* Implement the analysis as you would with real data. A good thing about working with simulated data is that you can put them in a convenient form from the beginning. It will probably save you some file reading and data wranglig.

* Replicate your simulation, so that it generates hundreds or thousands of simulated datasets. Then apply your analysis to each simulated dataset. Gather the results of the simulations, and format the data for conventient summarization and plotting.

* Summarize the results. Does the analysis detect an effect when it should? How good is the estimate of the effect? Plot some of the simulated datasets to see what true effects would look like.

* Modify your simulations to generate data without any effect. How often does your analysis incorrectly detect an effect? Plot some of the no-effects datasets, to form pictures of what noise looks like.