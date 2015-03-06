# Import data
data <- read.csv('household_power_consumption.txt', sep=";")

# Subset data to a two-day range Feb 1, 2007 - Feb 2, 2007
data2 = subset(data, as.Date(Date, "%d/%m/%Y") >= as.Date("2007-02-01", format="%Y-%m-%d") & as.Date(Date, "%d/%m/%Y") <= as.Date("2007-02-02", format="%Y-%m-%d"))

# Create plot grid
par(mfcol = c(2,2))
par(pin = c(0.8,0.8))
par(mar = c(4, 5, 2, 1))

# Plot 1
kw = as.numeric(as.character(data2$Global_active_power))
datetime = as.POSIXct(paste(data2$Date, data2$Time), format="%d/%m/%Y %H:%M:%S")

plot(datetime, kw, type="l", ylab="Global Active Power", xlab="")

# Plot 2
sub1 = as.numeric(as.character(data2$Sub_metering_1))
sub2 = as.numeric(as.character(data2$Sub_metering_2))
sub3 = as.numeric(as.character(data2$Sub_metering_3))

plot(datetime, sub1, type="l", ylab="Energy sub metering", xlab="")
lines(datetime, sub2, col="red")
lines(datetime, sub3, col="blue")
legend("topright", col=c("black", "red", "blue"), legend=c("sub_metering_1", "sub_metering_2", "sub_metering_3"), lty=1, cex=0.6, bty="n")

# Plot 3
voltage = as.numeric(as.character(data2$Voltage))
plot(datetime, voltage, type="l", ylab="Voltage", xlab="datetime")

# Plot 4
kw_reactive = as.numeric(as.character(data2$Global_reactive_power))
plot(datetime, kw_reactive, type="l", ylab="Global_reactive_power", xlab="datetime")

# Export to PNG file
dev.copy(png, file="figure/plot4.png")
dev.off()

