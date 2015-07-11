# This script reads the data from the "Individual household electric power
# consumption Data Set" and provides a data frame with the data from the
# dates 2007-02-01 and 2007-02-02. The scripts plot1.R to plot4.R will use
# this script to read the data of interest.

# Is the household_power_consumption.txt file in the working directory?
if(!file.exists("household_power_consumption.txt"))
        stop("Couldn't find household_power_consumption.txt. Is it in the working directory?")

# The first column of the data set is the date in dd/mm/yyyy format.
# If 'Date' is specified in colClasses, read.csv tries to read the date
# in yyyy/mm/dd or yyyy-mm-dd formats.
# Below is defined a new class of date that accepts dates in the right format.
setClass('DMYDate')
setAs("character", "DMYDate", function(from) as.Date(from, format="%d/%m/%Y"))

powerConsumptionDF <- read.csv("household_power_consumption.txt",
              sep = ";",
              colClasses = c("DMYDate",
                             "character",
                             "numeric",
                             "numeric",
                             "numeric",
                             "numeric",
                             "numeric",
                             "numeric",
                             "numeric"),
              na.strings = "?",
              stringsAsFactors = FALSE)

# Only the data from 2007-02-01 and 2007-02-02 are needed.
neededData <- powerConsumptionDF$Date == as.Date("2007-02-01") |  powerConsumptionDF$Date == as.Date("2007-02-02")
dataOfInterestDF <- powerConsumptionDF[neededData,]

# Remove unnecessary variables
rm(neededData, powerConsumptionDF)