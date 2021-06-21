## read data
source("read_data.R")

## plot3
library(ggplot2)
png(filename = "plot3.png",width = 720, height = 480, units = "px")
g <- ggplot(df2, aes(x=as.factor(year), y = log10(Emissions), fill=as.factor(year), group = as.factor(year)))
g + geom_boxplot() + 
        facet_grid(.~ type) + 
        stat_boxplot(geom="errorbar")+
        labs(x = "Year")+
        labs(fill = "Year")+
        labs(y = expression('Total log10PM'[2.5]*" Emission (in tons)"))+
        labs(title = "Emissions per Type in Baltimore City from 1999 to 2008")+
        theme(plot.title = element_text(hjust = 0.5))
dev.off()
