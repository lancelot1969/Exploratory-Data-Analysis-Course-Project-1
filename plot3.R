## First need to run initialization script init.R to prepare dataset "final_subset"

## Plotting script plot3.R

# Print plot into plot1.png file by initializing png graphics
png(filename = "./EDA/plot3.png", width = 480, height = 480, units = "px")
# 

# Make a plot to be exported
plot(final_subset$date_time, power_subset$Sub_metering_1, xlab = " ", ylab ="Energy sub metering", type = "l", col = "black")
lines(final_subset$date_time, power_subset$Sub_metering_2, xlab = " ", ylab =" ", type = "l", col = "red")
lines(final_subset$date_time, power_subset$Sub_metering_3, xlab = " ", ylab =" ", type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col =  c("black","red","blue"), lty = c(1,1,1))

# turn all graphic devices off
dev.off()
