data <- read.csv("online_retail.csv")

# install.packages("dplyr")
library(dplyr)

country_quantity <- data %>%
  group_by(Country) %>%
  summarise(Total_Quantity = sum(Quantity, na.rm = TRUE))

top_10_countries <- country_quantity %>%
  arrange(desc(Total_Quantity)) %>%
  head(10)

print(top_10_countries)
