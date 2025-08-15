# --- Load libraries ---
library(tidyverse)
library(lubridate)
library(skimr)
library(janitor)  # For clean_names()

# --- Load first dataset ---
daily_activity_1 <- read_csv(
  "data/raw/dailyActivity_merged_3.12.16-4.11.16.csv"
) %>%
  clean_names() %>%
  mutate(activity_date = mdy(activity_date))  # Convert to Date

# --- Load second dataset ---
daily_activity_2 <- read_csv(
  "data/raw/dailyActivity_merged_4.12.16-5.12.16.csv"
) %>%
  clean_names() %>%
  mutate(activity_date = mdy(activity_date))

# --- Combine datasets and remove duplicates ---
daily_activity <- bind_rows(daily_activity_1, daily_activity_2) %>%
  distinct() %>%
  mutate(
    total_active_minutes = lightly_active_minutes + fairly_active_minutes + very_active_minutes
  )

# --- Inspect the combined dataset ---
glimpse(daily_activity)
skim(daily_activity)

# --- Summary statistics ---
summary_stats <- daily_activity %>%
  summarise(
    avg_steps = mean(total_steps, na.rm = TRUE),
    avg_calories = mean(calories, na.rm = TRUE),
    avg_active_minutes = mean(total_active_minutes, na.rm = TRUE)
  )

print(summary_stats)