readp1 <- read.csv("p1_final.csv")
readp2 <- read.csv("p2_Final.csv")
readp3 <- read.csv("p3_Final.csv")

mergedf <- rbind(readp1, readp2, readp3)


write.csv(mergedf, "ProductsFinal.csv", row.names = FALSE)
