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
#install.packages("date")
#library(date)

#householdPC[,1]<-as.Date(householdPC[,1],format="%d/%m/%Y")
#householdPC[,1]
#householdPC[,2]<-weekdays(householdPC[,1])
#head(householdPC[,2])
####Plot2####
png(filename = "plot2.png",width = 480, height = 480)

ts.plot(householdPC$Global_active_power,type="l",xlab=NULL,ylab="Global Active Power(Kilowatts)")

dev.off()
