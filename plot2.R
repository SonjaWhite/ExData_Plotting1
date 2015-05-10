#(load data.table)
df <- fread("household_power_consumption.txt", nrows = 2880, skip = "1/2/2007", na.strings = "?")
variables <- colnames(fread("household_power_consumption.txt", nrows = 1))
setnames(df, 1:9, variables)
png(file = "plot2.png")
df$date_time <-(paste(df$Date, df$Time))
plot(strptime(df$date_time, format = "%d/%m/%Y %H:%M:%S"), df$Global_active_power, type = "l", xlab = "", 
        ylab = "Global Active Power (kilowatts)")
dev <- dev.off()
        


