library(dplyr, dbplyr)
library(RMariaDB)

#Read CSV file into a dataframe
csv_data <- read.csv("3000MovieReviews.csv")

#Selecting 10 observations (Do not run this line again, please call the object instead)
sampled_data <- csv_data[sample(nrow(csv_data), 10), ]


#Connect to MySQL
connection <- dbConnect(RMariaDB::MariaDB(), 
                        dsn = "mysql",
                        Server = "localhost",
                        dbname = "cs102_edombingo", 
                        user = "root", 
                        password = "") 


#Escape special characters in Review_content  
escaped_review_content <- gsub("'", "''", sampled_data$Review_Content)

#Construct the INSERT query for each row
for (i in 1:nrow(sampled_data)) {
  insert_query <- paste0("INSERT INTO activity4 (usernames, review_date, review_content, rating) VALUES ('",
                  sampled_data$Usernames[i], "', '", sampled_data$Review_Date[i], "', '", 
                  escaped_review_content[i], "', ", sampled_data$Rating[i], ")")

#Send the INSERT query to the database
result <- dbSendQuery(connection, insert_query)
  
#Clear the result
dbClearResult(result)
}

#Close the database connection
dbDisconnect(connection)