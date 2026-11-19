# Uber Supply-Demand Gap Analysis

An exploratory data analysis project examining 6,745 Uber ride requests across a 5-day weekday period (Monday to Friday). Using MySQL, Python, and MS Excel, this project investigates ride fulfillment rates, driver behavior, and the operational bottlenecks causing unfulfilled requests between the City and the Airport.

## Project Objectives
- Data Cleaning and ETL (MySQL): Transform raw request logs into a structured database by handling NA strings, standardizing timestamps, and creating time-based features.
- Exploratory Data Analysis (Python): Quantify request outcomes across weekdays, hourly time slots, pickup points, and 300 unique drivers.
- Dashboarding and Reporting (MS Excel): Summarize operational trends using pivot tables and charts to propose supply-side recommendations.

## Tools Used
- Database and ETL: MySQL Workbench
- Analysis: Python (Pandas, NumPy) in Jupyter Notebook
- Visualization: Microsoft Excel

## Key Findings

### 1. Overall Fulfillment Breakdown
Out of 6,745 total requests handled across a pool of 300 unique drivers, over 58% went unfulfilled:
- Trip Completed: 2,831 (41.97%)
- No Cars Available: 2,650 (39.29%)
- Cancelled: 1,264 (18.74%)

### 2. Location Bottlenecks (City vs. Airport)
- City Pickups (3,507 requests): Higher overall demand and a high driver cancellation rate (1,066 cancellations in the City vs. 198 at the Airport).
- Airport Pickups (3,238 requests): Severe vehicle supply shortages (1,713 No Cars Available incidents at the Airport vs. 937 in the City).

### 3. Time-Slot Patterns
- Morning Rush (5:00 AM to 11:59 AM): Driver cancellations spike during Early Morning (490) and Morning (430) hours, mostly on City-to-Airport trips.
- Evening and Night Rush (4:00 PM to 11:59 PM): Car unavailability peaks during Evening (883) and Night (774) hours as passengers struggle to find rides leaving the Airport.
- Weekday Volume: Demand remains steady from Monday to Friday (1,307 to 1,381 requests per day), peaking on Friday. Weekend data is not included in the dataset.

## Business Recommendations
- Morning City Incentives: Introduce surge pricing or trip-completion bonuses for City pickups between 5:00 AM and 11:00 AM to discourage driver cancellations on Airport routes.
- Evening and Night Airport Supply: Offer queue priority or peak-hour bonuses for drivers heading to the Airport between 4:00 PM and 11:00 PM to reduce No Cars Available drop-offs.


## Repository Files
- SQL script: Database creation, data cleaning, and insight queries
- uber_cleaned.csv: Exported cleaned dataset (6,745 rows, 9 columns)
- Jupyter Notebook: Python exploratory data analysis
- PDF Report: Full project summary with SQL, Python, and Excel outputs
- README.md: Project documentation
