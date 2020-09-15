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

# Plot 2: Global active power over days
png("plot2.png", width=480, height=480)
plot(x= data$date_time, y = data$Global_active_power,
     xlab = "", ylab = "Global Active Power (kilowatts)",
     type = "l")
dev.off()