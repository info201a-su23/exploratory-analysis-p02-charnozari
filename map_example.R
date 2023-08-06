library(tidyverse)
library(dplyr)
library(ggplot2)
library(maps)

temp_city <- read.csv('https://www.kaggle.com/datasets/berkeleyearth/climate-change-earth-surface-temperature-data?select=GlobalLandTemperaturesByCity.csv')
world <- map_data("world")

length(unique(temp_city$Country))

temp_city_clean <- temp_city %>% 
  filter(dt > "2000-01-01") %>% 
  distinct(Country, .keep_all = TRUE) %>% 
  select(region = Country, temp = AverageTemperature)

#diff <- setdiff(world$region, temp_city_clean$region)

world_sub <- inner_join(world, temp_city_clean, by = "region")

plain <- theme(
  axis.text = element_blank(),
  axis.line = element_blank(),
  axis.ticks = element_blank(),
  panel.border = element_blank(),
  panel.grid = element_blank(),
  axis.title = element_blank(),
  panel.background = element_rect(fill = "white"),
  plot.title = element_text(hjust = 0.5)
)

worldtemp <- ggplot(data = world_sub, mapping = aes(x = long, y = lat, group = group)) + 
  coord_fixed(1.3) +
  geom_polygon(aes(fill = temp)) +
  scale_fill_distiller(palette ="RdBu", direction = -1) + # or direction=1
  ggtitle("Global Temperature") +
  plain

worldtemp  
