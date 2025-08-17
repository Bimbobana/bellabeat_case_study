# 📊 Bellabeat Marketing Analytics Case Study
**Portfolio Project — Bimbobana**

## 📝 Project Overview
This project analyzes smart device usage data to uncover trends that can inform **Bellabeat’s marketing strategy**.  
Bellabeat is a high-tech wellness company creating smart products for women, such as fitness trackers, smart water bottles, and health-monitoring apps.

The case study follows the **Google Data Analytics framework**:  
**Ask → Prepare → Process → Analyze → Share → Act**.

---

## 🎯 Business Task
**Goal:**  
Analyze public smart device usage data to:  
1. Identify trends in smart device usage.  
2. Relate those trends to Bellabeat customers.  
3. Recommend marketing strategies to increase user engagement.

**Key Business Questions:**  
- What are the main trends in smart device usage?  
- How can these trends be applied to Bellabeat’s audience?  
- How can these insights guide Bellabeat’s marketing campaigns?

**Stakeholders:**  
- Urška Sršen — Cofounder & CCO  
- Sando Mur — Cofounder & Mathematician  
- Bellabeat Marketing Analytics Team  

---

## 📂 Data Sources
**Primary Dataset:**  
- **FitBit Fitness Tracker Data** — [Kaggle Dataset](https://www.kaggle.com/arashnic/fitbit)  
  - 30 participants  
  - Minute-level activity, sleep, and heart rate data  
  - License: CC0 Public Domain  

**Limitations:**  
- Small sample size (non-representative of the entire market)  
- Self-reported and device-recorded metrics — potential inaccuracies  
- No personally identifiable information (PII) included  

**Data Organization:**  
- CSV files in long format  
- Key tables: `dailyActivity_merged.csv`, `sleepDay_merged.csv`, `heartRate_seconds.csv`  

---

## 🛠 Tools Used
- **R / RStudio**
  - `tidyverse`, `lubridate`, `ggplot2` for data wrangling and visualization  
- **Markdown** for documentation  
- **GitHub** for version control and portfolio hosting  

---

## 🧹 Data Cleaning & Processing
1. Imported CSV files into R.  
2. Combined datasets from two date ranges and removed duplicates.  
3. Converted date/time columns to `Date` format.  
4. Standardized column names to `snake_case`.  
5. Created a new column for `total_active_minutes` (sum of lightly, fairly, and very active minutes).  
6. Filtered out incomplete or irrelevant records.

```r
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