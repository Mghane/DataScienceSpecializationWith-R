##Q4
source("unzip.R")
combfilter <- grep("Comb", SCC$EI.Sector)
coalfilter <- grep("Coal", SCC$EI.Sector)
both <- intersect(combfilter,coalfilter)
filtered_SCC <- SCC[both,]
filtered_NEI <- NEI[as.factor(NEI$SCC) %in% filtered_SCC$SCC, ]
CTotalPM <- data.frame( tapply(filtered_NEI$Emissions, filtered_NEI$year, sum))
png("plot 4.png")
barplot(CTotalPM[,1]/1000,names.arg =  unique(filtered_NEI$year),col=c("red","blue","green","yellow"), ylim = c(0,600), xlab = "Year", ylab=expression('Total PM '[2.5]*'in Kilotones'))
dev.off()