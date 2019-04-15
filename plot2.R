##--------------------------------------------------------------------------------------------##
## R-Script      : plot2.R
## Author        : PT
## Created       : 15/04/2019
## Last modified : 15/04/2019
## Description   : Creates the second plot of Course Project 1
##--------------------------------------------------------------------------------------------##

## Read data
data <- read.table("./data/household_power_consumption.txt", header = TRUE, 
                   sep = ";", 
                   dec = ".", 
                   stringsAsFactors=FALSE)

## We are only interested ina 2-day period in February, 2007
dataRed <- subset(data, Date %in% c("1/2/2007","2/2/2007"))

## We want to show a plot of the "global active power" over time in this period
GlobalActivePower <- as.numeric(dataRed$Global_active_power)
TimeConv <- strptime(paste(dataRed$Date, dataRed$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

png("plot2.png", width = 480, height = 480)
plot(TimeConv, GlobalActivePower, xlab = "", 
                                  ylab = "Global Active Power (kilowatts)", 
                                  type = "l")
dev.off()
