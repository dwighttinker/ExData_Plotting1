## Load and modify the data by converting the date and time
## columns to a posix date
library(sqldf)
data <- read.csv.sql(unzip("exdata-data-household_power_consumption.zip", "household_power_consumption.txt"), sql = "select * from file where Date = '1/2/2007' OR Date = '2/2/2007' ", sep=";", header=TRUE)
data$Date <- as.POSIXct(paste(as.character(data$Date), as.character(data$Time)), format="%d/%m/%Y %H:%M:%S")

## generate the plot
png(filename="./figure/plot2.png", bg = "transparent", width=480, height=480, units="px")
plot(data$Date, data$Global_active_power, main="", xlab="", ylab="Global Active Power (kilowatts)", pch=NA)
lines(data$Date, data$Global_active_power)
dev.off()

