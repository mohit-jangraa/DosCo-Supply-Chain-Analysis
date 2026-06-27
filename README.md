# 📦 DosCo Supply Chain Analytics & Inventory Optimization Dashboard

An end-to-end **Supply Chain Analytics** project built using **Python, SQL, and Power BI** to analyze sales performance, customer behavior, inventory trends, and logistics efficiency.

The project transforms raw transactional data into actionable business insights through data cleaning, exploratory data analysis, SQL-based business queries, and interactive dashboards.

---

# 📌 Project Overview

Supply chain organizations generate enormous amounts of operational data every day. However, raw data alone cannot support business decisions.

This project focuses on analyzing sales, customers, products, shipping performance, and delivery efficiency to answer real-world business questions such as:

- Which products generate the highest revenue?
- Which customer segment is the most profitable?
- Which markets perform the best?
- How efficient is the shipping process?
- Where are delivery delays occurring?
- What business decisions can improve profitability?

---

# 🎯 Business Objectives

- Analyze sales performance across products and markets.
- Identify high-value customers and customer segments.
- Evaluate shipping and logistics efficiency.
- Monitor delivery delays.
- Generate actionable business recommendations.
- Build an executive dashboard for decision-makers.

---

# 🗂 Dataset Information

**Dataset Name**

DataCo SMART SUPPLY CHAIN FOR BIG DATA ANALYSIS

**Dataset Size**

- Rows: **180,519**
- Columns: **53**

The dataset contains information related to:

- Orders
- Customers
- Products
- Categories
- Markets
- Shipping
- Profit
- Sales
- Delivery Performance

---

# 🛠 Tech Stack

- Python
- Pandas
- NumPy
- Matplotlib
- PostgreSQL
- SQL
- Power BI
- Git
- GitHub

---

# 📊 Project Workflow

```
Raw Dataset
      │
      ▼
Data Cleaning
      │
      ▼
Feature Engineering
      │
      ▼
Exploratory Data Analysis
      │
      ▼
SQL Business Analysis
      │
      ▼
Power BI Dashboard
      │
      ▼
Business Insights
```

---

# 🧹 Data Cleaning

Performed the following preprocessing tasks:

- Removed duplicate records
- Handled missing values
- Dropped unnecessary columns
- Converted date columns
- Corrected data types
- Removed irrelevant attributes
- Created clean analytical dataset

---

# ⚙ Feature Engineering

Created additional business features including:

- Shipping Delay
- Order Month
- Order Year
- Order Quarter
- Weekend Orders
- Profit Margin
- High Value Orders

These features were later used for SQL analysis and dashboard creation.

---

# 📈 Exploratory Data Analysis (EDA)

Performed extensive EDA to understand:

- Sales distribution
- Profit trends
- Customer behavior
- Category performance
- Market-wise revenue
- Shipping performance
- Delivery delays
- Product profitability

---

# 🗄 SQL Business Analysis

Business questions answered using PostgreSQL:

- Total Revenue
- Total Profit
- Total Orders
- Top Selling Products
- Top Customers
- Revenue by Market
- Profit by Category
- Monthly Revenue
- Shipping Performance
- Delivery Status
- Customer Segmentation
- Late Delivery Analysis
- Product Performance
- Market Performance

---

# 📊 Power BI Dashboard

The dashboard consists of **3 interactive pages**.

---

## 📄 Page 1 — Executive Overview

Provides a high-level summary of business performance.

### KPIs

- Total Revenue
- Total Profit
- Total Orders
- Total Customers
- Average Order Value
- Late Delivery %

### Visuals

- Monthly Sales Trend
- Sales by Market
- Profit by Category
- Revenue by Customer Segment

---

## 📄 Page 2 — Sales & Customer Analytics

Focuses on customer and product performance.

### Visuals

- Sales by Country
- Top Products
- Sales by Category
- Sales by Customer Segment

---

## 📄 Page 3 — Logistics & Delivery Performance

Analyzes shipping efficiency.

### KPIs

- Average Shipping Time
- Total Shipments
- Late Delivery %

### Visuals

- Shipping Mode Performance
- Delivery Status
- Late Delivery by Market
- Late Delivery by Region
- Monthly Delivery Performance

---

# 📌 Key Insights

## Executive Overview

- Generated **$33.05M** in total revenue.
- Total profit reached **$3.97M**.
- Processed over **65K orders**.
- Average order value is **$502.71**.
- Late delivery rate is **54.83%**, indicating room for logistics improvement.

---

## Sales & Customer Analytics

- Consumer customers generate the highest revenue.
- A few products contribute significantly to total sales.
- Revenue is concentrated in a small number of countries.
- Product categories contribute unevenly to overall revenue.

---

## Logistics & Delivery

- Same Day shipping is the fastest shipping mode.
- Standard Class requires the longest delivery time.
- More than half of shipments are delivered late.
- Delivery performance is similar across markets, suggesting organization-wide logistics improvements are needed.

---

# 💡 Business Recommendations

- Improve logistics operations to reduce late deliveries.
- Prioritize inventory for top-selling products.
- Expand customer loyalty initiatives for Consumer customers.
- Optimize low-performing product categories.
- Increase investment in high-performing markets.
- Continuously monitor shipping KPIs using Power BI dashboards.

---

# 🚀 Skills Demonstrated

- Data Cleaning
- Data Wrangling
- Feature Engineering
- Exploratory Data Analysis
- SQL Query Writing
- Business Analytics
- Dashboard Design
- Data Visualization
- Business Storytelling
- Supply Chain Analytics
- Inventory Analytics

---

# 📂 Repository Structure

```
Supply-Chain-Analytics/
│
├── raw data/
│   ├── row file 1
│   ├── raw file 2
│   └── raw file 3
│
├── notebooks/
│   ├── analysing_Data.ipynb
│   ├── feature extracting.ipynb
│   ├── EDA.ipynb
│   └── Exporting_data_in_postgresql.ipynb
├── Clean Data/
│   └── clean data
│   └── feature extracted data
│
├── sql/
│   └── supply_chain_bussiness_analysis.sql
│
├── report & dashboard/
│
│   ├── Dashboard.pbix
│   ├── Report.pdf
│
│
├── images/
│
├── README.md
│
└── requirements.txt
```

---

# 📷 Dashboard Preview



### Executive Overview

`images/executive_overview.png`

### Sales & Customer Analytics

`images/sales_customer_analytics.png`

### Logistics & Delivery Performance

`images/logistics_dashboard.png`

---

# ⭐ Future Improvements

- Demand Forecasting using Machine Learning
- Inventory Optimization Models
- Customer Lifetime Value (CLV)
- ABC Inventory Classification
- Geographic Sales Analysis
- Real-Time Dashboard Integration

---

# 👨‍💻 Author

**Mohit Jangra**

B.Tech (Computer Science & Engineering – Data Science)


## ⭐ If you found this project useful, consider giving it a star!
