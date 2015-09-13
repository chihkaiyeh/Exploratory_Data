##Load data set
data <- read.csv("household_power_consumption.txt",
                 sep=";",
                 dec=".", 
                 stringsAsFactors= FALSE,
                 na.strings = "?",
                 colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric",
                              "numeric", "numeric", "numeric"))

##combine the date and time column
data$Timefram <- strptime(paste(data$Date,data$Time),
                          format="%d/%m/%Y %H:%M:%S")

##eliminate the 
data$Date=NULL
data$Time=NULL 

##set the desired data range
datasubset<- subset(data,as.Date(data$Timefram) >= "2007-02-01" 
                    & as.Date(data$Timefram) < "2007-02-03")

##arrange the file name and size
png(filename="plot4.png", height=480, width=480)

##make a 2x2 windows
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

##mini plot 1

plot(datasubset$Timefram,
     datasubset$Global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power")

##mini plot 2

plot(datasubset$Timefram,
     datasubset$Voltage,
     type="l",
     xlab="datetime",
     ylab="Voltage")

##mini plot 3

###sub_meter 1
plot(datasubset$Timefram,
     datasubset$Sub_metering_1,
     type="l",
     xlab="",
     ylab="Energy sub metering")

###sub_meter 2
lines(datasubset$Timefram,
      datasubset$Sub_metering_2,
      type="l",
      col="red")

###sub_meter 3
lines(datasubset$Timefram,
      datasubset$Sub_metering_3,
      type="l",
      col="blue")

###legend
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

##mini plot 4

plot(datasubset$Timefram,
     datasubset$Global_reactive_power,
     type="l",
     xlab="datetime",
     ylab="Global_reactive_power")

dev.off()
