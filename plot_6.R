# Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources 
# in Los Angeles County, California (fips == 06037). Which city has seen greater changes over time 
# in motor vehicle emissions?

# Load ggplot2 library
if (!require(ggplot2)) {
  install.packages(ggplot2)
}
require(ggplot2)

# Load ggplot2 library
if (!require("ggplot2")) {
  install.packages("ggplot2")
}
require("ggplot2")

# Loading provided datasets
loadData()
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

baltLosAngelesMotors <- subset(NEI, NEI$fips %in% c("24510","06037") & NEI$type == "ON-ROAD")
baltLosAngelesMotorsAGG <- aggregate(Emissions ~ year + fips, baltLosAngelesMotors, sum)

# Generate the graph in the same directory as the source code
png('~/plot_6.png', width=480, height=480, units="px", bg="transparent")

ggplot(baltLosAngelesMotorsAGG, aes(year, Emissions, col = fips)) +
      geom_line() +
      geom_point() +
      ggtitle(expression("Baltimore and Los Angeles" ~ PM[2.5] ~ "Motor Vehicle Emissions by Year")) +
      labs(x = "Year", y = expression(~PM[2.5]~ "Motor Vehicle Emissions") ) +
      scale_colour_discrete(name = "City", labels = c("Los Angeles", "Baltimore")) +
      theme(legend.title = element_text(face = "bold"))

dev.off()