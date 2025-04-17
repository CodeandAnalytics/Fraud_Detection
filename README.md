# 🕵️‍♂️ Fraud Detection Dashboard — SQL + Power BI

## 📊 Project Overview
This project showcases a Fraud Detection Analysis pipeline using **PostgreSQL** and **Power BI**. 
The goal is to identify suspicious patterns in financial transaction data and visualize key insights through an interactive dashboard.

---

## 💡 Problem Statement
Financial fraud is a major concern for institutions and users. 
Detecting early patterns can help prevent losses and improve security. 
This project builds an end-to-end solution from database modeling to data visualization.

---

## 🗂️ Dataset Structure
The project uses a synthetic fraud dataset, split into the following tables:
- `Users` — User profiles and history.
- `Transactions` — Financial activity records.
- `Cards` — Card types linked to users.
- `Transaction_Insights` — User behavior metrics.
- `Security_Features` — IP flags, risk scores, authentication methods.

---

## ⚙️ Tech Stack
- **SQL (PostgreSQL)** — Data Cleaning, Transformation, and Querying.
- **Power BI** — Data Visualization & Dashboard Creation.
- **DAX** — Analytical Measures.

---

## 🧑‍💻 SQL Highlights
- Schema design with `PRIMARY KEY` and `FOREIGN KEY` constraints.
- Data cleansing: transforming transaction amounts, timestamps, and flags.
- Analytical queries for fraud patterns, device risks, and card type anomalies.

---

## 📈 Power BI Dashboard Highlights
- KPI Cards: Total Users, Transactions, Fraud Count, Fraud Rate.
- Line Chart: Fraud Trends over time.
- Matrix Table: Fraud Distribution by Device Type.
- Stacked Bar Chart: Card Type vs Fraud Risk.
- Slicers: Filter by Date, Device, Merchant Category.

---


