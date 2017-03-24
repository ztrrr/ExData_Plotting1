data = read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
data2 = data[data$Date == "1/2/2007",]
data3 = data[data$Date == "2/2/2007",]
datasub = rbind(data2, data3)
datasub$UTC <-paste(datasub$Date, datasub$Time)
datasub$UTC <- strptime(datasub$UTC, format = "%d/%m/%Y %H:%M:%S")
hist(datasub$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "Red")
dev.copy(png, file = "plot1.png")
dev.off()