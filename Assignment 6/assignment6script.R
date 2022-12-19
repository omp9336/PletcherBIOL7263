birdlist <-read.csv("Assignment4/MBT_ebird.csv")

library(tidyverse)

library(patchwork)

library(dplyr)

birdlist2 <- group_by(birdlist, month, year, location)

count(birdlist2, common_name)

year_month_count <- summarise(birdlist2, common_name = n())

summarise(birdlist2, sum(common_name = n()))

library(ggplot2)

p4 <- ggplot(year_month_count, aes (month, common_name)) +
  geom_point(aes(color = year))+
  facet_wrap(~location)

p4
  
