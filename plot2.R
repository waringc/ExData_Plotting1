library(lubridate)
##Load files into memory

power<- read.table("Data/household_power_consumption.txt",sep=";", header=TRUE, na.strings = "?")

##Get subset of dates we are interested in
powerplot<-subset(power, Date=="1/2/2007" | Date=="2/2/2007")

#convert date format
powerplot$Date = dmy_hms(paste(powerplot$Date, powerplot$Time))
powerplot$Time<-NULL                      

##create PNG graphic device

png(filename = "plot2.png", width = 480, height = 480, units = "px")
with(powerplot, plot(Date, Global_active_power, typ='l', xlab="", ylab="Global Active Power (kilowatts)"))

dev.off()