# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
# which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? 
# Which have seen increases in emissions from 1999–2008? 
# Use the ggplot2 plotting system to make a plot answer this question.

# Load ggplot2 library
if (!require("ggplot2")) {
  install.packages("ggplot2")
}
require("ggplot2")

# Loading provided datasets
loadData()
NEI <- readRDS("summarySCC_PM25.rds")

# Baltimore City, Maryland == fips
MD <- subset(NEI, fips == 24510)
MD$year <- factor(MD$year, levels=c('1999', '2002', '2005', '2008'))

# Generate the graph
png(filename='~/plot_3.png', width=480, height=480, units="px", bg="transparent")

g<-ggplot(aes(x = year, y = Emissions, fill=type), data=MD)
g+geom_bar(stat="identity")+
  facet_grid(.~type)+
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (Tons)")) + 
  labs(title=expression("PM"[2.5]*" Emissions, Baltimore City 1999-2008 by Source Type"))+
  guides(fill=FALSE)
dev.off()