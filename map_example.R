# Load packages
library(tidyverse)
library(dplyr)
library(ggplot2)
library(maps)

# Load data (only pathway for now)
temp_city <- read.csv('../../data/GlobalLandTemperaturesByCity.csv')
world <- map_data("world")

# Clean data
temp_city_clean <- temp_city %>% 
  filter(dt > "2000-01-01") %>% 
  select(region = Country, temp = AverageTemperature)

# Average temperatures per country
temp_city_clean <- aggregate(temp ~ region, data = temp_city_clean, FUN = "mean") 

# Join world data and temp. data
world_sub <- inner_join(world, temp_city_clean, by = "region")

# Formatting map
plain <- theme(
  axis.text = element_blank(),
  axis.line = element_blank(),
  axis.ticks = element_blank(),
  panel.border = element_blank(),
  panel.grid = element_blank(),
  axis.title = element_blank(),
  panel.background = element_rect(fill = "white"),
  plot.title = element_text(hjust = 0.5),
  legend.title.align = 0.5
)

# Plot map
worldtemp <- ggplot(data = world_sub, mapping = aes(x = long, y = lat, group = group)) + 
  coord_fixed(1.3) +
  geom_polygon(aes(fill = temp)) +
  scale_fill_distiller(name = "Avg. Temp in °C", palette ="RdBu", direction = -1) + # or direction=1
  ggtitle("Global Temperatures") +
  plain

worldtemp