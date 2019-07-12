##Q1
library(httr)
# 1. Find OAuth settings for github:
#    http://developer.github.com/v3/oauth/
oauth_endpoints("github")
# 2. To make your own application, register at
#    https://github.com/settings/developers. Use any URL for the homepage URL
#    (http://github.com is fine) and  http://localhost:1410 as the callback url
#    Replace your key and secret below.
myapp <- oauth_app("github", key = "710ac66f5737ddf7d418", secret = "c4f79e2c03c0cb2f81219869cf6497c68c9861a1")
# 3. Get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"),myapp)
# 4. Use API
gtoken <- config(token = github_token)
req <- GET("https://api.github.com/users/jtleek/repos", gtoken)
stop_for_status(req)
output <- content(req)
which(sapply(output,function(x) "datasharing" %in% x))
list(output[[16]]$created_at, output[[16]]$name)

#Q2 & 3
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
wd <- "C:/Users/Mehdi/Desktop/Desktop/Data Science/Courses/Data Cleaning/Assignments/Quiz 2"
setwd(wd)
download.file(url = url, destfile = "./Q2.csv")
acs <- read.csv("Q2.csv")
#Q4
library(httr)
library(XML)
url1 <- "http://biostat.jhsph.edu/~jleek/contact.html"
con <- url(url1)
html <- readLines(con)
c <- c(10,20,30,100)
sapply(c,function(x) nchar(html[[x]]))

#Q5
url2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"
wd <- "C:/Users/Mehdi/Desktop/Desktop/Data Science/Courses/Data Cleaning/Assignments/Quiz 2"
setwd(wd)
download.file(url = url2, destfile = "./Q5")
df <- read.fwf("Q5", skip = 4, widths = c(-1,9,-5,4,4,-5,4,4,-5,4,4,-5,4,4))
#library(dplyr)
mdf <- df[,-1]
colSums(mdf)[[3]]
########################################################################################




