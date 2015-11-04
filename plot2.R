# Plot 2: Global Active Power VS DateTime
# Read power consumption data set
# "?" is considered as NA in this data set

data <- read.csv("./Data/household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

# Combine date and time columns into one datetime column

data$DateTime <- strptime(paste(data$Date,data$Time), format="%d/%m/%Y %H:%M:%S")

# Subset data to consider only desired date span from 2007-02-01 to 2007-02-02.

sub_data = subset(data,as.Date(data$DateTime) >= "2007-02-01" & as.Date(data$DateTime) < "2007-02-03")

# Start the png device

png(filename="plot2.png", height=480, width=480, bg="transparent")

# Plot the line graph
plot(sub_data$DateTime, sub_data$Global_active_power,
     type = "l",
     xlab="",
     ylab="Global Active Power (kilowatts)")

# Save the plot and turn off device
dev.off()