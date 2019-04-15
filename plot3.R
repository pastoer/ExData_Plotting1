##--------------------------------------------------------------------------------------------##
## R-Script      : plot3.R
## Author        : PT
## Created       : 15/04/2019
## Last modified : 15/04/2019
## Description   : Creates the third plot of Course Project 1
##--------------------------------------------------------------------------------------------##

## Read data
data <- read.table("./data/household_power_consumption.txt", header = TRUE, 
                   sep = ";", 
                   dec = ".", 
                   stringsAsFactors=FALSE)

## We are only interested ina 2-day period in February, 2007
dataRed <- subset(data, Date %in% c("1/2/2007","2/2/2007"))

## We want to show a plot of the "energy sub metering" over time in this period
SubMetering1 <- as.numeric(dataRed$Sub_metering_1)
SubMetering2 <- as.numeric(dataRed$Sub_metering_2)
SubMetering3 <- as.numeric(dataRed$Sub_metering_3)
TimeConv <- strptime(paste(dataRed$Date, dataRed$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

png("plot3.png", width = 480, height = 480)
plot(TimeConv, SubMetering1, xlab = "", 
                             ylab = "Energy sub metering", 
                             type = "l")
lines(TimeConv, SubMetering2, type = "l", 
                              col = "red")
lines(TimeConv, SubMetering3, type = "l", 
                              col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
                   col=c("black", "red", "blue"),
                   lty = 1, 
                   lwd = 2.5)
dev.off()