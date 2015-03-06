# Import data
data <- read.csv('household_power_consumption.txt', sep=";")

# Subset data to a two-day range Feb 1, 2007 - Feb 2, 2007
data2 = subset(data, as.Date(Date, "%d/%m/%Y") >= as.Date("2007-02-01", format="%Y-%m-%d") & as.Date(Date, "%d/%m/%Y") <= as.Date("2007-02-02", format="%Y-%m-%d"))

# Setup data to plot
sub1 = as.numeric(as.character(data2$Sub_metering_1))
sub2 = as.numeric(as.character(data2$Sub_metering_2))
sub3 = as.numeric(as.character(data2$Sub_metering_3))
datetime = as.POSIXct(paste(data2$Date, data2$Time), format="%d/%m/%Y %H:%M:%S")

# Plot data
plot(datetime, sub1, type="l", ylab="Energy sub metering", xlab="")
lines(datetime, sub2, col="red")
lines(datetime, sub3, col="blue")
legend("topright", col=c("black", "red", "blue"), legend=c("sub_metering_1", "sub_metering_2", "sub_metering_3"), lty=1)

# Export to PNG file
dev.copy(png, file="figure/plot3.png")
dev.off()
