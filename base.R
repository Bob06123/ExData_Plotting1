## This Script produces a Plotn.PNG file containing a plot of 
## ........................................................................................
## on the dates 2007-02-01 and 2007-02-02 (Thursday and Friday)


### File preparation

## Downloading dataset in a directory called "Exploratory"
if(!file.exists("./Exploratory")){dir.create("./Exploratory")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,destfile="./Exploratory/Dataset.zip")

#XUnzip in the /Exploratory directory and put dataset in baseSet
unzip(zipfile="./Exploratory/Dataset.zip",exdir="./Exploratory")
baseSet <- read.table("./Exploratory/household_power_consumption.txt", header = TRUE, sep = ";")

### Creating the subset with focus days


### Plot
