## Exploratory Data Analysis - Project 1

# read txt file
hpc <- read.csv("household_power_consumption.txt",sep=";",
               na.strings="?")
# subset by date
hpc <- hpc[(hpc$Date=="1/2/2007"|hpc$Date=="2/2/2007"),]
# convert Date and Time to new variable
hpc$DateTime <- strptime(paste(hpc$Date,hpc$Time),"%d/%m/%Y %H:%M:%S")

# make plot2

png(file="plot2.png")
plot(hpc$DateTime,hpc$Global_active_power,
        type="l", lty="solid",
        ylab="Global Active Power (kilowatts)",
        xlab="",main="")
dev.off()