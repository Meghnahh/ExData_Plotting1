df<-read.csv("household_power_consumption.txt",header=T,sep=";",nrows=2075259,stringsAsFactors = FALSE,quote='\"',na.strings = "?")
View(df)
p1<-subset(df,Date %in%c("1/2/2007","2/2/2007"))
p1$Date <- as.Date(p1$Date, format="%d/%m/%Y")
hist(p1$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

png("plot1.png", width=480, height=480)
dev.off()
