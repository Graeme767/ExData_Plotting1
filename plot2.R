## Code to create second png for the assignment

## Clearing global environment
rm(list = ls())

library(dplyr)
library(lubridate)
## Setting working directory

setwd("G:/My Drive/R/Module4/Week1/Assignment/ExData_Plotting1")

## read data
df <- read.csv("./data/clean_data.csv", stringsAsFactors = F)
## format date as date
df_date <- mutate(df, Date = paste(Date, Time),
             Date = ymd_hms(Date))

## create line plot
plot(df_date$Date, df_date$Global_active_power, xlab = "", type = "l",
     ylab = "Global Active Power (kilowatts)")

## save to png graphics device and disconnect
dev.copy(png, "./plot2.png", width = 480, height = 480)
dev.off()
