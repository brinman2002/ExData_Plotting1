
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

png(filename="plot1.png")

hist(data$Global_active_power, main = "Global Active Power",
        xlab="Global Active Power (kilowatts)", ylab="Frequency",col="red")
dev.off()