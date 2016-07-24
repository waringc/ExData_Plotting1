library(lubridate)
##Load files into memory

power<- read.table("Data/household_power_consumption.txt",sep=";", header=TRUE, na.strings = "?")

##Get subset of dates we are interested in
powerplot<-subset(power, Date=="1/2/2007" | Date=="2/2/2007")

#convert date format
powerplot$Date = dmy_hms(paste(powerplot$Date, powerplot$Time))
powerplot$Time<-NULL                      

##create PNG graphic device

png(filename = "plot3.png", width = 480, height = 480, units = "px")
with(powerplot, plot(Date, Sub_metering_1, typ='l', xlab="", ylab="Energy sub metering"))
lines(powerplot$Date,powerplot$Sub_metering_2,col="red")
lines(powerplot$Date,powerplot$Sub_metering_3,col="blue")

legend("topright", legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1) , col=c("black", "red","blue"))

dev.off()