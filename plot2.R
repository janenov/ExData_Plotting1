data <- read.csv("household_power_consumption.txt", na.string="?", sep=";")

# subset as per given dates
data <- data[(data$Date=="1/2/2007" | data$Date=="2/2/2007"),]

# Create a new variable DateTime
data$DateTime <- strptime(paste(data$Date, data$Time, sep=" "),format="%d/%m/%Y %H:%M:%S")

# Open png device
png("plot2.png", width=480, height=480)

# Plot the graph
plot(data$DateTime, data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

# Turn off device
dev.off()