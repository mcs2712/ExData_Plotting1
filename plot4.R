##########################
# coursera:exdata-015
# plot4.R
##########################

# read complete data from file
power <- read.table("household_power_consumption.txt",
                    header= TRUE,
                    sep=';',
                    na.strings= '?')

# subset to relevant data (2007-02-01 and 2007-02-02)
powerSubset <- subset(power, Date == "1/2/2007" | Date == "2/2/2007")
# remove power from env to free memory
remove(power)

# convert dates
powerSubset$Date <- as.Date(powerSubset$Date , "%d/%m/%Y")

# convert times by concatening Date and Time with given format
powerSubset$DateTime <- strptime(paste(powerSubset$Date, powerSubset$Time), "%Y-%m-%d %H:%M:%S")

# change day labels to English
Sys.setlocale("LC_TIME","en_US.UTF-8")

# open png file
png(file = "plot4.png")

# multiple base plots - 2 X 2 plots
par(mfrow = c(2, 2))

# plot (1,1)
plot(x = powerSubset$DateTime,
     y = powerSubset$Global_active_power,
     xlab = "",
     ylab = "Global Active Power",
     type="l")

# plot (1,2)
plot(x = powerSubset$DateTime,
     y = powerSubset$Voltage,
     xlab = "datetime",
     ylab = "Voltage",
     type="l")

# plot (2,1)
plot(x = powerSubset$DateTime,
     y = powerSubset$Sub_metering_1,
     xlab = "",
     ylab = "Energy sub metering",
     type="l",
     col = "black")
lines(x = powerSubset$DateTime,
      y = powerSubset$Sub_metering_2,
      col = "red")
lines(x = powerSubset$DateTime,
      y = powerSubset$Sub_metering_3,
      col = "blue")
legend("topright", 
       lty = 1, 
       bty = "n",
       col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# plot (2,2)
plot(x = powerSubset$DateTime,
     y = powerSubset$Global_reactive_power,
     xlab = "datetime",
     ylab = "Global_reactive_power",
     type="l")

# close plotting device
dev.off()