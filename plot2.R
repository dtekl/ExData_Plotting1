##Script to generate Plot 2


#Below is the code to read in the power consumption data only for the two relevant days, as 
#well as convert date and time columns.

energy <- read.csv("household_power_consumption.txt", sep=";",  stringsAsFactors=FALSE, skip = 66636, nrows = 2880, na.strings = "?")
cols <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
colnames(energy) <- cols
energy$Date <- as.Date(energy$Date, format="%d/%m/%Y")
energy$Time <- paste(energy$Date, energy$Time)
energy$Time <- as.POSIXct(energy$Time)
names(energy)[names(energy) == "Time"] <- "datetime"



#Generates and saves plot 2.

png("plot2.png")
plot(energy$datetime, energy$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

dev.off()