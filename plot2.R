# Import data
data <- read.csv('household_power_consumption.txt', sep=";")

# Subset data to a two-day range Feb 1, 2007 - Feb 2, 2007
data2 = subset(data, as.Date(Date, "%d/%m/%Y") >= as.Date("2007-02-01", format="%Y-%m-%d") & as.Date(Date, "%d/%m/%Y") <= as.Date("2007-02-02", format="%Y-%m-%d"))

# Setup data to plot
kw = as.numeric(as.character(data2$Global_active_power))
datetime = as.POSIXct(paste(data2$Date, data2$Time), format="%d/%m/%Y %H:%M:%S")

# Plot data
plot(datetime, kw, type="l", ylab="Global Active Power (kilowatts)", xlab="")

# Export to PNG file
dev.copy(png, file="figure/plot2.png")
dev.off()
