##Q6
library(dplyr)
source("unzip.R")
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
