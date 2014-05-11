#This file contains the script to create plot2.png

# First, call the common code to load and prepare the data
if(!exists("subsetData")) {
  source("loadData.R")
}

png(file="plot2.png",width=480,height=480)


drawPlot2 <- function(xlabel, ylabel) {
# width and height already default to 480
# but I'll specify it here anyway to show that it is intentional


#Draw the graph
plot(subsetData$Time,subsetData$Global_active_power,type="l",
     ylab=xlabel,xlab=ylabel)

}

drawPlot2(xlabel="Global Active Power (kilowats)", ylabel="")

#Close the file
dev.off()
