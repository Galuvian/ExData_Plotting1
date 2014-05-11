#This file contains the script to create plot1.png

# First, call the common code to load and prepare the data
if(!exists("subsetData")) {
  source("loadData.R")
}

# width and height already default to 480
# but I'll specify it here anyway to show that it is intentional
png(file="plot1.png",width=480,height=480)

#Draw the graph
hist(subsetData$Global_active_power,ylim=c(0,1200),col="red",xlab="Global Active Power (kilowats)",main="Global Active Power")

#Close the file
dev.off()

