
plot1<-function(){
  
  require(data.table)
  require(lubridate)
  
  ##Retrieve data from the text file
  meter<-fread("household_power_consumption.txt")
  meter$Date<-as.Date(meter$Date,"%d/%m/%Y")
  newmeter <- meter[which(meter$Date=="2007-02-01")]
  newmeter2<- meter[which(meter$Date=="2007-02-02")]
  meter<-rbind(newmeter,newmeter2)
  DateTime<-ymd_hms(paste(meter$Date, meter$Time, sep = "_"))
  
  ##Write plot to a png file
  png(filename="plot1.png")
  
  hist(as.numeric(meter$Global_active_power),main="Global Active Power",col="red",xlab="Global Active Power(kilowatts)")
 
  dev.off()
}

