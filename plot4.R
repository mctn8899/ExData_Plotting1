plot4 <- function() {
        # Create custom date class to directly convert date column in data file
        # to date format in R
        setClass("customDate")
        setAs("character","customDate", function(from) as.Date(from, format="%d/%m/%Y"))
        data <- read.table("household_power_consumption.txt", header=TRUE, sep=";",
                           colClasses = c("customDate", "character", rep("numeric",7)), 
                           comment.char="?", fill=TRUE)
        # Only date needed to, don't need to use strptime and POSIXlt
        #data$Date <- as.Date(data$Date, "%d/%m/%Y")
        date_min <- "2007-02-01"
        date_max <- "2007-02-02"
        # Turn off existing graphic device
        #dev.off()
        # Create new graphic device
        #dev.new()
        png(filename="plot4.png", width=480, height=480)
        par(mfcol = c(2, 2), mar=c(2,4,2, 2), oma=c(1,1,1,1))
        with(subset(data, Date >= date_min & Date <= date_max), 
                {date_time <- as.POSIXct(paste(Date,Time))
                 plot(date_time, Global_active_power, type="l", 
                        col = "black",
                        ylab ="Global Active Power",
                        xlab = "")
                 
                 plot(date_time, Sub_metering_1, type="l", 
                        col = "black",
                        ylab ="Energy sub metering",
                        xlab = "")
                 lines(date_time, Sub_metering_2, 
                        col = "red") 
                 lines(date_time, Sub_metering_3, 
                        col = "blue") 
                 legend("topright", lty=1, col=c("black", "red", "blue"), 
                        legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
                 
                 plot(date_time, Voltage, type="l", 
                      col = "black",
                      ylab ="Voltage",
                      xlab = "")
                 
                 plot(date_time, Global_reactive_power, type="l", 
                      col = "black",
                      ylab ="Global reactive power",
                      xlab = "")
        })
        dev.off()
        #ggsave(file="plot4.png", width=480, height
}