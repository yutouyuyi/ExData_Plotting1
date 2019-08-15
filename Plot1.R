#Plot1.R code

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

#open graphic device
png("plot1.png",width = 480,height = 480)
hist(interesteddata$Global_active_power,col="red",breaks = 12,xlab = "Global Active Power(kilowatts)",ylab = "Frequency", main="Global Active Power")
dev.off()