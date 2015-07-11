# The read_data script reads the data set and creates a data frame named
# dataOfInterestDF with only the dates of interest.
source("read_data.R")

# Make the plot
png(filename = "plot1.png", bg = "transparent")
hist(dataOfInterestDF$Global_active_power,
     col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")
dev.off()