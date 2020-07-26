df<-read.csv("household_power_consumption.txt",header=T,sep=";",nrows=2075259,stringsAsFactors = FALSE,quote='\"',na.strings = "?")
View(df)
p2<-subset(df,Date %in%c("1/2/2007","2/2/2007"))
p2$Date <- as.Date(p2$Date, format="%d/%m/%Y")
datetime<-paste(as.Date(p2$Date), p2$Time)
p2$Datetime <- as.POSIXct(datetime)
View(p2)
with(p2, {
  plot(Global_active_power~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
})

png("plot2.png",height=480,width=480)
dev.off()
