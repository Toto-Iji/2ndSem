mov1 <- read.csv("/cloud/project/Activity#3/AmericanPsycho_reviews.csv")
mov2 <- read.csv("/cloud/project/Activity#3/BackToTheFuture_reviews.csv")
mov3 <- read.csv("/cloud/project/Activity#3/FastX_reviews.csv")
mov4 <- read.csv("/cloud/project/Activity#3/Interstellar_reviews.csv")
mov5 <- read.csv("/cloud/project/Activity#3/JohnWick_reviews.csv")
mov6 <- read.csv("/cloud/project/Activity#3/JurassicPark_reviews.csv")
mov7 <- read.csv("/cloud/project/Activity#3/PulpFiction_reviews.csv")
mov8 <- read.csv("/cloud/project/Activity#3/Schindler'sList_reviews.csv")
mov9 <- read.csv("/cloud/project/Activity#3/ShutterIsland_reviews.csv")
mov10 <- read.csv("/cloud/project/Activity#3/TheLegoMovie_reviews.csv")

#Column name changing code otherwise rbind won't work
movs <- list(mov1, mov2, mov3, mov4, mov5, mov6, mov7, mov8, mov9, mov10)

# New column names
new_column_names <- c("Usernames", "Review_Date", "Review_Content", "Rating")

# Rename columns in each data frame
for (i in seq_along(movs)) {
  colnames(movs[[i]]) <- new_column_names
}

# Merge data frames using rbind (From ChatGPT for assistance)
merge_movs <- do.call(rbind, movs)

write.csv(merge_movs, "/cloud/project/Activity#3/3000MovieReviews.csv", row.names = FALSE)
                 
