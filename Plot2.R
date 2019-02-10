rm(list = ls())
library(dplyr)
library(data.table)
setwd("/Users/psartor/Desktop/Data Management & Analytics/Exploratory Data Analysis")
## read the source data
dataFile <- "household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", na.strings = "?", stringsAsFactors=FALSE, dec=".")
## subsetting data to dates 2007-02-01 and 2007-02-02
subpower <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
## convert the Date and Time variables to Date/Time classes
datetime <- strptime(paste(subpower$Date, subpower$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GlobalActivePower <- as.numeric(subpower$Global_active_power)
## call plot
plot(datetime, GlobalActivePower, type="l", ylab = "Global Active Power (kilowatts)", xlab = "")
## save plot2 file
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()