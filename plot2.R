# The read_data script reads the data set and creates a data frame named
# dataOfInterestDF with only the dates of interest.
source("read_data.R")

# Make the plot
png(filename = "plot2.png", bg = "transparent")

# x axis is added after because its labels will be customized
plot(dataOfInterestDF$Global_active_power,
     type = "l",
     xaxt = "n",
     ylab = "Global Active Power (kilowatts)",
     xlab = "")

# The x axis will have the weekdays of the readings.
readings <- nrow(dataOfInterestDF)
axis(1,
     at = c(1, readings/2+1, readings+1),
     labels = c(weekdays(dataOfInterestDF$Date[1], abbreviate = TRUE),
                weekdays(dataOfInterestDF$Date[readings/2+1], abbreviate = TRUE),
                weekdays(dataOfInterestDF$Date[readings]+1, abbreviate = TRUE)
                )
     )

dev.off()