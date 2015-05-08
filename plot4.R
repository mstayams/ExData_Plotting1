## Set the working directory
setwd("C:/Coursera/R/exdata-data-household_power_consumption")

## Read the full power consumption data set and then subset it
data_full <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?")

## format the Date column to Date type
data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y")

## Select only the needed data
sub_data <- subset(data_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

##remove/clear (from memory) the original full data set
rm(data_full)

## Combine the Date and Time column into Datetime Column
datetime <- paste(as.Date(sub_data$Date), sub_data$Time)

## add the new Datetime column the data set
sub_data$Datetime <- as.POSIXct(datetime)

## Arrange 4 figures as 2 rows and 2 columns using par command
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

##  plot the graph between Datetime vs (Global_active_power,Voltage,Sub_metering_1,Global_reactive_power)
##  separately in 4 different plot

with(sub_data, {
        plot(Global_active_power~Datetime, type="l", 
             ylab="Global Active Power (kilowatts)", xlab="datetime")
        plot(Voltage~Datetime, type="l", 
             ylab="Voltage (volt)", xlab="datetime")
        plot(Sub_metering_1~Datetime, type="l", 
             ylab="Global Active Power (kilowatts)", xlab="datetime")
        lines(Sub_metering_2~Datetime,col='Red')
        lines(Sub_metering_3~Datetime,col='Blue')
        legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
               legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        plot(Global_reactive_power~Datetime, type="l", 
             ylab="Global Reactive Power (kilowatts)",xlab="datetime")
})

## Saving to file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()