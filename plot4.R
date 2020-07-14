data <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
Data <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
datetime <- strptime(paste(Data$Date,Data$Time),format = "%Y-%m-%d %H:%M:%S")
globalActivePower <- as.numeric(Data$Global_active_power)
par(mfrow=c(2,2))
plot(datetime,globalActivePower,type="l",ylab="global active power")

plot(datetime,Data$Voltage,type = "l",xlab="datetime",ylab="voltage")

plot(datetime, Data$Sub_metering_1, type="l", ylab="energy submetering")
lines(datetime,Data$Sub_metering_2,col="Red")
lines(datetime,Data$Sub_metering_3,col="Blue")
legend("topright", col = c("black", "red", "blue"),legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lwd=1, cex = 0.3, ncol = 1)

plot(datetime,Data$Global_reactive_power,type = "l",xlab = "datetime",ylab="Global_reactive_power")

dev.copy(png,file="plot4.png",height=480,width=480)
dev.off()