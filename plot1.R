# Import data
data <- read.csv('household_power_consumption.txt', sep=";")

# Subset data to a two-day range Feb 1, 2007 - Feb 2, 2007
data2 = subset(data, as.Date(Date, "%d/%m/%Y") >= as.Date("2007-02-01", format="%Y-%m-%d") & as.Date(Date, "%d/%m/%Y") <= as.Date("2007-02-02", format="%Y-%m-%d"))

# Plot data
hist(as.numeric(as.character(data2$Global_active_power)), breaks=12, col="red", xlab="Global Active Power (kilowatts)", ylab="Frequency", main="Global Active Power")

# Export to PNG file
dev.copy(png, file="figure/plot1.png")
dev.off()
