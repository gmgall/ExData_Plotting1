# The read_data script reads the data set and creates a data frame named
# dataOfInterestDF with only the dates of interest.
source("read_data.R")

# Make the plot
png(filename = "plot3.png", bg = "transparent")

# x axis is added after because its labels will be customized
plot(dataOfInterestDF$Sub_metering_1,
     type = "n",
     xaxt = "n",
     ylab = "Energy sub metering",
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

# Add lines
lines(dataOfInterestDF$Sub_metering_1, col = "black")
lines(dataOfInterestDF$Sub_metering_2, col = "red")
lines(dataOfInterestDF$Sub_metering_3, col = "blue")

# Add legend
legend("topright",
       legend = grep("Sub", names(dataOfInterestDF), value = TRUE),
       lty = c(1,1,1),
       col = c("black", "red", "blue")
       )

dev.off()