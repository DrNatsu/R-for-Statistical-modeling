
data <- read.csv("online_retail.csv")
library(dplyr)

data <- data %>%
  mutate(Total_Expenditure = Quantity * UnitPrice)


country_expenditure <- data %>%
  group_by(Country) %>%
  summarise(Total_Monetary_Value = sum(Total_Expenditure, na.rm = TRUE))


top_countries_by_expenditure <- country_expenditure %>%
  arrange(desc(Total_Monetary_Value))


print(top_countries_by_expenditure)
