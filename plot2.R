plot2<-function(){
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
  png(filename="plot2.png")
  
  plot(DateTime,meter$Global_active_power,type="l",xlab="",ylab="Global Active Power(kilowatts)")
  
  dev.off()
}