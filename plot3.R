powerConsumption <- read.table("./data/household_power_consumption.txt", 
                               header=TRUE, stringsAsFactors=FALSE,dec=".",sep=";")
powerConsumptionSubset <- powerConsumption[powerConsumption$Date %in% c("1/2/2007","2/2/2007") ,]
subMeter1 <- as.numeric(powerConsumptionSubset$Sub_metering_1)
subMeter2 <- as.numeric(powerConsumptionSubset$Sub_metering_2)
subMeter3 <- as.numeric(powerConsumptionSubset$Sub_metering_3)
dateTime <- strptime(paste(powerConsumptionSubset$Date, powerConsumptionSubset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(powerConsumptionSubset$Global_active_power)
png("plot3.png", width=480, height=480)
plot(dateTime, subMeter1, type="l", ylab="Energy sub metering", xlab="")
lines(dateTime, subMeter2, type="l", col="red")
lines(dateTime, subMeter3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))
dev.off()
