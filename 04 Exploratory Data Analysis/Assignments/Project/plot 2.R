##Q2
source("unzip.R")
png("plot 2.png")
BaltimoreData <- subset(NEI, NEI$fips=="24510")
BTotalPM <- data.frame(tapply(BaltimoreData$Emissions, BaltimoreData$year, sum))
barplot(height = BTotalPM[,1]/1000,names.arg = unique(BaltimoreData$year), col=c("red","blue","green","yellow"), ylim = c(0,3.5), xlab = "Year", ylab = expression('Total PM '[2.5]*'in Kilotones'), main = "PM2.5 in Baltimore City" )
dev.off()
#plot(unique(BaltimoreData$year),y=BTotalPM[,1],col="red", pch=19, xlim = c(1998,2009), xlab = "Year", ylab = "Total PM25", main = "PM25 in Baltimore City" )
##grid(NULL, NULL, lwd = 2)