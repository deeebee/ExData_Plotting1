#filename: plot3.R
#description: This file reads in the household_power_consumption.txt datset
#             Changes the Date column to date format 
#             filters the data so we only have 2/2 and 2/1 data
#             combines the date and time fields to a datetime field
#             creates a line chart of with three series (sub_metering_1/2/3) by date
#             set the legend to the top right and with the correct data setup
#             saves the plot as plot3.png in the same directory as the script is running in
#usage: Download the zip file from https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
#       and unzip into the same directory as the script and set you working directory to the same directory then
#       just run the script below
#       data dictionary is here: https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption

myinputdata <- read.table(file="./household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
myinputdata$Date <- as.Date(myinputdata$Date, "%d/%m/%Y")

#filter the data so we just have the days of 20070201 & 20070202
mydata <- myinputdata[myinputdata$Date == as.Date("20070202",format="%Y%m%d") | myinputdata$Date == as.Date("20070201",format="%Y%m%d"), ]
mydata$datetime <- as.POSIXct(paste(mydata$Date,mydata$Time), format="%Y-%m-%d %H:%M:%S")

png("plot3.png", width=480,height=480)
plot(x=mydata$datetime,y=mydata$Sub_metering_1, type="l", xlab="",ylab="Energy sub metering")
lines(x=mydata$datetime,y=mydata$Sub_metering_2,col="Red")
lines(x=mydata$datetime,y=mydata$Sub_metering_3,col="Blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1), col=c("Black","Red","Blue"))
dev.off()
