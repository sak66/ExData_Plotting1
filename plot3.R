#
# Name: plot3.R
# Date: 12/04/15 
# 
# Purpose:  This was written for the Coursera - Exploratory Data Analysis
#
# Function: This script does the following:
#
#           Using the data set obtained from: https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip 
#           
#           1. Read in the data set.
#           2. Produce plot energy sub metering from thursday to Saturday between the dates 2007-02-01 and 2007-02-02.
#
# 
#
# Set working directory
setwd("/Users/stan/Development/EDA/ExData_Plotting1")

# Read the data set
hpc <- read.table("~/Desktop/EDAA1/household_power_consumption.txt", sep=";", quote="\"", na.strings="?",header=T)

# take the date subset of interest  - simple string based subset before conversion. Obviouslu could be done after
# timestamp conversion.
hpc <- hpc[hpc$Date %in% c('1/2/2007', '2/2/2007'),]

# Create a new Timestamp column by merging Date and Time and Date-time object convert
hpc <- within(hpc, { Timestamp=as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S") })

# Prepare the PNG device
png(filename = "plot3.png",
    width = 480, height = 480, units = "px", pointsize = 12, bg = "white", type = "quartz")

# Prepare Plot3  
plot(hpc$Timestamp,hpc$Sub_metering_1,ylab="Energy sub metering", xlab="",  type="l")
lines(hpc$Timestamp,hpc$Sub_metering_2, type="l",col="red")
lines(hpc$Timestamp,hpc$Sub_metering_3, type="l",col="blue")
legend(x = "topright",inset = 0, c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),lwd=c(2.5,2.5,2.5),col=c("black","red","blue"))

# shut down decice (close png file)
dev.off()
