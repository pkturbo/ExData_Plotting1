## Exploratory Data Analysis - Project 1

# read txt file
hpc <- read.csv("household_power_consumption.txt",sep=";",
               na.strings="?")
# subset by date
hpc <- hpc[(hpc$Date=="1/2/2007"|hpc$Date=="2/2/2007"),]
# convert Date and Time to new variable
hpc$DateTime <- strptime(paste(hpc$Date,hpc$Time),"%d/%m/%Y %H:%M:%S")

# make plot4

png(file="plot4.png")
par(mfrow=c(2,2))

with(hpc,{

#first plot
plot(DateTime,Global_active_power,
     type="l", lty="solid",
     ylab="Global Active Power (kilowatts)",
     xlab="",main="")

#second plot
plot(DateTime,Voltage,
     type="l", lty="solid",
     ylab="Voltage",
     xlab="datetime",main="")

#third plot
plot(DateTime,Sub_metering_1,
        type="l", lty="solid",
        ylab="Energy sub metering",
        xlab="",main="")
lines(DateTime, Sub_metering_2, col="red")
lines(DateTime, Sub_metering_3, col="blue")
legend("topright",lty="solid",col=c("black","red","blue"),
        legend=c(names(hpc)[7:9]))

#fourth plot
plot(DateTime,Global_reactive_power,
     type="l", lty="solid", lwd=1,
     ylab="Global_reactive_power",
     xlab="datetime",main="")

})

dev.off()