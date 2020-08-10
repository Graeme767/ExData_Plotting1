## This is the code used to obtain and clean the data for the 
## household power consumption 

## Clearing the global environment
rm(list = ls())

## loading dplyr and lubridate to clean the data
library(dplyr)
library(lubridate)

## setting the working directory
setwd("G:/My Drive/R/Module4/Week1/Assignment/ExData_Plotting1")

## saving the url containing the datat
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

## downloading the data if the file exists
if(!file.exists("./data/power_data.zip") == T){
        download.file(fileUrl, "./data/power_data.zip")}

## Unzipping the data, if it has not yet been done
if(!file.exists("./data/household_power_consumption.txt") == T){
        unzip("./data/power_data.zip", 
              exdir = "./data")}

## reading the data
df <- read.table("./data/household_power_consumption.txt", header = T,
                 sep = ";", row.names = NULL)

## Subsetting the data by the necessary date
df_clean <- mutate(df, Date = dmy(Date))%>%
        filter(Date == ymd("2007-02-01")|
                       Date == ymd("2007-02-02"))

write.csv(df_clean, "./data/clean_data.csv", row.names = FALSE)

