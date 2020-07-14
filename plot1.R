
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
Data <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
globalActivePower <- as.numeric(Data$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()