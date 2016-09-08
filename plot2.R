## This Script produces a Plot2.PNG file containing a plot of 
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

### Creating the subset with focus days and prepartion for plotting
subbaseSet <- baseSet[baseSet$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(subbaseSet$Date, subbaseSet$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subbaseSet$Global_active_power)

### Plot
png("./Exploratory/plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
