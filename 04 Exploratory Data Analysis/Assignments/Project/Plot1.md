### Project for EDA
setwd("C:/")
unzip("exdata_data_NEI_data.zip")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
##Q1
TotalPM <- data.frame( tapply(NEI$Emissions, NEI$year, sum))
barplot(TotalPM[,1]/1000,names.arg =  unique(NEI$year),col=c("red","blue","green","yellow"), xlab = "Year", ylab=expression('Total PM'[2.5]*'in Kilotones'))
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
combfilter <- grep("Comb", SCC$EI.Sector)
coalfilter <- grep("Coal", SCC$EI.Sector)
both <- intersect(combfilter,coalfilter)
filtered_SCC <- SCC[both,]
filtered_NEI <- NEI[as.factor(NEI$SCC) %in% filtered_SCC$SCC, ]
CTotalPM <- data.frame( tapply(filtered_NEI$Emissions, filtered_NEI$year, sum))
barplot(CTotalPM[,1]/1000,names.arg =  unique(filtered_NEI$year),col=c("red","blue","green","yellow"), xlab = "Year", ylab=expression('Total PM'[2.5]*'in Kilotones'))
##Q5
BaltimoreData <- subset(NEI, NEI$fips=="24510")
vehicle <- grep("Vehicle", SCC$EI.Sector)
sources <- SCC[vehicle,]
fBData <- BaltimoreData[as.factor(BaltimoreData$SCC) %in% sources$SCC,]
Bsum <- summarise(group_by(fBData, year), Total=sum(Emissions))
png("plot 5.png")
x2 <- ggplot(data = Bsum, aes(as.factor(year), Total)) + geom_col(aes(fill=year)) + ylim(c(0,350)) + labs(title = "Emissions in Baltimore City due to Vehicles", x="Year", y=expression('Total PM ' [2.5]) )
plot(x2)
dev.off()
##Q6
BaltimoreData <- subset(NEI, NEI$fips=="24510")
LAData <- subset(NEI, NEI$fips=="06037")
vehicle <- grep("Vehicle", SCC$EI.Sector)
sources <- SCC[vehicle,]
fBData <- BaltimoreData[as.factor(BaltimoreData$SCC) %in% sources$SCC,]
fLAData <- LAData[as.factor(LAData$SCC) %in% sources$SCC,]
Bsum <- summarise(group_by(fBData, year), Total=sum(Emissions, na.rm = T))
Bsum[,3] <- "Baltimore"
LAsum <- summarise(group_by(fLAData, year), Total=sum(Emissions, na.rm = T))
LAsum[,3] <- "Los Angeles"
FinalData <- rbind(LAsum, Bsum)
colnames(FinalData) <- c("year","Total","City")
png("plot 6.png")
x3 <- ggplot(data = FinalData, aes(as.factor(year), Total)) + facet_grid(City~., scales = "free") + geom_col(aes(fill=City))  + labs(title = "Emissions in Baltimore and Los Angeles Cities due to Vehicles", x="Year", y=expression('Total PM ' [2.5]) )
##x3 <- ggplot(data = FinalData, aes(as.factor(year), log10(Total)))  + geom_col(aes(fill=City), position = "dodge")  + labs(title = "Emissions in Baltimore and Los Angeles Cities due to Vehicles", x="Year", y=expression('Log '[10]*'Total PM ' [2.5]) )
plot(x3)
dev.off()
