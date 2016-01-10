download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "./exdata-data-household_power_consumption.zip")
unzip("./exdata-data-household_power_consumption.zip")
P1=read.csv("./household_power_consumption.txt", sep = ";", stringsAsFactors = F)
Date2=as.Date(P1$Date, "%d/%m/%Y")
P2=cbind(Date2,P1)
P3=subset(P2, Date2=="2007-2-1"|Date2=="2007-2-2")
library(dplyr)
P4=tbl_df(P3)
P5=mutate(P4, GAP=as.numeric(Global_active_power))



dt=paste(P5$Date, P5$Time)
DT=strptime(dt, "%d/%m/%Y %H:%M:%S")
P6=cbind(P5, DT)


##Plot3
with(P6, plot(DT,Sub_metering_1, type = "l", xlab="",ylab = "Energy sub metering"))
with(P6, lines(DT,Sub_metering_2, col="red"))
with(P6, lines(DT,Sub_metering_3, col="blue"))
legend("topright", lty ="solid", col=c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png, "plot3.png", width=480, height=480)
dev.off()