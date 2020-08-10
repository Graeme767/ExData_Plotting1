## Code to create third png for the assignment

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

## set graphics device to create 4 graphs that will be added 
## from top to bottom
par(mfcol = c(2,2))

## Create global active plot
plot(df_date$Date, df_date$Global_active_power, xlab = "", type = "l",
     ylab = "Global Active Power")

## Create submetering plot
plot(df_date$Date, df_date$Sub_metering_1, xlab = "", type = "l",
     ylab = "Energy sub metering")
lines(df_date$Date, df_date$Sub_metering_2, col = "red")
lines(df_date$Date, df_date$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty = 1, cex = 0.5)

## Create voltage plot
plot(df_date$Date, df_date$Voltage, xlab = "", type = "l",
     ylab = "Voltage")

## Create global reactive power plot
plot(df_date$Date, df_date$Global_reactive_power, xlab = "", type = "l",
     ylab = "Global Reactive Power")
## save to png graphics device and disconnect
dev.copy(png, "./plot4.png", width = 480, height = 480)
dev.off()
