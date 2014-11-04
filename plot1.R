
setwd("~/coursera/exdata/ExData_Plotting1")
if(!file.exists("household_power_consumption.txt")){
 download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
         destfile="power_consumption.zip")       
 unzip("power_consumption.zip" )
}
raw_data <-subset(read.csv("household_power_consumption.txt",
        sep = ";",na.strings="?"), 
        Date == "1/2/2007" | Date == "2/2/2007")

# The following is not needed for all plots but is included in each to ease
# dealing with the submission requirements of the project.

dates <- as.Date(
        strptime(paste(raw_data$Date, raw_data$Time), format= "%d/%m/%Y %H:%M:%S")
)
data <- cbind(raw_data,data.frame(FullDate = dates))
png(filename="plot1.png")

hist(raw_data$Global_active_power, main = "Global Active Power",
        xlab="Global Active Power (kilowatts)", ylab="Frequency",col="red")
dev.off()