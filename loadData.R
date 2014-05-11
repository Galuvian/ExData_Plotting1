library(data.table)


dataFileName <- "household_power_consumption.txt"

# To read quickly with fread, we need to read all rows as character
# Because the ? values will force coercion to string. 
# We'll have to convert the datatypes after loading
fullData <- fread(dataFileName, sep=";",colClasses=c(rep("character",9)),
                  header=TRUE,na.strings="?")

#This assignment only uses data for 2 days, subset it now
# Note the date format of d/m/y
subsetData <- subset(fullData, Date %in% c("1/2/2007","2/2/2007"))


#Convert the Time first because the Date string is needed
# Time objects still have a date component, so just converting the Time field
# directly to a time object would give it today's date, which would be weird
tmp <- paste(subsetData$Date,subsetData$Time)
subsetData$Time <- data.frame(strptime(tmp,format="%d/%m/%Y %H:%M:%S"))
subsetData$Date <- data.frame(as.Date(subsetData$Date,format="%d/%m/%Y"))

subsetData$Global_active_power <- as.numeric(subsetData$Global_active_power)
subsetData$Global_reactive_power <- as.numeric(subsetData$Global_reactive_power)
subsetData$Voltage <- as.numeric(subsetData$Voltage)
subsetData$Global_intensity <- as.numeric(subsetData$Global_intensity)
subsetData$Sub_metering_1 <- as.numeric(subsetData$Sub_metering_1)
subsetData$Sub_metering_2 <- as.numeric(subsetData$Sub_metering_2)
subsetData$Sub_metering_3 <- as.numeric(subsetData$Sub_metering_3)