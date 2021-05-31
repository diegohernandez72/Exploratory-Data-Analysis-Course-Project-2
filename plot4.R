#4)Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?
    
#setting directory
setwd("~/Desktop/DST/Exploratory Data Analysis/Course Project 2/exdata-data-NEI_data")
#Load data from archives
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(ggplot2)
#subsetting coal combustion emissions from SCC data using grep
CoalCombustion <- SCC[grep("[Cc][Oo][Aa][Ll]", SCC$EI.Sector), "SCC"]
#filtering Coal Combustion related NEI data frame
CoalNEI <- NEI %>% filter(SCC %in% CoalCombustion)
#CoalTotal has data grouped by year and emissions are sum by year
CoalTotal <- CoalNEI %>% group_by(year) %>% summarise(Emissions = sum(Emissions))
#Construct the plot and save it to a PNG file 
png("plot4.png",width=480,height=480)
g <- ggplot(data=CoalTotal, aes(x=year, y=round(Emissions/1000,2), label=round(Emissions/1000,2), fill=year)) + geom_bar(stat="identity") + labs(x="Year", y=expression("Total PM"[2.5]*" Emission")) + geom_label(aes(fill = year),colour = "white", fontface = "bold") + ggtitle("Coal Combustion Emissions 1999 - 2008")
print(g)

dev.off()