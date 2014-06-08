##file is saved in working directory.
##reading the file in the wd.
power <- read.csv("household_power_consumption.txt", sep=";", na.strings="?",stringsAsFactors =FALSE)

##getting subset of dtaa with dates 1/2/2007-2/2007
subpower <-subset(power, power$Date=="1/2/2007" | power$Date=="2/2/2007")

##create histogram with all the parameters
hist(subpower$Global_active_power, col="red", xlab= "Global Active Power (kilowatts)", main ="Global Active Power")

##copy plot to png file
dev.copy(png,file="plot1.png",width=480, height=480)

##close png device
dev.off()
