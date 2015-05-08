##Script to generate Plot 4


#Below is the code to read in the power consumption data only for the two relevant days, as 
#well as convert date and time columns.

energy <- read.csv("household_power_consumption.txt", sep=";",  stringsAsFactors=FALSE, skip = 66636, nrows = 2880, na.strings = "?")
cols <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
colnames(energy) <- cols
energy$Date <- as.Date(energy$Date, format="%d/%m/%Y")
energy$Time <- paste(energy$Date, energy$Time)
energy$Time <- as.POSIXct(energy$Time)
names(energy)[names(energy) == "Time"] <- "datetime"


#Generates and saves plot 4



png("plot4.png") 
par(mfrow = c(2,2), mar = c(4, 4, 2, 1))

with(energy, {
#topleft plot

     plot(datetime, Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")

#topright plot

     plot(datetime, Voltage, type = "l", ylab = "Voltage", xlab = "datetime")

#bottomleft plot

     plot(datetime, Sub_metering_1, col = "black", type = "l", lwd = 1, ylab = "Energy sub metering", xlab = "")
     legend("topright",lty=1, bty = "n", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
     
     lines(datetime, Sub_metering_2, col = "red")
     lines(datetime, Sub_metering_3, col = "blue")

#bottomright plot

     plot(datetime, Global_reactive_power, col = "black", type = "l", lwd = 1)
})
dev.off()





