library(ggplot2)
library(dplyr)
library(lubridate)

major_city_df <- 
  read.csv("GlobalLandTemperaturesByMajorCity.csv")

# only data from China from 1990-2014
china_temps <- major_city_df %>%
  filter(Country == "China", dt >= 1990 & dt <= 2014)

# separate the year from the rest of the date
china_temps$dt <- year(china_temps$dt)

# find average temp for each city during every year
avg_temps_city <- china_temps %>%
  group_by(dt, City) %>%
  summarize(AverageTemperature = mean(AverageTemperature, na.rm = TRUE))

ggplot(avg_temps_city, aes(x = dt, y = AverageTemperature, color = City)) +
  geom_line() +
  labs(title = "Average Temperature of Major Cities in China, 1990-2013",
       x = "Year",
       y = "Average Temperature (in degrees Celsius)",
       color = "City") +
  theme_classic()