# -------------------------------
# Data Cleaning Script
# -------------------------------

# Load libraries
library(tidyverse)   # For data wrangling & visualization
library(lubridate)   # For handling dates
library(janitor)     # For clean_names()
library(skimr)       # Quick data summary

# -------------------------------
# 1. Load raw datasets
# -------------------------------

daily_activity_1 <- read_csv("data/raw/dailyActivity_merged_3.12.16-4.11.16.csv") %>%
  clean_names() %>%
  mutate(activity_date = mdy(activitydate))

daily_activity_2 <- read_csv("data/raw/dailyActivity_merged_4.12.16-5.12.16.csv") %>%
  clean_names() %>%
  mutate(activity_date = mdy(activitydate))

# -------------------------------
# 2. Combine datasets and remove duplicates
# -------------------------------

daily_activity <- bind_rows(daily_activity_1, daily_activity_2) %>%
  distinct() %>%
  mutate(total_active_minutes = lightlyactiveminutes + fairlyactiveminutes + veryactiveminutes)

# -------------------------------
# 3. Inspect data
# -------------------------------

glimpse(daily_activity)
skim(daily_activity)

# -------------------------------
# 4. Summary statistics
# -------------------------------

summary_stats <- daily_activity %>%
  summarise(
    avg_steps = mean(totalsteps, na.rm = TRUE),
    avg_calories = mean(calories, na.rm = TRUE),
    avg_active_minutes = mean(total_active_minutes, na.rm = TRUE)
  )

print(summary_stats)

# -------------------------------
# 5. Save cleaned data
# -------------------------------

write_csv(daily_activity, "data/processed/daily_activity_cleaned.csv")

# -------------------------------
# End of Script
# -------------------------------