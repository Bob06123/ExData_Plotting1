## This Script produces a Plot1.PNG file containing a plot of 
## how many Households have used a certain amount of Kilowatts, labelled as "Global Active Power (kilowatts)
## on the dates 2007-02-01 and 2007-02-02 (Thursday and Friday)

### File preparation

## Downloading dataset in a directory called "Exploratory"
if(!file.exists("./Exploratory")){dir.create("./Exploratory")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,destfile="./Exploratory/Dataset.zip")

#XUnzip in the /Exploratory directory and put dataset in baseSet
unzip(zipfile="./Exploratory/Dataset.zip",exdir="./Exploratory")
baseSet <- read.table("./Exploratory/household_power_consumption.txt", header = TRUE, sep = ";", na.strings="?", stringsAsFactors=FALSE, dec=".")

### Creating the subset with focus days
subbaseSet <- baseSet[baseSet$Date %in% c("1/2/2007","2/2/2007") ,]

### Plot
base_globalActivePower <- as.numeric(subbaseSet$Global_active_power)
png("./Exploratory/plot1.png", width=480, height=480)
hist(base_globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()