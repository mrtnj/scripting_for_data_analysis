## Simulate unicorn expression data

data <- read.csv("unicorn_data.csv", stringsAsFactors = FALSE)


diet_effect <- replicate(6, {
  runif(1, 100, 200) + ifelse(data$diet == "flowers", 1, 0) + rnorm(nrow(data))
})

colour_effect <- replicate(3, {
  runif(1, 100, 200) + ifelse(data$colour == "pink", 2, 0) + rnorm(nrow(data))
})

no_effect <- replicate(3, {
  runif(1, 100, 200) + rnorm(nrow(data))
})

expr <- cbind(diet_effect, colour_effect, no_effect)
expr <- expr[, sample(1:ncol(expr))]
colnames(expr) <- paste("gene", 1:12, sep = "_")

expression_data <- data.frame(ID = paste("U", 1:nrow(expr), sep = "_"), expr)
expression_data <- expression_data[sample(1:nrow(expression_data)), ]

write.table(expression_data, file = "unicorn_expression.txt", quote = FALSE, row.names = FALSE)
