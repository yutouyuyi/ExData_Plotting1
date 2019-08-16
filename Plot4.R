#Plot4.R code

#set working directory and read data
setwd("C:/Users/Yi Yu/Desktop/cs/datascience/dataclearning/data/exdata_data_household_power_consumption")
household<-read.csv("household_power_consumption.txt", header = T, sep = ';', 
                    na.strings = "?")

#convert data from charactor type to Date type
household$Date <- as.Date(household$Date, format = "%d/%m/%Y")

#select data on 2007-02-01 and 2007-02-02
interesteddata<-subset(household,household$Date=="2007-02-01"|household$Date=="2007-02-02")

#remove the original dataset to save working space
rm(household)

#convert date and time
interesteddata$datetime<-paste(interesteddata$Date,interesteddata$Time)
interesteddata$datetime<-as.POSIXct(interesteddata$datetime)


#open graphic device
png("plot4.png",width = 480,height = 480)
par(mfrow=c(2,2))
with(interesteddata,plot(Global_active_power~datetime,type="l",ylab="Global Active Power",xlab=""))
with(interesteddata,plot(Voltage~datetime,type="l"))
with(interesteddata, {
  plot(Sub_metering_1~datetime, type="l", col="black",ylab = "Energy sub metering", xlab = "")
  lines(Sub_metering_2~datetime,col="red")
  lines(Sub_metering_3~datetime,col="blue")
  })
legend("topright",col=c("black","red","blue"), lty=1,lwd=2,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
with(interesteddata,plot(Global_reactive_power~datetime))
dev.off()