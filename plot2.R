library(lubridate)

setAs("character", "myDate", function(from) as.Date(from, format="%d/%m/%Y"))

hPowerFilePath <- "household_power_consumption.txt"
hPower  <- read.table(hPowerFilePath, header = TRUE, na.strings = "?", sep = ";", colClasses = c("myDate", "character", rep("numeric", 7)))

#Combine the date and time variable into a single DateTime variable
hPower$DateTime <- ymd_hms(paste(as.character(hPower$Date), hPower$Time, sep = " "))

#Select observations for the two dates
plotData <- hPower[hPower$Date %in% as.Date(c("2007-02-01", "2007-02-02")),]

#Open the png file
png("plot2.png", width = 480, height = 480)

#Line plot
with(plotData, plot(DateTime, Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)"))

#the plot has been written to the png file, close it.
dev.off()