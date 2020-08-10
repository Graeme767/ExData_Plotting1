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

## create line plot for sub metering 1
plot(df_date$Date, df_date$Sub_metering_1, xlab = "", type = "l",
     ylab = "Energy sub metering")
## create line plot for sub metering 2
lines(df_date$Date, df_date$Sub_metering_2, col = "red")
## create line plot for sub metering 2
lines(df_date$Date, df_date$Sub_metering_3, col = "blue")
## create legend
legend("topright", col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = c(1,1,1), cex = 0.5)

## save to png graphics device and disconnect
dev.copy(png, "./plot3.png", width = 480, height = 480)
dev.off()
