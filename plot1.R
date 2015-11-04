# Plot 1: Frequency vs Global Active Power

# Read power consumption data set
# "?" is considered as NA in this data set

data <- read.csv("./Data/household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

# Combine date and time columns into one datetime column

data$DateTime <- strptime(paste(data$Date,data$Time), format="%d/%m/%Y %H:%M:%S")

# Subset data to consider only desired date span from 2007-02-01 to 2007-02-02.

sub_data = subset(data,as.Date(data$DateTime) >= "2007-02-01" & as.Date(data$DateTime) < "2007-02-03")

# Start the png device

png(filename="plot1.png", height=480, width=480, bg="transparent")

# Plot the histogram

hist(sub_data$Global_active_power,
     col="red",
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     ylab="Frequency")

# Save the plot and turn off device
# dev.copy(png, file="plot1.png", height=480, width=480)

dev.off()