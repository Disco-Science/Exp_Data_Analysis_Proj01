library(tidyverse)
library(lubridate)

if (!file.exists("./Elec_Power_Consump.zip") | !file.exists("./house_power_consumption_data/")) {
  
  dir.create("./house_power_consumption_data/")
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "./Elec_Power_Consump.zip")
  unzip("./Elec_Power_Consump.zip", exdir = "./house_power_consumption_data/")
  
}

  
table = read.table("./house_power_consumption_data/household_power_consumption.txt", sep = ";", header = TRUE) %>% 
  mutate(Date = dmy(Date)) %>% filter(Date > mdy("01-31-2007") & Date < mdy("2/3/2007")) 

png("./plot1.png")
hist(as.numeric(table$Global_active_power, na.rm = TRUE),
     col="red",xlab = "Global Active Power (kilowatts)",
     ylab="Frequency", main = "",
     ylim = c(0,1310),
     cex.axis = 0.75, cex.lab = 0.75, cex.main = 1
)
title(main="Global Active Power", line = -0.25, cex.main=1)
dev.off()
