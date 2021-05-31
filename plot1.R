#1)Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

#setting directory
setwd("~/Desktop/DST/Exploratory Data Analysis/Course Project 2/exdata-data-NEI_data")
#Load data from archives
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Aggregate by sum the total emissions by year
totalemissions<- aggregate(Emissions ~ year, NEI, sum)

#Construct the plot and save it to a PNG file 
png("plot1.png",width=480,height=480)

barplot((totalemissions$Emissions)/10^5, names.arg= totalemissions$year, col= color_range, xlab = "Year", ylab = "Total Tons of PM "[2.5]*" Emissions in USA", main= "Total Emissions from all US Sources 1999-2008")

dev.off()








