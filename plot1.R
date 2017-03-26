#Plot1 Exercise R script by P.Rotzetter


#read the household consumtion text file
consumData<-read.csv("household_power_consumption.txt",sep=";",stringsAsFactors = FALSE)
#covert date strings to date class
consumData$Date<-as.Date(consumDataBack$Date,"%d/%m/%Y")
#select observation dates only
consumData<-subset(consumData, Date==as.Date("2007-02-01") | Date==as.Date("2007-02-02"))
#convert global active power to numeric and store in single variable
globalActivePower<-as.numeric(consumData$Global_active_power)
#plot histogram
hist(globalActivePower,col="red",main="Global Active Power",xlab = "Global Active Power (kilowatts)")
#copy into png file
dev.print(device = png, filename = 'plot1.png', width = 480, height = 480)
