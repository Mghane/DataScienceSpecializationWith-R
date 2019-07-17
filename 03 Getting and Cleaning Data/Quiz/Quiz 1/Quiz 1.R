## question 1
wd<-"C:/Users/Mehdi/Desktop/Desktop/Data Science/Courses/Data Cleaning/Assignments/Quiz 1"
setwd(wd)
url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(url,"./data.csv")
library(data.table)
dt<-data.table(read.csv("data.csv"))

## question 3
url2<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
library(xlsx)
download.file(url2,"./data3.xlsx",mode = "wb",method = "curl")
dat<-read.xlsx("data3.xlsx",sheetName = "NGAP Sample Data", rowIndex = 18:23,colIndex = 7:15)
sum(dat$Zip*dat$Ext,na.rm=T)

## question 4
url4<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
library(XML)
library(RCurl)
modurl<-getURI(url4)
doc <- xmlTreeParse(modurl, useInternal = TRUE)
t<-xpathSApply(doc,"//zipcode",xmlValue)
sum(t[]==21231)
##question 5
url5<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
library(data.table)
DT<-fread(url5)
DT[,mean(pwgtp15), by=SEX]
#######################################
