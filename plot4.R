#This is project 1 (plot1) for exploratory data analysis.

####Set working directory####
setwd("E:/Courses/Exploratory Data Analysis/Project")

####Read txt files####
hpc<-read.table("household_power_consumption.txt",header=T,sep=';',dec=".",stringsAsFactors=F,na.string="?",colClasses=c(rep("character",2),rep("numeric",7)))

####using data from the dates 2007-02-01 and 2007-02-02####
householdPC<-hpc[hpc$Date=="1/2/2007"|hpc$Date=="2/2/2007",]

#install.packages("date")
library(date)
householdPC[,1]<-as.Date(householdPC[,1],format="%d/%m/%Y")

# Create Date_Time variable 
householdPC$Date_Time <- paste(householdPC$Date,householdPC$Time) 
head(householdPC$Date_Time)

# Convert Date_Time variable to proper format 
householdPC$Date_Time <- strptime(householdPC$Date_Time,format="%Y-%m-%d %H:%M:%S") 

png(filename = "plot4.png",width = 480, height = 480,units = "px"))

par(mfrow = c(2, 2))
####Plot(1,1)####
plot(householdPC$Date_Time,householdPC$Global_active_power,type="l",xaxt=NULL,xlab="",ylab="Global Active Power(Kilowatts)")

####Plot(1,2)####
plot(householdPC$Date_Time,householdPC$Voltage,type="l",xaxt=NULL,xlab="datetime",ylab="Voltage")

####Plot(2,1)####
plot(householdPC$Date_Time,householdPC$Sub_metering_1,type="l",col="black",xaxt=NULL,xlab="",ylab="Energy sub metreing")
lines(householdPC$Date_Time,householdPC$Sub_metering_2,col="red",type="s")
lines(householdPC$Date_Time,householdPC$Sub_metering_3,col="blue",type="s")
legend("topright",lty=c(1,1),lwd=c(1,1,1),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

####Plot(2,2)####
plot(householdPC$Date_Time,householdPC$Global_reactive_power,type="l",xaxt=NULL,xlab="datetime",ylab="Global_reactive_power")
dev.off()
