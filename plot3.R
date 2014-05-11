mydata <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE)
mydata2<-mydata
mydata2$Date2<- as.Date(as.character(mydata2$Date), "%d/%m/%Y")
data2 <- subset(mydata2, Date2>=("2007/02/01") & Date2 <=("2007/02/02"))
data2$WD <- strptime(paste(data2$Date, data2$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")
data2$WD <- as.POSIXct(data2$WD)

#plot3
par(mfrow=c(1,1))
plot(data2$Sub_metering_1 ~ data2$WD, type='l', ylab="Energy sub metering", xlab="", col="black")
lines(data2$Sub_metering_2 ~ data2$WD, col="red")
lines(data2$Sub_metering_3 ~ data2$WD, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col=c("black", "red", "blue"))

png(filename="plot3.png", width=480, height=480)
plot(data2$Sub_metering_1 ~ data2$WD, type='l', ylab="Energy sub metering", xlab="", col="black")
lines(data2$Sub_metering_2 ~ data2$WD, col="red")
lines(data2$Sub_metering_3 ~ data2$WD, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col=c("black", "red", "blue"))
dev.off()