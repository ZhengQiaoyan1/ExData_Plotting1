#This is project 1 (plot1) for exploratory data analysis.

####Set working directory####
setwd("E:/Courses/Exploratory Data Analysis/Project")

####Read txt files####
hpc<-read.table("household_power_consumption.txt",header=T,sep=';',dec=".",stringsAsFactors=F,na.string="?",colClasses=c(rep("character",2),rep("numeric",7)))

####Check the colclass####
#class(householdPC$Global_active_power)
#class(householdPC$date)
#class(householdPC$time)
####Turn factor to numeric####
#for (i in 3:9)
#householdPC[,i]<-as.numeric(as.character(householdPC[,i]))

####using data from the dates 2007-02-01 and 2007-02-02####
householdPC<-hpc[hpc$Date=="1/2/2007"|hpc$Date=="2/2/2007",]

####Plot1####
png(filename = "plot1.png",width = 480, height = 480)

hist(householdPC$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power(Kilowatts)",xlim=c(0,6))

dev.off()
