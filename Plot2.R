## Processing the data for making plot2.png
All_Data <- read.csv("household_power_consumption.txt", header = T, stringsAsFactors = FALSE, sep = ";", dec = ".")
## Let us subset the data between the two dates for plot2
Plot2Data <- All_Data[All_Data$Date %in% c("1/2/2007", "2/2/2007"), ]
## We will load package data.table
library(data.table)
Plot2 <- data.table(Plot2Data)
## Now, we will convert data and time columns together and then convert it itno datetime using strptime
NewDateTime <- strptime(paste(Plot2$Date, Plot2$Time, sep = " "), "%d/%m/%Y %H:%M:%S") 
Plot2$NewDateTime <- as.POSIXct(NewDateTime) 
## Now, we will convert Global Active Power to numeric data
Plot2$Global_active_power <- as.numeric(Plot2$Global_active_power)
## Subsequent step, we will open the Graphic Device
png("plot2.png", width = 480, height = 480)
## Further, we will plot the variable NewDate Time versus Global Active Power
plot(Plot2$NewDateTime, Plot2$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (KW)")
## In last, the most important is to put off the Graphic device
dev.off()
