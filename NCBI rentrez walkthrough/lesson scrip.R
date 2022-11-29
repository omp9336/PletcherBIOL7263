library(rentrez)
library(glue)
library(tidyverse)
library(ggplot2)

entrez_dbs()

entrez_db_summary("nuccore")
entrez_db_searchable("popset")
entrez_db_searchable("protein")
entrez_db_links()

entrez_search()

amv_search <- entrez_search(db = "nuccore", term = "alfalfa mosaic virus")
