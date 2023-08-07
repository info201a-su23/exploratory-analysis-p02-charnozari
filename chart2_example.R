# Chart no.2 - Line Graph 
# Title: Average Temperature of Major Cities in the US from 1990 - 2013

# load the necessary packages
library(ggplot2)
library(dplyr)
library(lubridate)
# read specific file which includes the data set
major_city_dataset <- read.csv("GlobalLandTemperaturesByMajorCity.csv")
# filter the data to include specific time frame for major cities in the US
US_data <- major_city_dataset %>%
  filter(Country == "United States", dt >= 1990 & dt <= 2014)
# filter out the year from the dates
US_data$dt <- year(US_data$dt)
# group the avg temperature for each year
avg_temp_each_city <- US_data %>%
  group_by(dt, City) %>%
  summarize(AverageTemperature = mean(AverageTemperature, na.rm = TRUE))
# assign values for the map and create titles
ggplot(avg_temp_each_city, aes(x = dt, y = AverageTemperature, color = City)) +
  geom_line() +
  labs(title = "Average Temperature of Major Cities in the US 1990-2013",
       x = "Year",
       y = "Average Temperature (°C)",
       color = "City") +
  theme_minimal()