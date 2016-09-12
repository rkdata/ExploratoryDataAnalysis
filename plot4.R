## REading full dataset

datafile <- "./data/exdata_data_household_power_consumption/household_power_consumption.txt"
Alldata <- read.table(datafile, header=T, sep=";",na.strings="?",stringsAsFactors=F,check.names=F,comment.char="", dec=".")
subsetData <- Alldata[Alldata$Date %in% c("1/2/2007","2/2/2007"),]

datetime <- paste(subsetData$Date, subsetData$Time, sep =" ")
date_time <- strptime(datetime,  "%d/%m/%Y %H:%M:%S")
globalActivePower <- as.numeric(subsetData$Global_active_power)
voltage <- as.numeric(subsetData$Voltage)
submetering1 <- as.numeric(subsetData$Sub_metering_1)
submetering2 <- as.numeric(subsetData$Sub_metering_2)
submetering3 <- as.numeric(subsetData$Sub_metering_3)
globalReactivePower <- as.numeric(subsetData$Global_reactive_power)

##Creating graph using plot() function and saving to png file
##png("plot4.png", width=480, height=480)
par(mfrow = c(2,2))
plot(date_time, globalActivePower, type="l",xlab= "", ylab="Global ACtive Power")
plot(date_time, voltage, type="l", xlab="datetime", ylab="Voltage")
plot(date_time, submetering1, type="l", ylab="Energy Submetering", xlab=" ")
lines(date_time, submetering2, type="l", col= "red")
lines(date_time, submetering3, type="l", col ="blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black", "red", "blue"))
plot(date_time, globalReactivePower, type="l",xlab="datetime", ylab="Global_Reactive_Power")
dev.copy(png,file="plot4.png", height=480, width =480)
dev.off()