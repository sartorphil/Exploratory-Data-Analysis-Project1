rm(list = ls())
library(dplyr)
library(data.table)
setwd("/Users/psartor/Desktop/Data Management & Analytics/Exploratory Data Analysis")
## read the source data
dataFile <- "household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", na.strings = "?", stringsAsFactors=FALSE, dec=".")
## subsetting data to dates 2007-02-01 and 2007-02-02
subpower <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
## call histogram plot
hist(as.numeric(as.character(subpower$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
## save file
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()
