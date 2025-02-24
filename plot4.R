# load the data
data <- read.table("household_power_consumption.txt",
                   header = T, sep = ";", na.strings = "?")

# convert the date variable to Date class
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# Subset the data
data <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

# Convert dates and times
data$datetime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")

png("plot4.png", width = 480, height = 480)

par(mfrow = c(2,2))

# Plot 1
plot(data$datetime, data$Global_active_power, type="l", xlab = "", ylab = "Global Active Power")

# Plot 2
plot(data$datetime, data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

# Plot 3
plot(data$datetime, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(data$datetime, data$Sub_metering_2, col = "red")
lines(data$datetime, data$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       , lty = c(1,1)
       , bty = "n"
       , cex = .5) 

# Plot 4
plot(data$datetime, data$Global_reactive_power, type="l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()