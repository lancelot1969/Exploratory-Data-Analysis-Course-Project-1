## Initialization script

## The goal of this script is to prepare dataset for further use, namely to produce plots.

## 1. Rough estimate of how much memory the dataset will require in memory.
## Memory_est = nrow*ncol*8 bytes/numeric = 149418648 bytes = 149418648/2^20 MB = 142.5 Mb
## Memory_MacPro = 4 Gb >> 142.5 Mb => Plenty of memory

## 2. Data from the dates 2007-02-01 and 2007-02-02 only will be used. One alternative is 
## to read the data from just those dates rather than reading in the entire dataset and 
## subsetting to those dates. We use fread to read this data file.

## REQUIRED LIBRARIES
## Check if required packages are installed 
if (!require("reshape2")) {
  install.packages("reshape2")
}
if (!require("data.table")) {
  install.packages("data.table")
}
if (!require("dplyr")) {
  install.packages("dplyr")
}
if (!require("tidyr")) {
  install.packages("tidyr")
}
if (!require("chron")) {
  install.packages("chron")
}
if (!require("lubridate")) {
  install.packages("lubridate")
}

if (!require("png")) {
  install.packages("png")
}

## Load required packages
library(reshape2)
library(data.table)
library(dplyr)
library(tidyr)
library(chron)
library(png)
library(lubridate)

## Download the data and put it into the /EDA folder
if(!file.exists("./EDA")){dir.create("./EDA")}
fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
f <- file.path(getwd(), "EDA", "powerdata.zip")
download.file(fileurl, f, method = "curl")

## Unzip dowloaded file
unzip(zipfile = f, exdir = "./EDA")

## Path to dataset
fi <- file.path(getwd(), "EDA", "household_power_consumption.txt")

## Read into table by removing white spaces and special character "?"
power_consume <- tbl_df(fread(fi, strip.white = TRUE, na.strings = "?", stringsAsFactors= T, colClasses ="character"))

## Create data subset for the range of date "2007-02-01"<= Date <= "2007-02-02
power_consume$Date <- as.Date(power_consume$Date, "%d/%m/%Y") 
power_subset <- subset(power_consume, Date>="2007-02-01" & Date<="2007-02-02")

## Convert the Date and Time variables to Date/Time class 
power_subset$date_time = ymd_hms(paste(power_subset$Date, power_subset$Time))

## Make sure all data has numeric values
power_subset[, 3:9] <-  as.numeric(as.character(unlist(power_subset[, 3:9])))

## Generate final subset dataset with date_time columm
final_subset <- subset(power_subset, select = c(date_time, Global_active_power:Sub_metering_3))