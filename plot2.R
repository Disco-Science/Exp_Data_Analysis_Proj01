library(tidyverse)
library(lubridate)

if (!file.exists("./Elec_Power_Consump.zip") | !file.exists("./house_power_consumption_data/")) {
  
  dir.create("./house_power_consumption_data/")
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "./Elec_Power_Consump.zip")
  unzip("./Elec_Power_Consump.zip", exdir = "./house_power_consumption_data/")
  
}


table = read.table("./house_power_consumption_data/household_power_consumption.txt", sep = ";", header = TRUE) %>%
  filter(Date == "1/2/2007" | Date == "2/2/2007", Time != "00:00:00")
table = mutate(table, dateTime = dmy_hms(paste(Date, Time)))
table = mutate(table, Global_active_power = replace_na(as.numeric(Global_active_power),0)) 

png("./plot2.png")
plot(table$dateTime,table$Global_active_power,type="l", xlab = "", ylab = "", 
     ylim = c(0,8), yaxt = "n", cex.axis=0.75)
axis(2, at = c(0,2,4,6), cex.axis=0.75)
title(ylab="Global Active Power (kilowatts)", line = 2.5, cex.lab=0.75)
dev.off()

