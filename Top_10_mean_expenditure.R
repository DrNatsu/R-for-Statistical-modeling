library(dplyr)
library(ggplot2)

data <- read.csv("online_retail.csv")


data <- data %>%
  mutate(Total_Expenditure = Quantity * UnitPrice)

top_10_countries <- data %>%
  group_by(Country) %>%
  summarise(Total_Expenditure = sum(Total_Expenditure, na.rm = TRUE)) %>%
  arrange(desc(Total_Expenditure)) %>%
  head(10)

filtered_data <- data %>%
  filter(Country %in% top_10_countries$Country)

mean_expenditure_per_transaction <- filtered_data %>%
  group_by(Country) %>%
  summarise(Mean_Expenditure = mean(Total_Expenditure, na.rm = TRUE))

mean_expenditure_per_transaction <- mean_expenditure_per_transaction %>%
  arrange(desc(Mean_Expenditure))

print(mean_expenditure_per_transaction)

ggplot(mean_expenditure_per_transaction, aes(x = reorder(Country, -Mean_Expenditure), y = Mean_Expenditure)) +
  geom_bar(stat = "identity", fill = "blue") +
  labs(title = "Mean Expenditure per Transaction (Top 10 Countries)",
       x = "Country",
       y = "Mean Expenditure") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
