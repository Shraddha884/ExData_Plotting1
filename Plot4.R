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
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))
## Now, we will make plot4 using plot command
plot(NewDateTime, Plot3$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power", cex = 0.2)
plot(NewDateTime, Plot3$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
plot(NewDateTime, Sub_metering_1, type = "l", ylab = "Energy Sub_metering", xlab = "")
lines(NewDateTime, Sub_metering_2, type = "l", col = "red")
lines(NewDateTime, Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=2.5, col=c("black", "red", "blue"))
plot(NewDateTime, Plot3$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
## In last, the most important is to put off the Graphic device
dev.off()

