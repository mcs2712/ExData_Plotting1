##########################
# coursera:exdata-015
# plot2.R
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
png(file = "plot2.png")

# make the plot
plot(x = powerSubset$DateTime,
     y = powerSubset$Global_active_power,
     xlab = "",
     ylab = "Global Active Power (kilowatts)",
     type="l")

# close plotting device
dev.off()