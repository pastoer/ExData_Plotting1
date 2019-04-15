##--------------------------------------------------------------------------------------------##
## R-Script      : plot1.R
## Author        : PT
## Created       : 15/04/2019
## Last modified : 15/04/2019
## Description   : Creates the first plot of Course Project 1
##--------------------------------------------------------------------------------------------##

## Read data
data <- read.table("./data/household_power_consumption.txt", header = TRUE, 
                                                             sep = ";", 
                                                             dec = ".", 
                                                             stringsAsFactors=FALSE)

## We are only interested ina 2-day period in February, 2007
dataRed <- subset(data, Date %in% c("1/2/2007","2/2/2007"))

## We want to show a histogram of the "global active power" in this period 
GlobalActivePower <- as.numeric(dataRed$Global_active_power)

png("plot1.png", width = 480, height = 480)
hist(GlobalActivePower, main = "Global Active Power", 
                        xlab = "Global Active Power (kilowatts)", 
                        col = "red")
dev.off()