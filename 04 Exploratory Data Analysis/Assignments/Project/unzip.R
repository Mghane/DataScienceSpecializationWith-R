####Unzip the data
setwd("C:/Users/Mehdi/Desktop/Desktop/Data Science/Courses/4.Explanatory Data Analysis/Week4/Project")
if (!file.exists("summarySCC_PM25.rds")) {
        unzip("exdata_data_NEI_data.zip")
}
if (!"NEI" %in% ls()) {
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
}
