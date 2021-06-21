file = "./exdata_data_NEI_data.zip"
unzip(file,exdir=getwd())
dir()
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
