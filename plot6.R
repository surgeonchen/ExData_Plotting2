## read data
source("read_data.R")

## plot6
library(tidyverse)
df5 <- NEI %>% filter(fips == "24510", type == "ON-ROAD") ## extract the data with motor vehicle related emissions in the Baltimore City
q5 <- with(df5, tapply(Emissions, year, sum, na.rm = T))
d5 <- data.frame(year = names(q5), total = q5)
df6 <- NEI %>% filter(fips == "06037", type == "ON-ROAD")## extract the data with motor vehicle related emissions in the Los Angeles County
q6 <- with(df6, tapply(Emissions, year, sum, na.rm = T))
d6 <- data.frame(year = names(q6), total = q6)
mrg <- full_join(d5, d6) %>% mutate(place = rep(c("Baltimore city","Los Angeles County"), each = 4)) ## merge two data frames to a new data frame
png(filename = "plot6.png",width = 720, height = 480, units = "px")
g <- ggplot(mrg, aes(as.factor(year), y = total))
g + geom_bar(aes(fill = place),stat = "identity",position="dodge")+
        labs(x = "Year")+
        labs(fill = NULL)+
        labs(y = expression('Total PM'[2.5]*" Emission (in tons)"))+
        labs(title = expression('Motor vehicle related PM'[2.5]*" Emissions in Baltimore City and Los Angeles County from 1999 to 2008"))+
        theme(plot.title = element_text(hjust = 0.5))
dev.off()