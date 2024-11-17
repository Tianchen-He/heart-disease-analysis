library(tidyverse)
library(here)

here::i_am("src/tables.R")
data <- read.csv(here("data/heart.csv"))

age_sex_stats <- data %>%
  summarise(
    age_mean = mean(age, na.rm = TRUE),
    age_sd = sd(age, na.rm = TRUE),
    sex_mean = mean(sex, na.rm = TRUE),
    sex_sd = sd(sex, na.rm = TRUE)
  )

saveRDS(age_sex_stats, here("output/age_sex_stats.rds"))