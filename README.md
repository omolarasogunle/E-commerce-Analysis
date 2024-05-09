 # E-commerce-Analysis

 ## Table of Contents

 - [Project Overview](#project-overview)
 - [Data Sources](#data-sources)
 - [Recommendations](#recommendations)

### Project Overview

This data analysis project is the engine behind our online retail insights. It consolidates sales, customer, and marketing data for quick analysis, enabling informed decisions to improve customer experiences and drive growth.

### Data Sources

- Customers Dataset: The dataset which is the "customers.csv" file, contains information about the customers who have interacted with the e-commerce platform. It includes details such as customer IDs, names, contact information, demographics, and possibly past purchase history.
- Orders Dataset: The dataset which is the "orders.csv" file, tracks each transaction made on the platform. It includes data such as order IDs, timestamps, customer IDs, and details about the purchased items, such as product IDs, quantities, and prices.
- Transactions Dataset: The dataset which is the "transaction.csv" file, provides detailed information about each transaction conducted by customers. It typically includes data on payment methods, transaction IDs, payment amounts, and possibly additional transaction-specific details.
- Products Dataset: The dataset which is the "products.csv" file, contains information about the products available on the e-commerce platform. It includes details such as product IDs, names, descriptions, categories, prices, and possibly inventory levels.

### Tools

- Excel - Data Cleaning
- MySQL - Data Analysis
- PowerBi - Creating reports

### Data Cleaning/Preparation

In the initail data preparation phase, the following tasks were performed:
1. Data loading and inspection.
2. Handling missing values.
3. Data cleaning and formatting.

### Exploratory Data Analysis

EDA involves exploring the customers, oders, transactions and products data to answer key questions, such as:

- what is the total revenue?
- identify the most valuable customer?
- identify the peak sales periods?

### Data Analysis

This includes some interesting code/features worked with

```sql
SELECT * FROM table1
WHERE cond = 10;


### Results/Findings

The analysis results are summarized as follows:
1. The company's total revenue have been steadily increasing over time, with a noticeable margin.
2. Product "in" is the most valuable product name in terms of transaction and revenue.
3. Customer segments with high lifetime value should be targeted for marketing efforts.

### Recommendations

- Optimize product offerings.
- Improve customer support.
- Implement loyalty programs.
- Invest in marketing strategies.

