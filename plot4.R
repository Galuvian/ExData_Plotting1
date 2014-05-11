#This file contains the script to create plot4.png

# First, call the common code to load and prepare the data
if(!exists("subsetData")) {
  source("loadData.R")
}

#Source the code for the other plots so that we can reuse them
#Note, this may cause them to re-create their respective png files
#But that runs fast enough that it shouldn't be a concern
if(!exists("drawPlot2")){
  source("plot2.R")
}

if(!exists("drawPlot3")){
  source("plot3.R")
}



# width and height already default to 480
# but I'll specify it here anyway to show that it is intentional
png(file="plot4.png",width=480,height=480)

#Set up the plot to make 4 sub-plots
par(mfrow=c(2,2))



#Call the function to re-draw the plot from part 2, but give it a different x label
drawPlot2(xlabel="Global Active Power",ylabel="")

#Plot the voltage
plot(subsetData$Time,subsetData$Voltage,type="l",
     ylab="Voltage", xlab="datetime")

#Call the function to re-draw the plot from part 3, but turn off the border
drawPlot3(border="n")

#Plot the global reactive power
plot(subsetData$Time,subsetData$Global_reactive_power,type="l",
     ylab="Global_reactive_power", xlab="datetime")

#Close the file
dev.off()
