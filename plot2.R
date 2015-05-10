library(data.table)
data <- fread("household_power_consumption.txt", colClass="character", sep=";", na.strings = "?")
data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

data <- cbind(data, strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S"))
setnames(data, 10, "DateTime")

png(file="plot2.png")
par(mfrow=c(1,1))
plot(data$DateTime, data2$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()