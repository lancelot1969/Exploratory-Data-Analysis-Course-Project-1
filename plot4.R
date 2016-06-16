## First need to run initialization script init.R to prepare dataset "final_subset"

## Plotting script plot3.R

# Print plot into plot1.png file by initializing png graphics
png(filename = "./EDA/plot4.png", width = 480, height = 480, units = "px")
# 

# Make a plot to be exported
par(mfrow = c(2, 2))
with(final_subset, plot(date_time, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))
plot(final_subset$date_time, final_subset$Voltage, xlab = "datetime", ylab = "Voltage", type = "l")
plot(final_subset$date_time, power_subset$Sub_metering_1, xlab = " ", ylab ="Energy sub metering", type = "l", col = "black")
lines(final_subset$date_time, power_subset$Sub_metering_2, xlab = " ", ylab =" ", type = "l", col = "red")
lines(final_subset$date_time, power_subset$Sub_metering_3, xlab = " ", ylab =" ", type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col =  c("black","red","blue"), lty = c(1,1,1))
plot(final_subset$date_time, final_subset$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "l")

# turn all graphic devices off
dev.off()