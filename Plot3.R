## Processing the data for making plot3.png
All_Data <- read.csv("household_power_consumption.txt", header = T, stringsAsFactors = FALSE, sep = ";", dec = ".")
## Let us subset the data between the two dates for plot2
Plot3Data <- All_Data[All_Data$Date %in% c("1/2/2007", "2/2/2007"), ]
## We will load package data.table
library(data.table)
Plot3 <- data.table(Plot3Data)
## Now, we will convert data and time columns together and then convert it itno datetime using strptime
NewDateTime <- strptime(paste(Plot3$Date, Plot3$Time, sep = " "), "%d/%m/%Y %H:%M:%S") 
Plot3$NewDateTime <- as.POSIXct(NewDateTime) 
## Now, we will convert Global Active Power to numeric data
Plot3$Global_active_power <- as.numeric(Plot3$Global_active_power)
##Now we will convert others column to numeric from character
Sub_metering_1 <- as.numeric(Plot3$Sub_metering_1)
Sub_metering_2 <- as.numeric(Plot3$Sub_metering_2)
Sub_metering_3 <- as.numeric(Plot3$Sub_metering_3)
## Subsequent step, we will open the Graphic Device
png("plot3.png", width = 480, height = 480)
## Now, we will make plot3 using plot command
plot(NewDateTime, Sub_metering_1, type = "l", ylab = "Energy Sub_metering", xlab = "")
lines(NewDateTime, Sub_metering_2, type = "l", col = "red")
lines(NewDateTime, Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
## In last, the most important is to put off the Graphic device
dev.off()
