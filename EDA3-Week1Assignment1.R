df<-read.csv("household_power_consumption.txt",header=T,sep=";",nrows=2075259,stringsAsFactors = FALSE,quote='\"',na.strings = "?")
View(df)
p3<-subset(df,Date %in%c("1/2/2007","2/2/2007"))
p3$Date <- as.Date(p3$Date, format="%d/%m/%Y")
datetime<-paste(as.Date(p3$Date), p3$Time)
p3$Datetime <- as.POSIXct(datetime)
View(p3)
with(p3, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

png("plot3.png",height=480,width=480)
dev.off()
