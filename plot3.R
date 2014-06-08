##file is saved in working directory.
##reading the file in the wd. set na.stringss to "?"
power <- read.csv("household_power_consumption.txt", sep=";", na.strings="?",stringsAsFactors =FALSE)

##getting subset of dtaa with dates 1/2/2007-2/2007
subpower <-subset(power, power$Date=="1/2/2007" | power$Date=="2/2/2007")

##Open png device to write file
png(file="plot3.png", width=480, height=480)

##draw a plot with one line first (black line for Sub_metering_1)
##add blue and red lines using lines() function
##add legend. Position - topright, lty parameter for lines 
plot(as.POSIXct(paste(subpower$Date, subpower$Time), "%d/%m/%Y %H:%M:%S", tz="UCT"), subpower$Sub_metering_1, type="l", ylab = "Energy sub metering ", xlab=NA)
lines(as.POSIXct(paste(subpower$Date, subpower$Time), "%d/%m/%Y %H:%M:%S", tz="UCT"), subpower$Sub_metering_2, col="red")
lines(as.POSIXct(paste(subpower$Date, subpower$Time), "%d/%m/%Y %H:%M:%S", tz="UCT"), subpower$Sub_metering_3, col="blue")
legend("topright", lty=1, col=c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

##close the PNG device
dev.off() 