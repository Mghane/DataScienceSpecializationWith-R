#Q1
setwd("C:/Users/Mehdi/Desktop/Desktop/Data Science/Courses/Data Cleaning/Assignments/Quiz 3")
url <- ("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv")
download.file(url, "./Q3.csv")
df <- as.data.frame(read.csv("Q3.csv"))
dfm <- mutate(df, agricultureLogical=ifelse(ACR==3 & AGS==6, yes = TRUE,no=FALSE))
#answer:  125  238  262 
#Q2
url2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
library("jpeg")
# A jpeg file is a binary file.  Check the "mode" option in the help page of the function "download.file"
download.file(url2,"./ax.JPEG", mode = "wb")
jpeg <- readJPEG("ax.JPEG", native = TRUE)
quantile(jpeg, probs = c(0.3,0.8), na.rm = FALSE )

#Q3
library(dplyr)
url3 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(url3,"./Gross Domestic Product.csv")
df1 <- select(read.csv("Gross Domestic Product.csv", skip =3 , nrows =191 ), c(1,2,4,5))
colnames(df1) <- c("id","Ranking","Economy","Million US dollars")
df1 <- arrange(df1,desc(df1$Ranking))
df1[13,]
url31 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(url31,"./educational data.csv")
df2 <- read.csv("educational data.csv" , skip = , nrows = )
colnames(df2)[1] <- "id"
mdf <- merge(df1,df2,by='id' )
nrow(mdf)
#Q4
grouped <- group_by(mdf,mdf$Income.Group)
summarise(grouped,mean(Ranking, na.rm = TRUE))
#Q5
#grouped$GPDrankgroup <- cut(grouped$Ranking, breaks = quantile(grouped$Ranking, probs = c(0,0.2,0.4,0.6,0.8,1), na.rm = TRUE ))
library(Hmisc)
grouped$GPDrankgroup <- cut2(grouped$Ranking, g=5, na.rm = TRUE )
#either this
xtabs(~grouped$`mdf$Income.Group`+grouped$GPDrankgroup, data = grouped)
#or
table(grouped$GPDrankgroup,grouped$`mdf$Income.Group`)
