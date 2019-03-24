plot1 <- function() {
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
        png(filename="plot1.png", width=480, height=480)
        with(subset(data, Date >= date_min & Date <= date_max), 
             hist(Global_active_power, col = "red", 
                  xlab ="Global Active Power (kilowatts)", 
                  main = "Global Active Power"))
        dev.off()
}