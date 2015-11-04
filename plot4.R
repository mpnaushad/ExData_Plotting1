# Plot 4: Combining Multiple Plots in one view

# Read power consumption data set
# "?" is considered as NA in this data set

data <- read.csv("./Data/household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

# Combine date and time columns into one datetime column

data$DateTime <- strptime(paste(data$Date,data$Time), format="%d/%m/%Y %H:%M:%S")

# Subset data to consider only desired date span from 2007-02-01 to 2007-02-02.

sub_data = subset(data,as.Date(data$DateTime) >= "2007-02-01" & as.Date(data$DateTime) < "2007-02-03")

# Start the png device

png(filename="plot4.png", height=480, width=480, bg="transparent")

# Create a 2x2 split

par(mfrow=c(2,2))

# SUBPLOT 1

plot(sub_data$DateTime,
     sub_data$Global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power")

# SUBPLOT 2

plot(sub_data$DateTime,
     sub_data$Voltage,
     type="l",
     xlab="datetime",
     ylab="Voltage")

# SUBPLOT 3

# Plot the first sub-meter
plot(sub_data$DateTime,
     sub_data$Sub_metering_1,
     type="l",
     xlab="",
     ylab="Energy sub metering")

# Plot the second sub-meter
lines(sub_data$DateTime,
      sub_data$Sub_metering_2,
      type="l",
      col="red")

# Plot the third sub-meter
lines(sub_data$DateTime,
      sub_data$Sub_metering_3,
      type="l",
      col="blue")

# Add the legend to the Plot
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,lwd=2,col=c("black","red","blue"),bty="n")

# SUBPLOT 4

plot(sub_data$DateTime,
     sub_data$Global_reactive_power,
     type="l",
     xlab="datetime",
     ylab="Global_reactive_power")

# Save the plot and turn off device
dev.off()