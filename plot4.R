par(mfrow=c(2,2))

data <- read.csv("household_power_consumption.txt", na.string="?", sep=";")

# subset as per given dates
data <- data[(data$Date=="1/2/2007" | data$Date=="2/2/2007"),]

# Create a new variable DateTime
data$DateTime <- strptime(paste(data$Date, data$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")

# Open png device
png("plot4.png", width=480, height=480)

plot(data$DateTime, data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
plot(data$DateTime, data$Voltage, type="l", xlab="", ylab="Voltage")
plot(data$DateTime, data$Sub_metering_1, type="l", xlab="", ylab="Energy Sub metering")
lines(data$DateTime, data$Sub_metering_2, type="l", xlab="", ylab="Energy sub metering", col = "red")
lines(data$DateTime, data$Sub_metering_3, type="l", xlab="", ylab="Energy sub metering", col = "blue")
legend("topright",c("Sub metering 1", "Sub metering 2", "Sub metering 3"), lty = c(1,1,1), col = c("black", "red", "blue"))
plot(data$DateTime, data$Global_reactive_power, type="l", xlab="", ylab="Global reactive power")