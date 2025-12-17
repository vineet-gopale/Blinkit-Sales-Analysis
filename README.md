# Blinkit Sales Analysis Dashboard

## Project Overview
This project involves a comprehensive data analysis of **Blinkit** sales data. The goal was to analyze sales performance, customer satisfaction, and inventory distribution to identify key insights and opportunities for optimization using various KPIs and visualizations in Power BI.

## Business Requirements

### 1. Key Performance Indicators (KPIs)
* **Total Sales:** The overall revenue generated from all items sold.
* **Average Sales:** The average revenue per sale.
* **Number of Items:** The total count of different items sold.
* **Average Rating:** The average customer rating for items sold.

### 2. Chart Requirements
* **Total Sales by Fat Content:** Analyze the impact of fat content on total sales via a Donut Chart.
* **Total Sales by Item Type:** Identify the performance of different item types via a Bar Chart.
* **Fat Content by Outlet for Total Sales:** Compare fat content sales across different outlets via a Stacked Column Chart.
* **Total Sales by Outlet Establishment:** Evaluate how the age or type of outlet establishment influences sales via a Line Chart.
* **Sales by Outlet Size:** Analyze the correlation between outlet size and total sales via a Donut Chart.
* **Sales by Outlet Location:** Assess the geographic distribution of sales via a Funnel Map.
* **All Metrics by Outlet Type:** A comprehensive view of all key metrics broken down by different outlet types via a Matrix Card.

## Tools Used
* **SQL:** Used for data cleaning, standardization, and initial analysis.
* **Power BI:** Used for data processing, data modeling, creating DAX calculations, and building the interactive dashboard.
* **Excel:** Used as the raw data source.

## ⚙️ Process & Methodology

1.  **Data Walkthrough & Connection:** Connected Power BI to the Excel/SQL data source.
    * Understood the dataset's structure (8,523 rows, 12 columns).
    * Identified columns such as `Item Fat Content`, `Item Type`, `Outlet Establishment Year`, `Outlet Location Type`, etc.

2.  **Data Cleaning (ETL):**
    * **Standardizing Data:** Cleaned the `Item Fat Content` column to ensure consistency (e.g., replacing "LF" and "low fat" with "Low Fat", and "reg" with "Regular").
    * **Handling Missing Values:** Checked for null values in critical columns like `Item Weight` and handled them appropriately.

3.  **Data Processing & DAX:**
    * Created calculated measures for KPIs:
        * `Total Sales = SUM(Sales)`
        * `Average Sales = AVERAGE(Sales)`
        * `No of Items = COUNTROWS(Table)`
        * `Avg Rating = AVERAGE(Rating)`
    * Used DAX to create dynamic titles and custom metrics.

4.  **Dashboard Layout & Charting:**
    * Designed a clean, interactive canvas with a consistent color palette (Blinkit’s signature Yellow & Green).
    * Incorporated slicers for `Outlet Location`, `Outlet Size`, and `Item Type` to allow for dynamic filtering.

## Key Insights & Dashboard Metrics

* **Overall Performance:**
    * **Total Sales:** ₹1.20M
    * **Average Sales:** ₹141
    * **Items Sold:** 8,523
    * **Average Rating:** 3.9

* **Granular Insights:**
    * **Outlet Performance:** Tier 3 locations recorded the highest sales (₹472.13K), followed by Tier 2 (₹393.15K) and Tier 1 (₹336.40K).
    * **Outlet Size:** Medium-sized outlets contributed the most to total sales.
    * **Product Preferences:** "Fruits and Vegetables" and "Snack Foods" are the top-performing categories.
    * **Sales Trend:** There was a significant peak in sales in 2018 (₹205K), indicating a strong year for outlet establishment and performance.
    * **Fat Content:** Low Fat items generated slightly higher sales (₹776.3K) compared to Regular items (₹425.4K).
