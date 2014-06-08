##file is saved in working directory.
##reading the file in the wd. set na.stringss to "?"
power <- read.csv("household_power_consumption.txt", sep=";", na.strings="?",stringsAsFactors =FALSE)

##getting subset of dtaa with dates 1/2/2007-2/2007
subpower <-subset(power, power$Date=="1/2/2007" | power$Date=="2/2/2007")

##open png device to write file
png(file="plot4.png", width=480, height=480)
##make space for 4 charts
par(mfrow=c(2,2), cex=0.75)

#chart 1 (same as in plot2.R)
plot(as.POSIXct(paste(subpower$Date, subpower$Time), "%d/%m/%Y %H:%M:%S", tz="UTС"), subpower$Global_active_power, type="l", ylab = "Global Active Power", xlab=NA)
#chart 2
plot(as.POSIXct(paste(subpower$Date, subpower$Time), "%d/%m/%Y %H:%M:%S", tz="UTС"), subpower$Voltage, type="l", ylab = "Voltage", xlab="datetime")
#chart 3 (same as in plot3.R)
plot(as.POSIXct(paste(subpower$Date, subpower$Time), "%d/%m/%Y %H:%M:%S", tz="UTС"), subpower$Sub_metering_1, type="l", ylab = "Energy sub metering ", xlab=NA)
lines(as.POSIXct(paste(subpower$Date, subpower$Time), "%d/%m/%Y %H:%M:%S", tz="UTС"), subpower$Sub_metering_2, col="red")
lines(as.POSIXct(paste(subpower$Date, subpower$Time), "%d/%m/%Y %H:%M:%S", tz="UTС"), subpower$Sub_metering_3, col="blue")
legend("topright", lty=1, xjust=0, col=c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
#chart4
plot(as.POSIXct(paste(subpower$Date, subpower$Time), "%d/%m/%Y %H:%M:%S", tz="UCT"), subpower$Global_reactive_power, type="l", ylab = "Global_reactive_power", xlab="datetime")

##close the PNG device
dev.off()  