#3)Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.

#setting directory
setwd("~/Desktop/DST/Exploratory Data Analysis/Course Project 2/exdata-data-NEI_data")
#Load data from archives
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(ggplot2)

# Subset NEI data by Baltimore's fip.
Baltimore <- NEI[NEI$fips=="24510",]

#Construct the plot and save it to a PNG file 
png("plot3.png",width=480,height=480)
g<- ggplot(data = Baltimore, aes(x = factor(year), y = Emissions, fill = type)) + geom_bar(stat = "identity") + facet_grid(. ~ type) + labs(x="Year", y=expression("Total PM"[2.5]*" Emission")) + ggtitle("Baltimore Emissions by Source 1999-2008") 

print(g)

dev.off()



dev.off()

 
