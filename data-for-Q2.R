#loading updated data after pre-processing

dataUpdated <- read.csv(file="dataProcessed.csv", header = TRUE, sep = ",")

#grouping data for line chart

group_q2 <- as.data.frame(table(dataUpdated[ , c("CASE_STATUS","YEAR", "STATE")]))

#Writing file to JSON

library(rjson)
x <- toJSON(unname(split(group_q2, 1:nrow(group_q2))))
write(x, "q2.json")
