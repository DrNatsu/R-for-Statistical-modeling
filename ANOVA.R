
data <- read.csv("online_retail.csv")

data <- data %>%
  mutate(Total_Expenditure = Quantity * UnitPrice)

result <- aov(Total_Expenditure ~ Country, data = data)

summary(result)
