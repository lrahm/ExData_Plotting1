# plot3.R
# Exploring Data Analysis
# Project 1 part 3
# Lars Rahm
# August 2014

# Grab just the rows we need instead of reading the whole dataset.
# See the link for an explanation
# Wei Zhang   -  https://class.coursera.org/exdata-005/forum/thread?thread_id=56

startrow = 47 * 60 * 24 -17 * 60 - 24
endrow = 2 * 24 * 60 

energy <- read.table("data/household_power_consumption.txt", sep = ";", 
                     header = TRUE,
                     na.strings = "?",
                     skip = startrow,
                     nrows = endrow,
                     colClasses = c("character", "character", "numeric", 
                                    "numeric", "numeric", "numeric", 
                                    "numeric", "numeric", "numeric"))

colnames(energy) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", 
                      "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2",
                      "Sub_metering_3")

energy$Date <- strptime(paste(energy$Date,energy$Time), "%d/%m/%Y %H:%M:%S")

with(energy, plot(Date, Sub_metering_1, type = "l", ylab="Energy sub metering"))
with(energy, lines(Date, Sub_metering_2, col = "red"))
with(energy, lines(Date, Sub_metering_3, col = "blue"))

legend("topright",  lty = "solid", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file = "plot3.png", height=480, width=480) ## Copy my plot to a PNG file
dev.off() ## Don't forget to close the PNG device!