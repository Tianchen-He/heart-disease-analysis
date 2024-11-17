library(ggplot2)
library(here)

here::i_am("src/figures.R")
data <- read.csv(here("data/heart.csv"))

# Generate histogram for resting blood pressure
bp_plot <- ggplot(data, aes(x = trestbps)) +
  geom_histogram(binwidth = 5, fill = "skyblue", color = "black") +
  labs(title = "Distribution of Resting Blood Pressure", x = "Resting Blood Pressure (mm Hg)", y = "Frequency")

ggsave(here("output/bp_plot.png"), bp_plot)