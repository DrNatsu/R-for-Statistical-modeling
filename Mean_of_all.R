library(dplyr)

# Load the dataset
data <- read.csv("online_retail.csv")

# Create a new column 'Total_Expenditure' by multiplying 'Quantity' and 'UnitPrice'
data <- data %>%
  mutate(Total_Expenditure = Quantity * UnitPrice)

# Group the data by 'Country' and calculate the mean 'Total_Expenditure' per transaction
mean_expenditure_per_transaction <- data %>%
  group_by(Country) %>%
  summarise(Mean_Expenditure = mean(Total_Expenditure, na.rm = TRUE))

# Calculate the average mean expenditure for all countries
average_mean_expenditure <- mean(mean_expenditure_per_transaction$Mean_Expenditure)

# Print the average mean expenditure
cat("Average Mean Expenditure for All Countries:", average_mean_expenditure)