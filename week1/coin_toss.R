
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