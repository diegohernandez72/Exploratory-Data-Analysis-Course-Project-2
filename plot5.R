#5)How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

#setting directory
setwd("~/Desktop/DST/Exploratory Data Analysis/Course Project 2/exdata-data-NEI_data")
#Load data from archives
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")   

#Subsetting vehicles from SCC data using grep
SCCVehicles <- SCC[grep("[Vv]ehicle", SCC$EI.Sector), "SCC"]
##Filtering vehicle emissions related NEI data frame in Baltimore (fips=="24510"), grouped by year and sum
VehicleEmissions <- NEI %>% filter(SCC %in% SCCVehicles & fips == "24510") %>% group_by(year) %>% summarise(Emissions = sum(Emissions))
#Construct the plot and save it to a PNG file 
png("plot5.png", width = 480, height = 480)
g <- ggplot(VehicleEmissions, aes(x=year, y=round(Emissions), label=round(Emissions), fill=year)) +
    geom_bar(stat="identity") + labs(x="Year", y=expression("Total PM"[2.5]*" Emission")) +
    geom_label(aes(fill = year),colour = "white", fontface = "bold") +
    ggtitle("Vehicle Emissions in Baltimore from 1999 to 2008")
print(g)

dev.off(
    
)