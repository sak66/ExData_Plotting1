#
# Name: plot1.R
# Date: 12/04/15
# 
# Purpose:  This was written for the Coursera - Exploratory Data Analysis
#
# Function: This script does the following:
#
#           Using the data set obtained from: https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip 
#           
#           1. Read in the data set.
#           2. Produce plot a frequency histogram for of Global Active Power between the dates 2007-02-01 and 2007-02-02.
#
# Note: Global_active_power: household global minute-averaged active power (in kilowatt)
#
# Set working directory
setwd("/Users/stan/Development/EDA/ExData_Plotting1")

# Read the data set
hpc <- read.table("~/Desktop/EDAA1/household_power_consumption.txt", sep=";", quote="\"", na.strings="?",header=T)

# Prepare the PNG device
png(filename = "plot1.png",
    width = 480, height = 480, units = "px", pointsize = 12, bg = "white", type = "quartz")

# Prepare Plot1  (for the rows on the dates of interest)
hist(hpc[hpc$Date %in% c('1/2/2007', '2/2/2007'),]$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")

# shut down decice (close png file)
dev.off()

