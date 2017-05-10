data <- read.csv(file = "dataProcessed.csv", header = TRUE, sep = ",")
data$X.1 <- NULL

group_q3 <- as.data.frame(table(data[ , c("JOB_TITLE","STATE")]))

#It is used to remove rows in which dpts have zero values
filt <- group_q3[which(group_q3$Freq>0), ]

# code for top 30 values in each state

states <- unique(filt[c("STATE")])

statesArr <- as.vector(t(states))

df <- data.frame();

for(i in 1:length(statesArr)){
  
  newdata <- subset(filt, STATE == statesArr[i])
  
  newdataSort <- newdata[order(-newdata$Freq),]
  
  newdataSortHund <- head(newdataSort, 30)
  
  df <- rbind(df, newdataSortHund);
  
}

library(rjson)
x <- toJSON(unname(split(df, 1:nrow(df))))
write(x, "q3.json")
