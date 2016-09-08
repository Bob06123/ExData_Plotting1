## This Script produces a Plot1.PNG file containing a plot of 
## amount of Kilowatts on the y axis, labelled as "Global Active Power (kilowatts)" that households consume 
## on the dates 2007-02-01 and 2007-02-02 (Thursday and Friday)

### File preparation

## Downloading dataset in a directory called "Exploratory"
if(!file.exists("./Exploratory")){dir.create("./Exploratory")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,destfile="./Exploratory/Dataset.zip")

#Unzip in the /Exploratory directory and put dataset in baseSet
unzip(zipfile="./Exploratory/Dataset.zip",exdir="./Exploratory")
baseSet <- read.table("./Exploratory/household_power_consumption.txt", header = TRUE, sep = ";", na.strings="?", stringsAsFactors=FALSE, dec=".")

### Creating the subset with focus days and preparation for plot
subbaseSet <- baseSet[baseSet$Date %in% c("1/2/2007","2/2/2007") ,]
globalActivePower <- as.numeric(subbaseSet$Global_active_power)
globalReactivePower <- as.numeric(subbaseSet$Global_reactive_power)
voltage <- as.numeric(subbaseSet$Voltage)
subMetering1 <- as.numeric(subbaseSet$Sub_metering_1)
subMetering2 <- as.numeric(subbaseSet$Sub_metering_2)
subMetering3 <- as.numeric(subbaseSet$Sub_metering_3)

## plot
png("./Exploratory/plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
### Plot
subMetering1 <- as.numeric(subbaseSet$Sub_metering_1)
subMetering2 <- as.numeric(subbaseSet$Sub_metering_2)
subMetering3 <- as.numeric(subbaseSet$Sub_metering_3)

png("./Exploratory/plot3.png", width=480, height=480)
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()