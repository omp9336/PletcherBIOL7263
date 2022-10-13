library(tidyverse)

as_tibble(MBT_ebird)

glimpse(MBT_ebird)

Ebird_cut1 <- select(MBT_ebird, count_tot, year)

year_counts <- group_by(Ebird_cut1, year)

summarize(year_counts, sum(count_tot))

#2014 has the highest observation of individual birds with a total count of 211249.

as_tibble(MBT_ebird)

glimpse(MBT_ebird)

Year_species <- select(MBT_ebird, scientific_name, year)

Year_species %>%
  filter(year == 2014) %>%
  group_by(scientific_name)

#In 2014 there were 210 species observed.

as_tibble(MBT_ebird)

state_cut1 <- select(MBT_ebird, location, common_name, count)

glimpse(state_cut1)

blackbird_count <- filter(state_cut1, common_name == "Red-winged Blackbird")

blackbird_count %>%
  group_by(location) %>%
  summarize (sum(count))

#MO had the most total observations of 596 red-winged blackbirds.

part_4 <- select(MBT_ebird, duration, list_ID, common_name, year)

part_4.1 <- part_4 %>%
  filter(duration < 200 & duration > 5)%>%
  group_by(list_ID) %>%
  summarize(num_species = length(common_name), duration = first(duration), year = first(year))%>%
  mutate(av_spec_duration = num_species / duration)%>%
  group_by(year)%>%
  summarize(mean_year = mean(av_spec_duration))

glimpse(part_4.1)
