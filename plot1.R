## Set the working directory
setwd("C:/Coursera/R/exdata-data-household_power_consumption")

## Read the full power consumption data set and then subset it
data_full <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?")

# Convert the Date column to Date type
data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y")

## Select the required data only 
sub_data <- subset(data_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Remove/cleanup the original full data set
rm(data_full)

## Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Plot the histogram for Global_active_power
hist(data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving the graph to file plot1.png 
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()