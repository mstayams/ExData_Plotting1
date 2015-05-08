
## Set the working directory
setwd("C:/Coursera/R/exdata-data-household_power_consumption")

## Read the full power consumption data set and then subset it
data_full <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

## format the Date column to Date type
data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y")

## Select the required data only filtering by Date column
sub_data <- subset(data_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

##remove/clear (from memory) the original full data set
rm(data_full)

## Combine the Date and Time columns into datetime
datetime <- paste(as.Date(sub_data$Date), sub_data$Time)

## Add the datetime column to the data set 
sub_data$Datetime <- as.POSIXct(datetime)

## Plot the data - Datetime vs Global_active_power
plot(sub_data$Global_active_power~data$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

## save the graph into file plot2.png 
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()