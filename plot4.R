## Load and modify the data by converting the date and time
## columns to a posix date
library(sqldf)
data <- read.csv.sql(unzip("exdata-data-household_power_consumption.zip", "household_power_consumption.txt"), sql = "select * from file where Date = '1/2/2007' OR Date = '2/2/2007' ", sep=";", header=TRUE)
data$Date <- as.POSIXct(paste(as.character(data$Date), as.character(data$Time)), format="%d/%m/%Y %H:%M:%S")

## generate the plot
png(filename="./figure/plot4.png", bg = "transparent", width=480, height=480, units="px")
par(mfrow = c(2,2))

plot(data$Date, data$Global_active_power, main="", xlab="", ylab="Global Active Power (kilowatts)", pch=NA)
lines(data$Date, data$Global_active_power)

plot(data$Date, data$Voltage, main="", xlab="datetime", ylab="Voltage", pch=NA)
lines(data$Date, data$Voltage)

plot(data$Date,data$Sub_metering_1, pch=NA, xlab=NA, ylab="Energy sub metering")
lines(data$Date, data$Sub_metering_1)
lines(data$Date, data$Sub_metering_2, col="red")
lines(data$Date, data$Sub_metering_3, col="blue")

legend("topright", c("Sub Metering 1", "Sub Metering 2", "Sub Metering 3"), col=c("black", "red", "blue"), lty=c(1,1,1), pch=c(NA,NA,NA), bty="n", inset=0.05)

plot(data$Date, data$Global_reactive_power, main="", xlab="datetime", ylab="Global Reactive Power", pch=NA)
lines(data$Date, data$Global_reactive_power)
dev.off()

