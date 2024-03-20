#Load required libraries
library(dplyr)
library(readr)
library(stringr)

#Read the CSV file
movies3000 <- read.csv("/cloud/project/Activity#3/3000MovieReviews.csv", stringsAsFactors = FALSE)

#Check the structure of the dataframe
str(movies3000)

#Clean the data
cleanedData <- movies3000 %>%

# Remove NA values
na.omit() %>%

#Remove leading and trailing whitespaces from all columns
mutate_all(str_trim)

#Check the structure of the cleaned dataframe
str(cleanedData)

#Write the cleaned data to a new CSV file
write.csv(cleanedData, "3000MovieReviesCleaned.csv", row.names = FALSE)