# Strava Fitness Data Analysis

An end-to-end fitness data analytics project analyzing user activity, calorie burn, sleep patterns, and workout intensity using MySQL, Python, and Microsoft Power BI.

## Project Overview

Fitness tracking apps generate detailed daily, hourly, and minute-level health records. This project cleans and consolidates 11 raw Strava fitness tables into three master datasets in MySQL, explores user behavior and activity correlations in Python, and presents interactive visual reports in Power BI.

### Data Structure
- Raw Tables: 11 separate CSV/SQL tables covering daily steps, calories, intensities, hourly metrics, minute-level logs, sleep records, and weight logs.
- Master Tables Created in SQL:
  - dailyActivity_master - Daily summary of steps, distances, calories burned, and activity intensity minutes.
  - hourlyActivity_master - Hourly breakdown of steps, total intensity, average intensity, and calories burned.
  - minuteActivity_master - Daily aggregated totals derived from wide minute-level calorie and intensity tables, joined with sleep and weight records.

## Tools Used
- MySQL Workbench - Schema creation, date formatting, duplicate removal, table joins, and SQL exploratory queries.
- Python (Pandas, NumPy, Matplotlib, Seaborn) - Data merging, correlation heatmaps, and distribution plots in Jupyter Notebook.
- Microsoft Power BI - Three-page interactive dashboard covering Daily Activity Summary, Hourly Intensity Patterns, and Minute-Level Health Metrics.

## Key Insights

- Daily Activity Benchmarks: Across tracked users, the overall daily average is 8.08K steps, with top users averaging over 14,700 to 16,000 steps per day.
- Peak Activity Windows: User movement and calorie burn peak during evening commuting and workout hours (5 PM to 7 PM) and mid-day (12 PM), with the highest average calorie burn occurring at 6 PM (122.18 avg calories).
- Weekly Trends: Users are most active on Saturdays (8,152.98 avg steps) and Tuesdays (8,125.01 avg steps), while Sundays show the lowest average step count (6,933.23 avg steps).
- Activity vs. Sedentary Time: Step counts and active minutes correlate positively with calories burned, whereas sedentary minutes show an inverse relationship with daily steps.
- High-Intensity Workouts: Most daily records show fewer than 50 minutes of very active movement, indicating opportunities to encourage consistent 30 to 60 minute daily workouts.

## Repository Files

- strava_fitness_queries.sql - SQL scripts for database setup, cleaning, deduplication, master table creation, and analytical queries.
- stravafitness_db.ipynb - Python notebook for loading master tables, merging records, and generating visualizations.
- Strava_PowerBI_Dashboard.pbix - Interactive three-page Power BI report.
- Strava_SQL_EDA_Report.pdf - Documentation of SQL queries and query output grids.
- Strava_Python_Report.pdf - Documentation of Python charts and visual interpretations.
- Strava_PowerBI_Report.pdf - Documentation of Power BI dashboard pages and KPIs.
- README.md - Project overview and documentation.

