library(data.table)
data <- fread("household_power_consumption.txt", colClass="character", sep=";", na.strings = "?")
data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

data <- cbind(data, strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S"))
setnames(data, 10, "DateTime")

png(file="plot3.png")
par(mfrow=c(1,1))
plot(data$DateTime, data$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
lines(data$DateTime, data$Sub_metering_2, type="l", col="red")
lines(data$DateTime, data$Sub_metering_3, type="l", col="blue")
legend("topright", lty=c(1,1), col=c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
