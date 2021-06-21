## read data
source("read_data.R")

## plot1
png(filename = "plot1.png",width = 480, height = 480, units = "px")
q1 <- with(NEI, tapply(Emissions, year, sum, na.rm = T))
d1 <- data.frame(year = names(q1), total = q1)
with(d1, barplot(total~year, main = expression('Total PM'[2.5]*" Emissions in the United States from 1999 to 2008"),xlab = "Year", ylab = expression('Total PM'[2.5]*" Emission (in tons)")))
dev.off()