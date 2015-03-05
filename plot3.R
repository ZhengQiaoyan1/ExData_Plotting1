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

####Plot3####
png(filename ="plot3.png",width = 480, height = 480)

par(mar = c(7, 6, 5, 4)) 

plot(householdPC$Date_Time,householdPC$Sub_metering_1,type="l",col="black",xaxt=NULL,xlab="",ylab="Energy sub metreing")
lines(householdPC$Date_Time,householdPC$Sub_metering_2,col="red",type="s")
lines(householdPC$Date_Time,householdPC$Sub_metering_3,col="blue",type="s")
legend("topright",lty=c(1,1),lwd=c(1,1,1),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
# type = "n" builds plots without points 
# xaxt = NULL suppresses x axis 
# xlab = "" removes the label from the x axis 
dev.off()
