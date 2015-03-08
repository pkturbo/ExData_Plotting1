## Exploratory Data Analysis - Project 1

# read txt file
hpc <- read.csv("household_power_consumption.txt",sep=";",
               na.strings="?")
# subset by date
hpc <- hpc[(hpc$Date=="1/2/2007"|hpc$Date=="2/2/2007"),]
# convert Date and Time to new variable
hpc$DateTime <- strptime(paste(hpc$Date,hpc$Time),
                         "%d/%m/%Y %H:%M:%S")

# make plot1

png(file="plot1.png")
hist(hpc$Global_active_power,col="red",
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)")
dev.off()