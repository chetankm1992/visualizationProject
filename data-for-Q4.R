data <- read.csv(file = "dataProcessed.csv", header = TRUE, sep = ",")
data$X.1 <- NULL

graduated <- as.data.frame(table(data$YEAR))

q4Data <- read.csv(file = "q4-data.csv", header = TRUE, sep = ",")

q4 <- cbind(graduated, q4Data)

q4$year <- NULL

colnames(topThirtyDept) <- c("departments", "Freq")


colnames(q4)  <- c("year", "graduated", "enrolled")

library(rjson)
x <- toJSON(unname(split(q4, 1:nrow(q4))))
write(x, "q4.json")

