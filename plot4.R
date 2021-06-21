## read data
source("read_data.R")

## plot4
coal <- SCC[grepl("Coal", SCC$Short.Name),]
coalNEI <- NEI[NEI$SCC %in% coal$SCC,] ## extract the data with coal combustion-related Emissions
png(filename = "plot4.png",width = 540, height = 480, units = "px")
q4 <- with(coalNEI, tapply(Emissions, year, sum, na.rm = T))
d4 <- data.frame(year = names(q4), total = q4)
with(d4, barplot(total~year, main = expression('Coal related PM'[2.5]*" Emissions in the United States from 1999 to 2008"),xlab = "Year", ylab = expression('Total PM'[2.5]*" Emission (in tons)")))
dev.off()