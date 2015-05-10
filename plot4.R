df <- fread("household_power_consumption.txt", nrows = 2880, skip = "1/2/2007", na.strings = "?")
variables <- colnames(fread("household_power_consumption.txt", nrows = 1))
setnames(df, 1:9, variables)
png(file = "plot4.png")
df$date_time <-(paste(df$Date, df$Time))
par(mfrow = c(2,2))
plot(strptime(df$date_time, format = "%d/%m/%Y %H:%M:%S"), df$Global_active_power, type = "l", xlab = "", 
     ylab = "Global Active Power (kilowatts)")
plot(strptime(df$date_time, format = "%d/%m/%Y %H:%M:%S"), df$Voltage, type = "l", xlab = "datetime", 
     ylab = "Voltage")
plot(strptime(df$date_time, format = "%d/%m/%Y %H:%M:%S"), df$Sub_metering_1, type = "l", xlab = "", 
     ylab = "Energy sub metering")
lines(strptime(df$date_time, format = "%d/%m/%Y %H:%M:%S"), df$Sub_metering_2, col = "red")
lines(strptime(df$date_time, format = "%d/%m/%Y %H:%M:%S"), df$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1),col=c("black", "red", "blue"),
       cex = .75) 
plot(strptime(df$date_time, format = "%d/%m/%Y %H:%M:%S"), df$Global_reactive_power, type = "l", xlab = "datetime", 
     ylab = "Global_Reactive_Power")
dev <- dev.off()
