# ========================================
# Bellabeat Case Study: Activity Visualizations
# ========================================
# This script generates exploratory plots and summary tables
# to analyze trends in steps, calories, and active minutes
# across users and time periods.

library(ggplot2)

# 1. Plot trends over time: steps, calories, active minutes
ggplot(daily_activity, aes(x = activity_date)) +
  geom_line(aes(y = total_steps, color = "Steps")) +
  geom_line(aes(y = calories, color = "Calories")) +
  geom_line(aes(y = total_active_minutes, color = "Active Minutes")) +
  labs(title = "Activity Trends Over Time",
       x = "Date", y = "Value",
       color = "Metric") +
  theme_minimal()

# 2. Identify top active days (highest total steps)
top_days <- daily_activity %>%
  arrange(desc(total_steps)) %>%
  slice(1:10)

print(top_days)

# 3. Compare activity by user ID (steps distribution)
ggplot(daily_activity, aes(x = factor(id), y = total_steps)) +
  geom_boxplot() +
  labs(title = "Steps Distribution by User",
       x = "User ID", y = "Steps") +
  theme_minimal()

# 4. Marketing insight: Average activity per user
avg_by_user <- daily_activity %>%
  group_by(id) %>%
  summarise(
    avg_steps = mean(total_steps, na.rm = TRUE),
    avg_active_minutes = mean(total_active_minutes, na.rm = TRUE),
    avg_calories = mean(calories, na.rm = TRUE)
  ) %>%
  arrange(desc(avg_steps))

print(avg_by_user)