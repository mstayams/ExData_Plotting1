## Set the working directory
setwd("C:/Coursera/R/exdata-data-household_power_consumption")

## Read the full power consumption data set
data_full <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?")

## format the Date column to Date type
data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y")

## Select required data only
sub_data <- subset(data_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

##remove/clear (from memory) the original full data set
rm(data_full)

## Combine the Date and Time column into Datetime Column
datetime <- paste(as.Date(sub_data$Date), sub_data$Time)

## add the new Datetime column the data set
sub_data$Datetime <- as.POSIXct(datetime)

## Plot the graph for Datetime vs Sub_metering_1
with(sub_data, {
        plot(Sub_metering_1~Datetime, type="l",
             ylab="Global Active Power (kilowatts)", xlab="")
        lines(Sub_metering_2~Datetime,col='Red')
        lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Save the graph into file plot3.png
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()