data = read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
data2 = data[data$Date == "1/2/2007",]
data3 = data[data$Date == "2/2/2007",]
datasub = rbind(data2, data3)
datasub$UTC <-paste(datasub$Date, datasub$Time)
datasub$UTC <- strptime(datasub$UTC, format = "%d/%m/%Y %H:%M:%S")

par(mfrow = c(2,2))
with(datasub, {
        plot(datasub$UTC, datasub$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")
        plot(datasub$UTC, datasub$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")
        plot(datasub$UTC, datasub$Sub_metering_1, type = "l", col = "black", ylab = "Energy sub metering", xlab = "")
                points(datasub$UTC, datasub$Sub_metering_2, type = "l", col = "red")
                points(datasub$UTC, datasub$Sub_metering_3, type = "l", col = "blue")
                legend("top", lty = 1, bty = "n", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        plot(datasub$UTC, datasub$Global_reactive_power, type = "l", ylab = "Global reactive power", xlab = "datetime")
})
dev.copy(png, width = 500, height = 500, file = "plot4.png")
dev.off()
