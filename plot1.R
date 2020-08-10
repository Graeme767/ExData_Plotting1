## Code to create first png for the assignment

## Clearing global environment
rm(list = ls())


## Setting working directory

setwd("G:/My Drive/R/Module4/Week1/Assignment/ExData_Plotting1")

## read data
df <- read.csv("./data/clean_data.csv", stringsAsFactors = F)

## Creating histogram
hist(df$Global_active_power, col = "red", 
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")

## save to png graphics device and disconnect
dev.copy(png, "./plot1.png", width = 480, height = 480)
dev.off()
