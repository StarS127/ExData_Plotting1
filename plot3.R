library(dplyr)
# read data file
tbl <- read.table("household_power_consumption.txt", 
                  header=TRUE, sep=";", na.strings = "?")
# filter data from Feb. 1, 2007 to Feb. 2, 2007
data <- subset(tbl, Date %in% c("1/2/2007","2/2/2007"))          

# new column date_time for x axis
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data <- mutate(data, date_time = as.POSIXct(paste(data$Date, data$Time, sep=" "), 
                                            template = "%d/%m/%Y %H:%M:%S", tz = Sys.timezone()))

# Plot 3: 
png("plot3.png", width=480, height=480)
with(data,
     {plot(x= date_time, y = Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l", col = "black")
     lines(x= date_time, y = Sub_metering_2, col = "red", type = "l")
     lines(x= date_time, y = Sub_metering_3, col = "blue", type = "l")
     legend(x="topright", lty = "solid", col = c("black","red", "blue"),
            legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
     })
dev.off()