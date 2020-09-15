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

# Plot 4: 
png("plot4.png", width=480, height=480)
par(mfrow = c(2,2))

# 1. top left
plot(x= data$date_time, y = data$Global_active_power,
     xlab = "", ylab = "Global Active Power",
     type = "l")

# 2. top right
plot(x= data$date_time, y = data$Voltage,
     xlab = "datetime", ylab = "Voltage",
     type = "l")

# 3. bottom left
with(data,
     {plot(x= date_time, y = Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l", col = "black")
             lines(x= date_time, y = Sub_metering_2, col = "red", type = "l")
             lines(x= date_time, y = Sub_metering_3, col = "blue", type = "l")
             legend(x="topright", lty = "solid", col = c("black","red", "blue"), 
                    box.lty = 0, inset = 0.02,
                    legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
     })

# 4. bottom right
plot(x= data$date_time, y = data$Global_reactive_power,
     xlab = "datetime", ylab = "Global_reactive_power",
     type = "l")
dev.off()