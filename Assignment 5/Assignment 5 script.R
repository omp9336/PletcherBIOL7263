require(tidyverse)
library(tidyverse)

view(assignment6part1)

pt1 <- assignment6part1 %>%
  pivot_longer(
    cols = "Sample1_Male_Control":"Sample20_Female_Treatment", 
    names_to = "sample",
    names_pattern = "(\\d+)",
    values_to = "measurement"
  )

view(pt1)

pt2 <- pt1 %>%
  pivot_wider(
    names_from = ID, values_from = measurement
  )

?extract

view(pt2)               

pt3 <- assignment6part2 %>%
  pivot_longer(
    cols = "Sample16.Treatment":"Sample13.Control",
    names_to = "sample",
    names_pattern = "(\\d+)",
    values_to = "mass"
  )

library(stringr)

install.packages("stringr")

as_tibble(pt2)

as_tibble(pt3)

pt3.1<-select(pt3, -"ID")

as_tibble(pt3.1)



pt2 %>%
  full_join(pt3.1, by = "sample")
