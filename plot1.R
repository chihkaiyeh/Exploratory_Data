data <- read.csv("household_power_consumption.txt",
sep=";",
dec=".", 
stringsAsFactors= FALSE,
na.strings = "?",
colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric",
"numeric", "numeric", "numeric"))

dataset<- data[data$Date %in% c("1/2/2007", "2/2/2007"),] 
str(dataset)

png("plot1.png", width=480, height=480)
plot <- as.numeric(dataset$Global_active_power)
hist(plot, main="Global Active Power",xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.off()
