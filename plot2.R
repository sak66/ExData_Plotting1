#
# Name: plot2.R
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
# Note: Global_active_power: household global minute-averaged active power (in kilowatt)
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
png(filename = "plot2.png",
    width = 480, height = 480, units = "px", pointsize = 12, bg = "white", type = "quartz")

# Prepare Plot2  
plot(hpc$Timestamp,hpc$Global_active_power,ylab="Global Active Power (kilowatts)", xlab="",  type="l")

# shut down decice (close png file)
dev.off()

