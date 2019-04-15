##--------------------------------------------------------------------------------------------##
## R-Script      : plot4.R
## Author        : PT
## Created       : 15/04/2019
## Last modified : 15/04/2019
## Description   : Creates the fourth plot of Course Project 1
##--------------------------------------------------------------------------------------------##

## Read data
data <- read.table("./data/household_power_consumption.txt", header = TRUE, 
                   sep = ";", 
                   dec = ".", 
                   stringsAsFactors=FALSE)

## We are only interested ina 2-day period in February, 2007
dataRed <- subset(data, Date %in% c("1/2/2007","2/2/2007"))

## Define all variable vectors
TimeConv <- strptime(paste(dataRed$Date, dataRed$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
GlobalActivePower <- as.numeric(dataRed$Global_active_power)
Voltage <- as.numeric(dataRed$Voltage)
SubMetering1 <- as.numeric(dataRed$Sub_metering_1)
SubMetering2 <- as.numeric(dataRed$Sub_metering_2)
SubMetering3 <- as.numeric(dataRed$Sub_metering_3)
GlobalReactivePower <- as.numeric(dataRed$Global_reactive_power)

png("plot4.png", width = 480, height = 480)
par(mfrow=c(2,2)) ## 2x2 plot panel

## 1st plot
plot(TimeConv, GlobalActivePower, xlab = "", 
                                  ylab = "Global Active Power",
                                  type = "l") 
## 2nd plot
plot(TimeConv, Voltage, xlab = "datetime", 
                        ylab = "Voltage", 
                        type = "l")
## 3rd plot
plot(TimeConv, SubMetering1, xlab = "", 
     ylab = "Energy sub metering", 
     type = "l")
lines(TimeConv, SubMetering2, type = "l", 
      col = "red")
lines(TimeConv, SubMetering3, type = "l", 
      col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
                   col =c("black", "red", "blue"),
                   lty = 1, 
                   lwd = 2.5, 
                   bty = "n")
## 4th plot
plot(TimeConv, GlobalReactivePower, xlab = "", 
                                    ylab = "Global_reactive_power",
                                    type = "l") 
dev.off()
