## Load and modify the data by converting the date and time
## columns to a posix date
library(sqldf)
data <- read.csv.sql(unzip("exdata-data-household_power_consumption.zip", "household_power_consumption.txt"), sql = "select * from file where Date = '1/2/2007' OR Date = '2/2/2007' ", sep=";", header=TRUE)
data$Date <- as.POSIXct(paste(as.character(data$Date), as.character(data$Time)), format="%d/%m/%Y %H:%M:%S")

## generate the plot
png(filename="./figure/plot1.png", bg = "transparent", width=480, height=480, units="px")
hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
dev.off()

