#Plot2 Exercise R script by P.Rotzetter

#Need to set the locale as my environment is in French
Sys.setlocale("LC_TIME", "English")
#read the household consumtion text file
consumData<-read.csv("household_power_consumption.txt",sep=";",stringsAsFactors = FALSE)

#convert date strings to date class
consumData$Date<-as.Date(consumDataBack$Date,"%d/%m/%Y")

#select observation dates only
consumData<-subset(consumData, Date==as.Date("2007-02-01") | Date==as.Date("2007-02-02"))

#convert global active power to numeric
consumData$Global_active_power<-as.numeric(consumData$Global_active_power)

# get timestamp column
consumData$TimeStamp<-with(consumData,as.POSIXct(paste(as.character(Date), Time)))

#plot global active power by day and time
with(consumData,plot(TimeStamp,as.numeric(globalActivePower),type="l",main="",xlab="",ylab="Global Active Power (kilowatts)"))

#copy into png file
dev.print(device = png, filename = 'plot2.png', width = 480, height = 480)
