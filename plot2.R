powerConsumption <- read.table("./data/household_power_consumption.txt", 
                               header=TRUE, stringsAsFactors=FALSE,dec=".",sep=";")
powerConsumptionSubset <- powerConsumption[powerConsumption$Date %in% c("1/2/2007","2/2/2007") ,]
dateTime <- strptime(paste(powerConsumptionSubset$Date, powerConsumptionSubset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(powerConsumptionSubset$Global_active_power)
png("plot2.png", width=480, height=480)
plot(dateTime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()