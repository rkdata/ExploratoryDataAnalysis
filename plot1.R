## REading full dataset

datafile <- "./data/exdata_data_household_power_consumption/household_power_consumption.txt"
Alldata <- read.table(datafile, header=T, sep=";",na.strings="?",stringsAsFactors=F,check.names=F,comment.char="", dec=".")
subsetData <- Alldata[Alldata$Date %in% c("1/2/2007","2/2/2007"),]

##Creating Histogram using hist(0 function) and saving to png file
png("plot1.png", width =480, height = 480)
par(mar = c(4,4,2,1))
hist(Alldata$Global_active_power, main="Global Active Power", xlab="Global ActivePower(Kilowatts)", ylab="Frequency", col= "Red")
dev.off()