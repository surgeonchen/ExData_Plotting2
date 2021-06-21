## read data
source("read_data.R")

## plot5
library(tidyverse)
df5 <- NEI %>% filter(fips == "24510", type == "ON-ROAD") ## extract the data with motor vehicle related emissions in Baltimore City
png(filename = "plot5.png",width = 720, height = 480, units = "px")
q5 <- with(df5, tapply(Emissions, year, sum, na.rm = T))
d5 <- data.frame(year = names(q5), total = q5)
with(d5, barplot(total~year, main = expression('Motor vehicle related PM'[2.5]*" Emissions in the Baltimore City, Maryland from 1999 to 2008"),xlab = "Year", ylab = expression('Total PM'[2.5]*" Emission (in tons)")))
dev.off()
