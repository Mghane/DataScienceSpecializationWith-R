## Q1
setwd("C:/Users/Mehdi/Desktop/Desktop/Data Science/Courses/Data Cleaning/Assignments/Quiz 4")
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(url, "Q1.csv")
file <- read.csv("./Q1.csv")
#################################
##Q2
url2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(url2, "Q2.csv")
file2 <- read.csv("./Q2.csv", skip = 4, nrows = 190)
library(dplyr)
df <- select(file2,c(1,2,4,5))
colnames(df) <- c("abrreviation", "ranking","country","GDP,M$")
df$`GDP,M$` <- gsub(",","",df$`GDP,M$`)
df$`GDP,M$` <- as.numeric(df$`GDP,M$`)
mean(df$`GDP,M$`)
########################
##Q3
length(grep("^United", df$country))
####################################
##Q4
url4 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(url4, "Q4.csv")
df4 <- read.csv("./Q4.csv")
colnames(df4)[1] <- "abrreviation"
dfm <- merge(df,df4,by="abrreviation")
length(grep("^Fiscal year end: June",dfm$Special.Notes))
##############################################
###Q5
##You can use the quantmod (http://www.quantmod.com/) package to get historical stock prices for publicly traded companies on the NASDAQ and NYSE. Use the following code to download data on Amazon's stock price and get the times the data was sampled.

library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn)
parsed <- ymd(sampleTimes)
length(grep("^2012", parsed))
parsed2=format(parsed,"%Y %A %b")
length(grep("^2012 Monday", parsed2))

