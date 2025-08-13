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
- Small sample size (non-representative of entire market)
- Self-reported and device-recorded metrics — potential inaccuracies
- No personal identifiers (PII) included

---

## 🛠 Tools Used
- **R / RStudio**
  - `tidyverse`, `lubridate`, `ggplot2` for data wrangling and visualization
- **Markdown** for documentation
- **GitHub** for version control and portfolio hosting

---

## 🧹 Data Cleaning & Processing
1. Imported CSV files into R.
2. Checked for and removed duplicates.
3. Converted date/time formats.
4. Standardized column names to `snake_case`.
5. Merged datasets on `id` and `date`.
6. Filtered out incomplete or irrelevant records.

```r
daily_activity <- read_csv("dailyActivity_merged.csv") %>%
  clean_names() %>%
  mutate(activity_date = mdy(activity_date))