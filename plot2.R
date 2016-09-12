## Reading full dataset

datafile <- "./data/exdata_data_household_power_consumption/household_power_consumption.txt"
Alldata <- read.table(datafile, header=T, sep=";",na.strings="?",stringsAsFactors=F,check.names=F,comment.char="", dec=".")
subsetData <- Alldata[Alldata$Date %in% c("1/2/2007","2/2/2007"),]

datetime <- paste(subsetData$Date, subsetData$Time, sep =" ")
date_time <- strptime(datetime,  "%d/%m/%Y %H:%M:%S")
globalActivePower <- as.numeric(subsetData$Global_active_power)
##Creating graph using plot() function and saving to png file
plot(date_time, globalActivePower, type="l", ylab="Global ActivePower(Kilowatts)", xlab=" ")
dev.copy(png, file="plot2.png", height=480, width= 480)
dev.off()
