##########################
# coursera:exdata-015
# plot3.R
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
png(file = "plot3.png")

# make the plot - line graph for Sub_metering_1
plot(x = powerSubset$DateTime,
     y = powerSubset$Sub_metering_1,
     xlab = "",
     ylab = "Energy sub metering",
     type="l",
     col = "black")

# add line graph for Sub_metering_2
lines(x = powerSubset$DateTime,
      y = powerSubset$Sub_metering_2,
      col = "red")

# add line graph for Sub_metering_3
lines(x = powerSubset$DateTime,
      y = powerSubset$Sub_metering_3,
      col = "blue")

# add legend
legend("topright", 
       lty = 1, 
       col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# close plotting device
dev.off()