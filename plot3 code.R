data = read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
data2 = data[data$Date == "1/2/2007",]
data3 = data[data$Date == "2/2/2007",]
datasub = rbind(data2, data3)
datasub$UTC <-paste(datasub$Date, datasub$Time)
datasub$UTC <- strptime(datasub$UTC, format = "%d/%m/%Y %H:%M:%S")
plot(datasub$UTC, datasub$Sub_metering_1, type = "l", col = "black", ylab = "Energy sub metering", xlab = "")
points(datasub$UTC, datasub$Sub_metering_2, type = "l", col = "red")
points(datasub$UTC, datasub$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png, file = "plot3.png")
dev.off()