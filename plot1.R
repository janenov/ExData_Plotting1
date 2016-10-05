library(dplyr)
library(data.table)

mydt <- fread("household_power_consumption.txt", na.strings = "?", sep = ";")
mydt$DateTime <- paste(mydt$Date, mydt$Time)
mydt$DateTime <- as.Date(mydt$DateTime, format = "%d/%m/%Y %H:%M:%S")
sub <- filter(mydt, DateTime >= as.Date("2007-02-01 00:00:00"), DateTime < as.Date("2007-02-03 00:00:00"))

png(filename='plot1.png', width=480, height=480, units='px')
hist(as.numeric(sub$Global_active_power), main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red")



dev.off()