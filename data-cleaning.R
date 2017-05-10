Data <- read.csv(file = "h1b_kaggle.csv", header = TRUE, sep = ",")

#Removing not required columns

Data$EMPLOYER_NAME <- NULL
Data$lon <- NULL
Data$lat <- NULL
Data$SOC_NAME <- NULL
Data$PREVAILING_WAGE <- NULL

#Splitting worksite column to get state only

worksite <- as.character(Data$WORKSITE)
worksite <- strsplit(worksite, ",")
library("plyr")
df <- ldply(worksite)
colnames(df) <- c("CITY", "STATE")
df$CITY <- NULL
Data <- cbind(Data, df)
Data$WORKSITE <- NULL
Data$STATE <- trimws(Data$STATE)

#Removing not required CASE_STATUS

Data <- Data[!Data$CASE_STATUS == 'INVALIDATED', ]
Data <- Data[!Data$CASE_STATUS == "PENDING QUALITY AND COMPLIANCE REVIEW - UNASSIGNED", ]
Data <- Data[!Data$CASE_STATUS == "REJECTED", ]

write.csv(Data, "dataProcessed.csv")
