library(tidyverse)
library(lubridate)

if (!file.exists("./Elec_Power_Consump.zip") | !file.exists("./house_power_consumption_data/")) {
  
  dir.create("./house_power_consumption_data/")
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "./Elec_Power_Consump.zip")
  unzip("./Elec_Power_Consump.zip", exdir = "./house_power_consumption_data/")
  
}

#Try an lapply to this process to select out the columns for the mutate functions

table = read.table("./house_power_consumption_data/household_power_consumption.txt", sep = ";", header = TRUE) %>%
  filter(Date == "1/2/2007" | Date == "2/2/2007", Time != "00:00:00")
table = mutate(table, dateTime = dmy_hms(paste(Date, Time)))
table = mutate(table, Global_active_power = replace_na(as.numeric(Global_active_power),0)) 
table = mutate(table, SUB1 = replace_na(as.numeric(Sub_metering_1),0)) 
table = mutate(table, SUB2 = replace_na(as.numeric(Sub_metering_2),0)) 
table = mutate(table, SUB3 = replace_na(as.numeric(Sub_metering_3),0)) 
table = mutate(table, GRP = replace_na(as.numeric(Global_reactive_power),0))
table = mutate(table, VOLT = replace_na(as.numeric(Voltage),0))


#Data ends here

png("./plot3.png")
plot(table$dateTime, table$SUB1, type = "l",  
     xlab = "",  ylab = "",
     ylim = c(0,40), yaxt = "n", cex.axis=0.75,
     cex.lab=0.75)
lines(table$dateTime, table$SUB2, col="red")
lines(table$dateTime, table$SUB3, col="blue")
axis(2, at = c(0,10,20,30), cex.axis=0.75)
title(ylab = "Energy sub metering", cex.lab = 0.75, line = 2.5)
legend("topright", 
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       col=c("black", "red", "blue"),
       lty=c(1,1,1),
       cex=0.8,
)
dev.off()
