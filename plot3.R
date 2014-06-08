## Load and modify the data by converting the date and time
## columns to a posix date
library(sqldf)
data <- read.csv.sql(unzip("exdata-data-household_power_consumption.zip", "household_power_consumption.txt"), sql = "select * from file where Date = '1/2/2007' OR Date = '2/2/2007' ", sep=";", header=TRUE)
data$Date <- as.POSIXct(paste(as.character(data$Date), as.character(data$Time)), format="%d/%m/%Y %H:%M:%S")

## generate the plot
png(filename="./figure/plot3.png", bg = "transparent", width=480, height=480, units="px")
plot(data$Date,data$Sub_metering_1, pch=NA, xlab=NA, ylab="Energy sub metering")
lines(data$Date, data$Sub_metering_1)
lines(data$Date, data$Sub_metering_2, col="red")
lines(data$Date, data$Sub_metering_3, col="blue")
legend("topright", c("Sub Metering 1", "Sub Metering 2", "Sub Metering 3"), col=c("black", "red", "blue"), lty=c(1,1,1), pch=c(NA,NA,NA))
dev.off()

