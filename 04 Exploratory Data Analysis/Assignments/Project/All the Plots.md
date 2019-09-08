### Project for EDA
setwd("C:/")
unzip("exdata_data_NEI_data.zip")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
##Q1
TotalPM <- data.frame( tapply(NEI$Emissions, NEI$year, sum))
barplot(TotalPM[,1]/1000,names.arg =  unique(NEI$year),col=c("red","blue","green","yellow"), xlab = "Year", ylab=expression('Total PM'[2.5]*'in Kilotones'))
##plot(unique(NEI$year),y=TotalPM[,1],col="red", pch=19, xlim = c(1998,2009), xlab = "Year", ylab = expression('Total PM'[2.5]))
##grid(NULL, NULL, lwd = 2, equilogs = T)
##Q2
BaltimoreData <- subset(NEI, NEI$fips=="24510")
BTotalPM <- data.frame(tapply(BaltimoreData$Emissions, BaltimoreData$year, sum))
barplot(height = BTotalPM[,1]/1000,names.arg = unique(BaltimoreData$year), col=c("red","blue","green","yellow"), xlab = "Year", ylab = expression('Total PM'[2.5]*'in Kilotones'), main = "PM2.5 in Baltimore City" )
#plot(unique(BaltimoreData$year),y=BTotalPM[,1],col="red", pch=19, xlim = c(1998,2009), xlab = "Year", ylab = "Total PM25", main = "PM25 in Baltimore City" )
##grid(NULL, NULL, lwd = 2)
##Q3
library(dplyr)
library(ggplot2)
Bsum <- summarize(group_by(BaltimoreData, type, year), Total=sum(Emissions))

with(Bsum,qplot(year,Total, facets = .~type))
x1 <- ggplot(data = Bsum, aes(factor(year),Total)) + facet_grid(.~type) + geom_col(aes(fill=type)) + xlab("year") + ylab(expression('Total PM' [2.5]))   
##Q4
