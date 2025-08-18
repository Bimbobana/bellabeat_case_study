# r_analysis/scripts/time_series_plots.R

# Load libraries
library(tidyverse)

# Set working directory (optional if running in project root)
# setwd("/Users/maggie/Documents/GitHub/bellabeat_case_study")

# Load cleaned data
daily_activity <- read_csv("data/cleaned/daily_activity_cleaned.csv")

# --- Steps over time ---
p_steps <- ggplot(daily_activity, aes(x = activity_date, y = total_steps)) +
  geom_line(color = "steelblue") +
  labs(
    title = "Steps Over Time",
    x = "Date",
    y = "Total Steps"
  ) +
  theme_minimal()

# --- Calories over time ---
p_calories <- ggplot(daily_activity, aes(x = activity_date, y = calories)) +
  geom_line(color = "darkred") +
  labs(
    title = "Calories Burned Over Time",
    x = "Date",
    y = "Calories"
  ) +
  theme_minimal()

# --- Active minutes over time ---
p_active <- ggplot(daily_activity, aes(x = activity_date, y = total_active_minutes)) +
  geom_line(color = "forestgreen") +
  labs(
    title = "Active Minutes Over Time",
    x = "Date",
    y = "Total Active Minutes"
  ) +
  theme_minimal()

# Print plots in RStudio
print(p_steps)
print(p_calories)
print(p_active)

# Save plots to outputs/plots
ggsave("r_analysis/outputs/plots/steps_over_time.png", p_steps, width = 7, height = 5)
ggsave("r_analysis/outputs/plots/calories_over_time.png", p_calories, width = 7, height = 5)
ggsave("r_analysis/outputs/plots/active_minutes_over_time.png", p_active, width = 7, height = 5)