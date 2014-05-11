#This file contains the script to create plot3.png

# First, call the common code to load and prepare the data
if(!exists("subsetData")) {
  source("loadData.R")
}

# width and height already default to 480
# but I'll specify it here anyway to show that it is intentional
png(file="plot3.png",width=480,height=480)


drawPlot3 <- function(border="o") {
#Draw the first line in the plot
plot(subsetData$Time,subsetData$Sub_metering_1,type="l",
     ylab="Energy sub metering",xlab="",col="black")

#Draw the second line
lines(subsetData$Time,subsetData$Sub_metering_2,col="red")

#Third line
lines(subsetData$Time,subsetData$Sub_metering_3,col="blue")

#Set up the legend
legendNames <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
legendColors <- c("black","red","blue")

#Draw the legend
legend(x="topright",legend=legendNames,lty=1,col=legendColors, bty=border)
}

drawPlot3()

#Close the file
dev.off()
