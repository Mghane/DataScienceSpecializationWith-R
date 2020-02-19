library(XML)
fileurl<-"https://www.w3schools.com/xml/simple.xml"
doc<-xmlTreeParse(fileurl)
rootNode<-xmlRoot(doc)
xmlName(rootNode)
xmlSApply(rootNode,xmlValue)
xpathSApply(rootNode,"//price",xmlValue)
##-----------------
fileurl<-"https://www.espn.com/nfl/team/_/name/bal/baltimore-ravens"
doc<-htmlTreeParse(fileurl,useInternalNodes = TRUE)
scores<-xpathSApply(doc,"//li[@class='score']", xmlValue)
teams<-xpathSApply(doc,"//li@class='team-name']",xmlValue)
scores
##---------------------------------------
library(jsonlite)
jsonData <- fromJSON("https://api.github.com/users/jtleek/repos")
names(jsonData$owner)
##-------------------------------------------------
library("data.table")
DF = data.frame(x=rnorm(9),y=rep(c("a","b","c"),each=3),z=rnorm(9))
head(DF,3)
DT = data.table(x=rnorm(9),y=rep(c("a","b","c"),each=3),z=rnorm(9))
head(DT,3)
