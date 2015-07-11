# The read_data script reads the data set and creates a data frame named
# dataOfInterestDF with only the dates of interest.
source("read_data.R")

png(filename = "plot4.png", bg = "transparent")

# 4 plots in the following disposition:
# +---+
# |1|3|
# +---+
# |2|4|
# +---+
par(mfcol = c(2,2))

# The number of readings will be used to plot the weekdays in the plots bellow.
readings <- nrow(dataOfInterestDF)

### Plot 1
plot(dataOfInterestDF$Global_active_power,
     type = "l",
     xaxt = "n",
     ylab = "Global Active Power",
     xlab = "")

# The x axis will have the weekdays of the readings.
axis(1,
     at = c(1, readings/2+1, readings+1),
     labels = c(weekdays(dataOfInterestDF$Date[1], abbreviate = TRUE),
                weekdays(dataOfInterestDF$Date[readings/2+1], abbreviate = TRUE),
                weekdays(dataOfInterestDF$Date[readings]+1, abbreviate = TRUE)
     )
)

### Plot 2
plot(dataOfInterestDF$Sub_metering_1,
     type = "n",
     xaxt = "n",
     ylab = "Energy sub metering",
     xlab = "")

# The x axis will have the weekdays of the readings.
axis(1,
     at = c(1, readings/2+1, readings+1),
     labels = c(weekdays(dataOfInterestDF$Date[1], abbreviate = TRUE),
                weekdays(dataOfInterestDF$Date[readings/2+1], abbreviate = TRUE),
                weekdays(dataOfInterestDF$Date[readings]+1, abbreviate = TRUE)
     )
)

# Add lines.
lines(dataOfInterestDF$Sub_metering_1, col = "black")
lines(dataOfInterestDF$Sub_metering_2, col = "red")
lines(dataOfInterestDF$Sub_metering_3, col = "blue")

# Add legend.
legend("topright",
       legend = grep("Sub", names(dataOfInterestDF), value = TRUE),
       lty = c(1,1,1),
       col = c("black", "red", "blue"),
       bty = "n"
)

### Plot 3
plot(dataOfInterestDF$Voltage,
     type='l',
     xaxt = "n",
     ylab = "Voltage",
     xlab = "datetime")

# The x axis will have the weekdays of the readings.
axis(1,
     at = c(1, readings/2+1, readings+1),
     labels = c(weekdays(dataOfInterestDF$Date[1], abbreviate = TRUE),
                weekdays(dataOfInterestDF$Date[readings/2+1], abbreviate = TRUE),
                weekdays(dataOfInterestDF$Date[readings]+1, abbreviate = TRUE)
     )
)

## Plot 4
plot(dataOfInterestDF$Global_reactive_power,
     type = 'l',
     xaxt = "n",
     ylab = "Global_reactive_power",
     xlab = "datetime")

# The x axis will have the weekdays of the readings.
axis(1,
     at = c(1, readings/2+1, readings+1),
     labels = c(weekdays(dataOfInterestDF$Date[1], abbreviate = TRUE),
                weekdays(dataOfInterestDF$Date[readings/2+1], abbreviate = TRUE),
                weekdays(dataOfInterestDF$Date[readings]+1, abbreviate = TRUE)
     )
)

dev.off()