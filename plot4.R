
# Begin of common code.  I'd like to place these in a separate R file and source
# it, but it isn't clear from the project rubric that this is allowed, so I am
# manually duplicating it across all files.  Normally this is not something I
# would encourage.

setwd("~/coursera/exdata/ExData_Plotting1")
if(!file.exists("household_power_consumption.txt")){
   download.file(
         "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
         destfile="power_consumption.zip")       
   unzip("power_consumption.zip" )
}

data <-subset(read.csv("household_power_consumption.txt",
        sep = ";",na.strings="?"), 
        Date == "1/2/2007" | Date == "2/2/2007")

# End of common code

png(filename="plot4.png")

par(mfrow = c(2,2))

# Two of these graphs are exactly from plot2.R and plot3.R. Again, I'd like to
# keep them in one common place, but it wasn't clear from the project if this
# was allowed so I am duplicating them here.

# Graph 1

plot(data$Global_active_power,  main = "",
        ylab="Global Active Power (kilowatts)",xlab="",type="l",xaxt="n")
axis(1, at=c(1,length(data$Global_active_power)/2,length(data$Global_active_power)),
        labels=c("Thu","Fri","Sat"))

# Graph 2
plot(data$Voltage,xaxt="n",type="l",xlab="datetime",ylab="Voltage")
axis(1, at=c(1,length(data$Voltage)/2,length(data$Voltage)),
        labels=c("Thu","Fri","Sat"))

# Graph 3
plot(data$Sub_metering_1,  main = "",
        ylab="Energy sub metering",xlab="",type="S",xaxt="n")
lines(data$Sub_metering_2, col="red",type="S")
lines(data$Sub_metering_3, col="blue",type="S")

legend(x="topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
        col=c("black","red","blue"),lty=c(1,1,1))
axis(1, at=c(1,length(data$Global_active_power)/2,length(data$Global_active_power)),
        labels=c("Thu","Fri","Sat"))

# Graph 4

plot(data$Global_reactive_power,xaxt="n",type="l",xlab="datetime",
        ylab="Global_reactive_power")
axis(1, at=c(1,length(data$Global_reactive_power)/2,length(data$Global_reactive_power)),
        labels=c("Thu","Fri","Sat"))

dev.off()