## Reading full dataset

datafile <- "./data/exdata_data_household_power_consumption/household_power_consumption.txt"
Alldata <- read.table(datafile, header=T, sep=";",na.strings="?",stringsAsFactors=F,check.names=F,comment.char="", dec=".")
subsetData <- Alldata[Alldata$Date %in% c("1/2/2007","2/2/2007"),]

datetime <- paste(subsetData$Date, subsetData$Time, sep =" ")
date_time <- strptime(datetime,  "%d/%m/%Y %H:%M:%S")
##globalActivePower <- as.numeric(subsetData$Global_active_power)
submetering1 <- as.numeric(subsetData$Sub_metering_1)
submetering2 <- as.numeric(subsetData$Sub_metering_2)
submetering3 <- as.numeric(subsetData$Sub_metering_3)

##Creating graph using plot() function and saving to png file
plot(date_time, submetering1, type="l", ylab="Energy Submetering", xlab=" ")
lines(date_time, submetering2, type="l", col= "red")
lines(date_time, submetering3, type="l", col ="blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"), xjust = 1, yjust =1)
dev.copy(png, file="plot3.png",height= 480, width =480)
dev.off()
