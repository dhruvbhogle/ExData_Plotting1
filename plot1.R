mydata <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE)
mydata2<-mydata
mydata2$Date2<- as.Date(as.character(mydata2$Date), "%d/%m/%Y")
data2 <- subset(mydata2, Date2>=("2007/02/01") & Date2 <=("2007/02/02"))
data2$WD <- strptime(paste(data2$Date, data2$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")

#Plot1
par(mfrow=c(1,1))
hist(as.numeric(as.character(data2$Global_active_power)), xlab="Global Active Power (kilowatts)", col="red", main="Global Active Power")
png(filename="plot1.png", width=480, height=480)
hist(as.numeric(as.character(data2$Global_active_power)), xlab="Global Active Power (kilowatts)", col="red", main="Global Active Power")
dev.off()