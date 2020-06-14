## Processing the data for making plot1.png
All_Data <- read.csv("household_power_consumption.txt", header = T, stringsAsFactors = FALSE, sep = ";", dec = ".")
## Let us subset the data between the two dates for plot1
Plot1Data <- All_Data[All_Data$Date %in% c("1/2/2007", "2/2/2007"), ] 
##Now, in next step we will convert the Global active from power from character to numeric
Plot1 <- as.numeric(Plot1Data$Global_active_power)
## Subsequent step, we will open the Graphic Device
png("plot1.png", width = 480, height = 480)
## Further, we will plot the histogram
hist(Plot1, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red")
##In last, the most important is to put off the Graphic device
dev.off()
