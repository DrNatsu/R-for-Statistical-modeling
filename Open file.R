file_path <- "online_retail.csv"  

data <- read.csv(file_path)

attribute_names <- names(data)
print(attribute_names)


file_path <- "online_retail.csv"  

data <- read.csv(file_path)

first_row <- data[1, ]
print(first_row)


