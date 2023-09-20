data <- read.csv("online_retail.csv")


missing_values <- colSums(is.na(data))


print(missing_values)


numeric_columns <- sapply(data, is.numeric)
data[numeric_columns] <- lapply(data[numeric_columns], function(x) {
  ifelse(is.na(x), mean(x, na.rm = TRUE), x)
})


missing_values_after_imputation <- colSums(is.na(data))
print(missing_values_after_imputation)
