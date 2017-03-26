#Plot4 Exercise R script by P.Rotzetter

#Need to set the locale as my environment is in French
Sys.setlocale("LC_TIME", "English")
#read the household consumtion text file
consumData<-read.csv("household_power_consumption.txt",sep=";",stringsAsFactors = FALSE)

#convert date strings to date class
consumData$Date<-as.Date(consumDataBack$Date,"%d/%m/%Y")

#select observation dates only
consumData<-subset(consumData, Date==as.Date("2007-02-01") | Date==as.Date("2007-02-02"))

#convert columns to numeric
consumData$Sub_metering_1<-as.numeric(consumData$Sub_metering_1)
consumData$Sub_metering_2<-as.numeric(consumData$Sub_metering_2)
consumData$Sub_metering_3<-as.numeric(consumData$Sub_metering_3)
consumData$Global_active_power<-as.numeric(consumData$Global_active_power)
consumData$Global_reactive_power<-as.numeric(consumData$Global_reactive_power)
consumData$Voltage<-as.numeric(consumData$Voltage)
# get timestamp column
consumData$TimeStamp<-with(consumData,as.POSIXct(paste(as.character(Date), Time)))

# set 2 cols and 2 rows for 4 graphs
par(mfrow=c(2, 2))

#plot global active power by day
with(consumData,plot(TimeStamp,Global_active_power,type="l",main="",xlab="",ylab="Global Active Power (kilowatts)"))
#plot voltage by day
with(consumData,plot(TimeStamp,Voltage,type="l",main="",xlab="datetime",ylab="Voltage"))

#plot global active power by day and time
with(consumData,plot(TimeStamp,Sub_metering_1,type="s",main="",xlab="",ylab="Energy sub metering"))
with(consumData,points(TimeStamp,Sub_metering_2,type="s",col="red"))
with(consumData,points(TimeStamp,Sub_metering_3,type="s",col="blue"))
legend("topright",legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),col=c("black","red", "blue"),lty=1,cex=0.8)

#plot global active power by day
with(consumData,plot(TimeStamp,Global_reactive_power,type="s",main="",xlab="datetime"))

#copy into png file
dev.print(device = png, filename = 'plot4.png', width = 480, height = 480)
