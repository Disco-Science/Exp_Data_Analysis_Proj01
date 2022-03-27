library(tidyverse)
library(lubridate)

if (!file.exists("./Elec_Power_Consump.zip") | !file.exists("./house_power_consumption_data/")) {
  
  dir.create("./house_power_consumption_data/")
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "./Elec_Power_Consump.zip")
  unzip("./Elec_Power_Consump.zip", exdir = "./house_power_consumption_data/")
  
}

#Idea 
# Remove NA values 
# Take only every hour position
# Change x axis to day of the week by taking 0 hr, 24 hr, and 48 hr only


table = read.table("./house_power_consumption_data/household_power_consumption.txt", sep = ";", header = TRUE) %>%
  filter(Date == "2/1/2007" | Date == "2/2/2007", Time != "00:00:00")

table = mutate(table, newDate = paste(Date, Time))
dateTimes = mdy_hms(table$newDate)
table = mutate(table, newDate = dateTimes)
table = mutate(table, Global_active_power = replace_na(as.numeric(Global_active_power),0)) 
table = table %>% group_by(newDate) %>%summarise_at(vars(Global_active_power), list(GPA = mean))

  
# table3 = table2[order(table2$Time), ]

# plot(table2$Time,table2$Global_active_power,type="l")
# plot(table3$Time,table3$Global_active_power,type="l")

# table4 = table3 %>% group_by(Date, Time) %>% summarise_at(vars(Global_active_power), list(Global_active_power = mean))

# table5 = table4 %>% mutate(dateTime = mdy_hms(c(month(Date), day(Date), year(Date), hour(Time), minute(Time), second(Time))))

plot(table$newnewDate,table$name,type="l")


