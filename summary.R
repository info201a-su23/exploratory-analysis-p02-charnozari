library(dplyr)

Cdataset <- read.csv("../../data/GlobalLandTemperaturesByCity.csv")
Cdataset$dt <- as.Date(Cdataset$dt)
data_1990_US <- Cdataset %>%
  filter(dt >= as.Date("1990-01-01") & dt <= as.Date("1990-12-31") & Country == "United States")
average_temp_US_1990 <- mean(data_1990_US$AverageTemperature, na.rm = TRUE)

average_temp_us_1990_function <- function(){
  i <- average_temp_US_1990
  return(i)
}

data_1990_CN <- Cdataset %>%
  filter(dt >= as.Date("1990-01-01") & dt <= as.Date("1990-12-31") & Country == "China")
average_temp_CN_1990 <- mean(data_1990_CN$AverageTemperature, na.rm = TRUE)

average_temp_CN_1990_function <- function(){
  i <- average_temp_CN_1990
  return(i)
}

data_2013_US <- Cdataset %>%
  filter(dt >= as.Date("2013-01-01") & dt <= as.Date("2013-12-31") & Country == "United States")
average_temp_US_2013 <- mean(data_2013_US$AverageTemperature, na.rm = TRUE)

average_temp_us_2013_function <- function(){
  i <- average_temp_US_2013
  return(i)
}

data_2013_CN <- Cdataset %>%
  filter(dt >= as.Date("2013-01-01") & dt <= as.Date("2013-12-31") & Country == "China")
average_temp_CN_2013 <- mean(data_2013_CN$AverageTemperature, na.rm = TRUE)

average_temp_CN_2013_function <- function(){
  i <- average_temp_CN_2013
  return(i)
}

average_temp_diff_US <- average_temp_US_2013 - average_temp_US_1990

average_temp_diff_US_function <- function(){
  i <- average_temp_diff_US
  return(i)
}
