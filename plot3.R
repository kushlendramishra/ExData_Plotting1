library(lubridate)

setAs("character", "myDate", function(from) as.Date(from, format="%d/%m/%Y"))

hPowerFilePath <- "household_power_consumption.txt"
hPower  <- read.table(hPowerFilePath, header = TRUE, na.strings = "?", sep = ";", colClasses = c("myDate", "character", rep("numeric", 7)))
# hPower$Date <- as.Date(hPower$Date)

#combine the Date and Time variable into a single DateTime variable
hPower$DateTime <- ymd_hms(paste(as.character(hPower$Date), hPower$Time, sep = " "))

#Select the observations for the two dates
plotData <- hPower[hPower$Date %in% as.Date(c("2007-02-01", "2007-02-02")),]

#Open the png file
png("plot3.png", width = 480, height = 480)

#Draw the plots
with(plotData, plot(DateTime, Sub_metering_1, type = "n", ylab = "Energy sub metering", col = "black", xlab = ""))
with(plotData, points(DateTime, Sub_metering_1, type = "s", ylab = "Energy sub metering", col = "black"))
with(plotData, points(DateTime, Sub_metering_2, type = "s", ylab = "Energy sub metering", col = "red"))
with(plotData, points(DateTime, Sub_metering_3, type = "s", ylab = "Energy sub metering", col = "blue"))
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#The plot have been written, close the file
dev.off()