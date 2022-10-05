library(tidyverse)

as_tibble(MBT_ebird)

glimpse(MBT_ebird)

Ebird_cut1 <- select(MBT_ebird, count_tot, year)

glimpse(Ebird_cut1)

arrange (Ebird_cut1, by = count_tot)

arrange (Ebird_cut1, by = desc(count_tot))

# 2020 is the year with the most individual birds of 3154

library(tidyverse)

glimpse(MBT_ebird)

Ebird_cut2 <- select(MBT_ebird, scientific_name, year)

glimpse(Ebird_cut2)

Ebird_cut3 <- filter(Ebird_cut2, year == 2020)

glimpse(Ebird_cut3)

Ebird_cut3 %>%
  



