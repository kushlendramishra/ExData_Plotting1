
#to read text as date
setAs("character", "myDate", function(from) as.Date(from, format="%d/%m/%Y"))

hPowerFilePath <- "household_power_consumption.txt"
hPower  <- read.table(hPowerFilePath, header = TRUE, na.strings = "?", sep = ";", colClasses = c("myDate", "character", rep("numeric", 7)))
# hPower$Date <- as.Date(hPower$Date)

#select all the observations for the two dates
plotData <- hPower[hPower$Date %in% as.Date(c("2007-02-01", "2007-02-02")),]

#Initialize png file
png("plot1.png", width = 480, height = 480)

#draw the histogram
with(plotData, hist(Global_active_power, col = "red", 
                    xlab = "Global Active Power (kilowatts)"))

#close the png file, the plot has been written to it.
dev.off()
