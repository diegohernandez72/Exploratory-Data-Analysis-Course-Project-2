#2)Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510" fips == "24510") from 1999 to 2008? Use the base plotting system to make a plot answering this question.

#setting directory
setwd("~/Desktop/DST/Exploratory Data Analysis/Course Project 2/exdata-data-NEI_data")
#Load data from archives
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Subset NEI data by Baltimore's fip.
Baltimore <- NEI[NEI$fips=="24510",]

# Aggregate using sum the Baltimore emissions data by year
TotalsBaltimore <- aggregate(Emissions ~ year, Baltimore, sum)

#Construct the plot and save it to a PNG file 
png("plot2.png",width=480,height=480)
barplot((TotalsBaltimore$Emissions), names.arg= TotalsBaltimore$year, col= cols1, xlab = "Year", ylab = "Total Tons of PM "[2.5]*" Emissions in Baltimore", main= "Total Emissions from all Baltimore sources 1999-2008")

dev.off()

