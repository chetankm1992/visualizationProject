#Creating two columns of state and percentage for Q1
statesCount <- summary(as.factor(Data$STATE))
statesPercent <- data.frame(STATE = names(statesCount), COUNT = (statesCount))
percent <- (df$COUNT / sum(df$COUNT)) * 100
statesPercent$Percent <- percent
statesPercent$COUNT <- NULL

#Removing first unnamed column

rownames(statesPercent) <- NULL

#Converting exponetial numbers into plane format

statesPercent$Percent <- format(statesPercent$Percent, scientific = FALSE)

#Removing white space in percent column

statesPercent$Percent <- trimws(statesPercent$Percent)

#Writing file to JSON

library(rjson)
x <- toJSON(unname(split(statesPercent, 1:nrow(statesPercent))))
write(x, "statesPercent.json")

