##Q5
library(dplyr)
source("unzip.R")
BaltimoreData <- subset(NEI, NEI$fips=="24510")
vehicle <- grep("Vehicle", SCC$EI.Sector)
sources <- SCC[vehicle,]
fBData <- BaltimoreData[as.factor(BaltimoreData$SCC) %in% sources$SCC,]
Bsum <- summarise(group_by(fBData, year), Total=sum(Emissions))
png("plot 5.png")
x2 <- ggplot(data = Bsum, aes(as.factor(year), Total)) + geom_col(aes(fill=year)) + ylim(c(0,350)) + labs(title = "Emissions in Baltimore City due to Vehicles", x="Year", y=expression('Total PM ' [2.5]) )
plot(x2)
dev.off()