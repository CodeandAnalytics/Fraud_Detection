# 🕵️‍♂️ Fraud Detection Dashboard — SQL + Power BI

## 📊 Project Overview.
In today’s world of online payments and digital banking, fraud detection is more important than ever for companies like banks, fintech apps, and e-commerce platforms.
The main goal of this project was to build an end-to-end Fraud Detection Analysis System using SQL for data preparation and Power BI for creating clear,interactive dashboard.
This setup helps spot unusual patterns early, track risk exposure, and support fast, smart decisions for fraud prevention.

---

## 🗂️ Dataset Structure
I worked with a synthetic dataset representing a fintech company’s transaction ecosystem. The data was split into five relational tables:

Users- (user profiles, past fraud history),
Transactions- (amounts, types, fraud labels),
Cards- (card type, age),
Transaction_Insights- (behavioral transaction metrics),
Security_Features- (IP risk, authentication, risk scores).
This structure mimics a real-world database used by risk management teams.

---


## 🧑‍💻 SQL Highlights
- Schema design with `PRIMARY KEY` and `FOREIGN KEY` constraints.
- Data cleansing: transforming transaction amounts, timestamps, and flags.
- Analytical queries for fraud patterns, device risks, and card type anomalies.

---

## 📈 Power BI Dashboard Highlights
- KPI Cards: Total Users, Transactions, Fraud Count, Fraud Rate.
- Line Chart: The line chart illustrates Fraud cases and Fraud rate by location.
- Matrix Table: The matrix visual tabulates Transaction type against Authentication method to analyze the fraud distribution.
- Bar Chart: The bar chart illustrates Avg transaction amount 7D,categorized by card type.
- Clustered Bar chart: This bar chart comapring fraud and non_fraud transaction count across different device type.
- Slicers: Filter by Date, Device, Card, Weekend

---

Conclusion:
This project sharpened my SQL skills for data modeling,Power BI skills for visual storytelling and DAX skills for KPI calculations like fraud rate and total fraud cases.
It replicates the workflow used in real fraud detection systems, preparing me to handle similar tasks in professional data analytics or BI roles.


