#6)Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037"). Which city has seen greater changes over time in motor vehicle emissions?

#setting directory
setwd("~/Desktop/DST/Exploratory Data Analysis/Course Project 2/exdata-data-NEI_data")
#Load data from archives
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")  
#Subsetting Baltimore and LA data and grouped in a data frame
BothFips <- data.frame(fips = c("06037", "24510"), county = c("Los Angeles", "Baltimore"))

#Subsetting vehicles from SCC data using grep
SCCVehicles <- SCC[grep("[Vv]ehicle", SCC$EI.Sector), "SCC"]
#Filtering vehicle emissions related NEI data frame, grouped by year and sum
VehicleEmissions <- NEI %>% filter(SCC %in% SCCVehicles & fips %in% BothFips$fips) %>% group_by(fips, year) %>% summarize(Emissions = sum(Emissions))
#Merging both fips
VehicleEmissions <- merge(VehicleEmissions, BothFips)
#Construct the plot and save it to a PNG file 
png("plot6.png", width = 480, height = 480)
g <- ggplot(VehicleEmissions, aes(x = factor(year), y = round(Emissions), label=round(Emissions), fill = year)) + geom_bar(stat = "identity") + facet_grid(. ~ county) + labs(x="Year", y=expression("Total PM"[2.5]*" Emission"))+ geom_label(aes(fill = year),colour = "white", fontface = "bold") + ggtitle("Comparative of Baltimore and Los Angeles Vehicle Emissions")

print(g)

dev.off()