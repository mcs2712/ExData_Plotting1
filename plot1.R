##########################
# coursera:exdata-015
# plot1.R
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

# open png file
png(file = "plot1.png")

# make the plot
hist(powerSubset$Global_active_power, 
     col = "red", 
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")

# close plotting device
dev.off()