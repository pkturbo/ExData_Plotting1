## Exploratory Data Analysis - Project 1

# read txt file
hpc <- read.csv("household_power_consumption.txt",sep=";",
               na.strings="?")
# subset by date
hpc <- hpc[(hpc$Date=="1/2/2007"|hpc$Date=="2/2/2007"),]
# convert Date and Time to new variable
hpc$DateTime <- strptime(paste(hpc$Date,hpc$Time),"%d/%m/%Y %H:%M:%S")

# make plot3

png(file="plot3.png")
with(hpc,plot(DateTime,Sub_metering_1,
        type="l", lty="solid",
        ylab="Energy sub metering",
        xlab="",main=""))
     with(hpc, lines(DateTime, Sub_metering_2, col="red"))
     with(hpc, lines(DateTime, Sub_metering_3, col="blue"))
     legend("topright",lty="solid",col=c("black","red","blue"),
            legend=c(names(hpc)[7:9]))
dev.off()