##file is saved in working directory.
##reading the file in the wd. set na.stringss to "?"
power <- read.csv("household_power_consumption.txt", sep=";", na.strings="?",stringsAsFactors =FALSE)

##getting subset of dtaa with dates 1/2/2007-2/2007
subpower <-subset(power, power$Date=="1/2/2007" | power$Date=="2/2/2007")

## concatenate Date and Time fields by paste function
## convert the string got in p.1 to a convinient POSIXct date format
## draw a plot with the date in new format on x axis and Global_active_power on y axis
plot(as.POSIXct(paste(subpower$Date, subpower$Time), "%d/%m/%Y %H:%M:%S", tz="UTC"), subpower$Global_active_power, type="l", ylab = "Global Active Power (kilowatts)", xlab=NA)
dev.copy(png, file = "plot2.png", width=480, height=480)  ## Copy plot to a PNG file

## Close the PNG device
dev.off()  