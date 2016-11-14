#filename: plot1.R
#description: This file reads in the household_power_consumption.txt datset
#             Changes the Date column to date format 
#             filters the data so we only have 2/2 and 2/1 data
#             creates a histogram of Global_active_power
#             saves the plot as plot1.png in the same directory as the script is running in
#usage: Download the zip file from https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
#       and unzip into the same directory as the script and set you working directory to the same directory then
#       just run the script below
#       data dictionary is here: https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption

myinputdata <- read.table(file="./household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
myinputdata$Date <- as.Date(myinputdata$Date, "%d/%m/%Y")

#filter the data so we just have the days of 20070201 & 20070202
mydata <- myinputdata[myinputdata$Date == as.Date("20070202",format="%Y%m%d") | myinputdata$Date == as.Date("20070201",format="%Y%m%d"), ]
png("plot1.png", width=480,height=480)
hist(mydata$Global_active_power, main="Global Active Power",xlab="Global Active Power (Kilowatts)",col="Red" )
dev.off()