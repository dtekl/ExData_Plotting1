##Script to generate Plot 3


#Below is the code to read in the power consumption data only for the two relevant days, as 
#well as convert date and time columns.

energy <- read.csv("household_power_consumption.txt", sep=";",  stringsAsFactors=FALSE, skip = 66636, nrows = 2880, na.strings = "?")
cols <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
colnames(energy) <- cols
energy$Date <- as.Date(energy$Date, format="%d/%m/%Y")
energy$Time <- paste(energy$Date, energy$Time)
energy$Time <- as.POSIXct(energy$Time)
names(energy)[names(energy) == "Time"] <- "datetime"



#Generates and saves plot 3

png("plot3.png")
plot(energy$datetime, energy$Sub_metering_1, col = "black", type = "l", lwd = 1, ylab = "Energy sub metering", xlab = "")
legend("topright",lty=1, col = c("black", "red", "blue")), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

lines(energy$datetime, energy$Sub_metering_2, col = "red")
lines(energy$datetime, energy$Sub_metering_3, col = "blue")
dev.off()