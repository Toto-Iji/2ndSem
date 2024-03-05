#Aeron Jesse Edombingo BSIT 2B

#A.

warpbreaksdf <- warpbreaks

#1.
wbifnumeric <- sapply(warpbreaksdf,is.numeric)
# breaks    wool tension 
# TRUE   FALSE   FALSE

wbifinteger <- sapply(warpbreaksdf,is.integer)
# breaks    wool tension 
# FALSE   FALSE   FALSE

#2.
#The "breaks" column can be converted into integer

warpbreaksdf$breaks <- as.integer(warpbreaksdf$breaks)
sapply(warpbreaksdf,is.integer)

#3.

min(warpbreaksdf$wool)
str(warpbreaksdf)
# Error in Summary.factor(c(1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L,  : 
# ‘min’ not meaningful for factors

# The code produced the error above because wool is a factor. it does not make sense
# to find the minimum of it in the same way you would with a numeric or integer values.

#B.

#1.
importedData <- readLines("/cloud/project/Exercise#1/exampleFile.txt")

#2.
vectorComments <- importedData[grepl("^//", importedData)]
vectorData <- importedData[!grepl("^//", importedData)]

#3.
extractedDate <- vectorComments[1]
date <- gsub("^// Survey data. Created : ", "", extractedDate)

#4.
#a.
retrievedData <- strsplit(vectorData, ";")

#b.
maxData <- max(sapply(retrievedData, length))
retrievedData <- lapply(retrievedData, function(x) {
  if(length(x) < maxData) c(x, rep(NA, maxData - length(x)))
  else x
})

#c.
matrixData <- matrix(unlist(retrievedData), ncol = maxData, byrow = TRUE)

#d.
extractedData <- gsub("^// Field [0-9]+: ", "", vectorComments[2:4])
colnames(matrixData) <- extractedData
print(matrixData)