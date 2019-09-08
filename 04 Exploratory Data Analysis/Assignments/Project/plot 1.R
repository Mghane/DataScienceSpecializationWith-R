##Q1
source("unzip.R")
png("plot 1.png")
TotalPM <- data.frame( tapply(NEI$Emissions, NEI$year, sum))
barplot(TotalPM[,1]/1000,names.arg =  unique(NEI$year),col=c("red","blue","green","yellow"), ylim = c(0,8000), xlab = "Year", ylab=expression('Total PM '[2.5]*'in Kilotones'))
dev.off()
##plot(unique(NEI$year),y=TotalPM[,1],col="red", pch=19, xlim = c(1998,2009), xlab = "Year", ylab = expression('Total PM'[2.5]))
##grid(NULL, NULL, lwd = 2, equilogs = T)