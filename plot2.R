## First need to run initialization script init.R to prepare dataset "final_subset"

## Plotting script plot2.R

# Print plot into plot1.png file by initializing png graphics
png(filename = "./EDA/plot2.png", width = 480, height = 480, units = "px")

# Make the plot to be exported
with(final_subset, plot(date_time, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))

# Turn graphics device off
dev.off()
