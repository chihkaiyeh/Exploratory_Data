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
png(filename="plot1.png", height=480, width=480)
 
hist(datasubset$Global_active_power,
     col="red",
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     ylab="Frequency")
 
dev.off()
