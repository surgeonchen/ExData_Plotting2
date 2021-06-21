## read data
source("read_data.R")

## plot2
png(filename = "plot2.png",width = 540, height = 480, units = "px")
df2 <- subset(NEI, fips == "24510") ## subset the data with Baltimore City
q2 <- with(df2, tapply(Emissions, year, sum, na.rm = T))
d2 <- data.frame(year = names(q2), total = q2)
with(d2, barplot(total~year, main = expression('Total PM'[2.5]*" Emissions in the the Baltimore City, Maryland from 1999 to 2008"),xlab = "Year", ylab = expression('Total PM'[2.5]*" Emission (in tons)")))
dev.off()