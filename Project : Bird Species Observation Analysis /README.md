# Bird Species Observation Analysis

An exploratory data analytics project studying bird species diversity, behavior, environmental influences, and conservation priorities across forest and grassland ecosystems.

This project uses Python for data cleaning, feature engineering, and exploratory data analysis (EDA), followed by Power BI for interactive reporting.

## Project Overview

Ecological monitoring generates multi-file observational data across different habitats and observers. This project consolidates raw survey files, cleans inconsistencies, creates useful derived features, and highlights patterns that support habitat management and conservation.

### Dataset Summary
- Raw Input: 22 CSV files (11 Forest sites, 11 Grassland sites)
- Data Filtering: 7 empty grassland CSV files were dropped during ingestion
- Final Volume: 15,382 valid observation records (8,555 Forest and 6,827 Grassland)
- Key Variables: Species names, dates, plot locations, identification methods, distance ranges, flyover flags, weather conditions, disturbance levels, and conservation status

## Tools Used
- Python (Pandas, NumPy, Jupyter Notebook) for data preprocessing and EDA
- Microsoft Power BI for interactive dashboards and visual reporting

## Key Findings

- Seasonal Activity: Forest observations peak in Summer (3,322 records) and Spring (2,976 records), driven by May and June survey activity.
- Dominant Species:
- Forest: Red-eyed Vireo (694), Carolina Wren (646), and Northern Cardinal (595).
- Grassland: Field Sparrow, Northern Cardinal, Indigo Bunting, and Red-winged Blackbird.
- Identification Methods: Auditory detection dominates both habitats. In forests, Singing accounts for 63.5% (5,430) of detections, followed by Calling (2,677) and Visualization (438).
- Impact of Disturbance: Higher disturbance levels correlate with lower biodiversity. Unique forest species count drops from 96 under "No effect on count" to 45 under "Serious effect on count".
- Weather Conditions: Sightings and species richness peak under Partly Cloudy or Clear skies with light air movement (1-3 mph) and temperatures around 21.87°C.
- Conservation Priorities: 338 forest sightings are on the PIF Watchlist, while 2,445 forest and 1,445 grassland records belong to High Regional Stewardship Priority species.

## Repository Files

- Bird_Species_Observation_Analysis.ipynb - Data cleaning, feature engineering, and EDA code
- Bird_Species_Observation_Report.pdf - Summary report with methodology and conclusions
- Bird_Species_Dashboard.pbix - Interactive Power BI dashboard file
- README.md - Project documentation

