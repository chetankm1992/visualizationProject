data <- read.csv(file = "dataProcessed.csv", header = TRUE, sep = ",")
data$X.1 <- NULL

count <- as.data.frame(table(data[ , c("JOB_TITLE")]))
library(dplyr)
topThirtyDept <- head(arrange(count,desc(Freq)), n = 30)

colnames(topThirtyDept) <- c("departments", "Freq")

library(rjson)
x <- toJSON(unname(split(topThirtyDept, 1:nrow(topThirtyDept))))
write(x, "q3-default.json")