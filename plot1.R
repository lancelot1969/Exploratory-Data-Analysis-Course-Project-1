## First need to run initialization script init.R to prepare dataset "final_subset"

## Plotting script plot1.R

# Print plot into plot1.png file by initializing png graphics
png(filename = "./EDA/plot1.png", width = 480, height = 480, units = "px")

# Make a plot 
hist(final_subset$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

# Turn graphics device off
dev.off()