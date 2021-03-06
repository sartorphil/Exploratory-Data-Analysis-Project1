rm(list = ls())
library(dplyr)
library(data.table)
setwd("/Users/psartor/Desktop/Data Management & Analytics/Exploratory Data Analysis")
## read the source data
dataFile <- "household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", na.strings = "?", stringsAsFactors=FALSE, dec=".")
## subsetting data to dates 2007-02-01 and 2007-02-02
subpower <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
## convert the Date and Time variables to Date/Time classes and subset the data
datetime <- strptime(paste(subpower$Date, subpower$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GlobalActivePower <- as.numeric(subpower$Global_active_power)
Voltage <- as.numeric(subpower$Voltage)
GlobalReactivePower <- as.numeric(subpower$Global_reactive_power)
## set up for 4 graphs
par(mfrow = c(2, 2))
## call 1st plot and label
plot(datetime, GlobalActivePower, type="l", ylab = "Global Active Power", xlab = "")
## call 2nd plot and label
plot(datetime, Voltage, type="l", xlab = "datetime", ylab = "Voltage")
## call 3rd plot and label
subMetering1 <- as.numeric(subpower$Sub_metering_1)
subMetering2 <- as.numeric(subpower$Sub_metering_2)
subMetering3 <- as.numeric(subpower$Sub_metering_3)
plot(datetime, subMetering1, type="l", xlab="", ylab="Energy sub metering")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", lty=1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1 ", "Sub_metering_2 ", "Sub_metering_3 "))
## call 4th plot and label
plot(datetime, GlobalReactivePower, type="l", xlab = "datetime", ylab = "Global_reactive_power")
## save plot4 file
dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()