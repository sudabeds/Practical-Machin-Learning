download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "./exdata-data-household_power_consumption.zip")
unzip("./exdata-data-household_power_consumption.zip")
P1=read.csv("./household_power_consumption.txt", sep = ";", stringsAsFactors = F)
Date2=as.Date(P1$Date, "%d/%m/%Y")
P2=cbind(Date2,P1)
P3=subset(P2, Date2=="2007-2-1"|Date2=="2007-2-2")
library(dplyr)
P4=tbl_df(P3)
P5=mutate(P4, GAP=as.numeric(Global_active_power))

##Plot1
hist(P5$GAP, col="red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.copy(png, "plot1.png", width=480, height=480)
dev.off()