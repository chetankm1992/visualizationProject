data <- read.csv(file = "dataProcessed.csv", header = TRUE, sep = ",")
data$X.1 <- NULL

count <- as.data.frame(table(data[ , c("STATE", "CASE_STATUS", "YEAR")]))

library(rjson)
x <- toJSON(unname(split(count, 1:nrow(count))))
write(x, "q5.json")