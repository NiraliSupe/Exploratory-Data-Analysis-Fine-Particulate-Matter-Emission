# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") 
# from 1999 to 2008? Use the base plotting system to make a plot answering this question.
# Generate the graph in the same directory as the source code
# Loading provided datasets
loadData()
NEI <- readRDS("summarySCC_PM25.rds")

png(filename='plot_2.png')

baltimore <- subset(NEI, NEI$fips == "24510")

totalBaltimore <- aggregate(Emissions ~ year, baltimore, sum)

# Generate the graph
png(filename='~/plot_2.png', width=480, height=480, units="px", bg="transparent")
plot(totalBaltimore$year, totalBaltimore$Emissions, type = "o", main = expression("Total Baltimore" ~ PM[2.5] ~ "Emissions by Year"), xlab = "Year", ylab = expression("Total Baltimore "~ PM[2.5] ~ "Emissions"), col = "steelblue3")
dev.off()