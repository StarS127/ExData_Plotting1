# read data file
tbl <- read.table("household_power_consumption.txt", 
           header=TRUE, sep=";", na.strings = "?")
# filter data from Feb. 1, 2007 to Feb. 2, 2007
data <- subset(tbl, Date %in% c("1/2/2007","2/2/2007"))          

# Plot 1: Global active power
png("plot1.png", width=480, height=480)
hist(data$Global_active_power, main = "Global Active Power", 
     col = "red", xlab = "Global Active Power (kilowatts)", 
     breaks=12, ylim = c(0,1200))
dev.off()

