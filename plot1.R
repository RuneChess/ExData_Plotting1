data <- read.csv("household_power_consumption.txt", sep=";", na.strings = "?")
data2 <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
png(filename = "plot1.png")
hist(data2$Global_active_power, col = "red", 
     xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()