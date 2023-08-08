library(dplyr)
library(countrycode)
library(kableExtra)

Cdataset <- read.csv('../../data/GlobalLandTemperaturesByCity.csv')
Cdataset$Country <- as.character(Cdataset$Country)
Cdataset$dt <- as.Date(Cdataset$dt)
iso_codes <- countrycode(Cdataset$Country, "country.name", "iso2c")
Cdataset$iso_code <- iso_codes
filtered_data <- Cdataset %>%
  filter(dt >= "1990-01-01" & dt <= "2013-12-31")
average_temp_1990 <- filtered_data %>%
  filter(dt >= "1990-01-01" & dt <= "1990-12-31") %>%
  group_by(iso_code) %>%
  summarize(AverageTemperature_1990 = mean(AverageTemperature, na.rm = TRUE))
average_temp_2013 <- filtered_data %>%
  filter(dt >= "2013-01-01" & dt <= "2013-12-31") %>%
  group_by(iso_code) %>%
  summarize(AverageTemperature_2013 = mean(AverageTemperature, na.rm = TRUE))
temperature_diff <- merge(average_temp_1990, average_temp_2013, by = "iso_code")
temperature_diff$TemperatureDifference <- temperature_diff$AverageTemperature_2013 - temperature_diff$AverageTemperature_1990

kable(temperature_diff) %>%
  kable_styling(bootstrap_options = "striped", full_width = F)