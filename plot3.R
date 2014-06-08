plot3<-function(){
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
  png(filename="plot3.png")
  
  plot(DateTime,meter$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering",col="black")
  lines(DateTime,meter$Sub_metering_2,type="l",col="red")
  lines(DateTime,meter$Sub_metering_3,type="l",col="blue")
  legend(x = "topright", y.intersp = 1, c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=c(1, 1, 1),
         lwd=c(2.5, 2.5, 2.5), col=c("black", "red", "blue"))
  
  dev.off()
}