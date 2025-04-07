# 🏦 Bank Fraud Detection using SQL
DATASET LINK:-
https://www.kaggle.com/datasets/ealaxi/paysim1


This project focuses on detecting fraudulent transactions in a bank using structured query language (SQL). Using a transactional dataset, we perform comprehensive exploratory data analysis (EDA), apply fraud detection logic, and generate actionable insights.

## 📁 Dataset

The dataset contains details of banking transactions, including:

- `step`: Time step (in hours) from the start of the data collection
- `type`: Type of transaction (e.g., CASH_OUT, TRANSFER, etc.)
- `amount`: Amount involved in the transaction
- `nameOrig`: Customer ID of sender
- `oldbalanceOrg`: Initial balance of sender
- `newbalanceOrig`: Final balance of sender
- `nameDest`: Customer ID of receiver
- `oldbalanceDest`: Initial balance of receiver
- `newbalanceDest`: Final balance of receiver
- `isFraud`: Whether the transaction is fraudulent (1) or not (0)

> 📌 The dataset used is publicly available for educational purposes.

## 📊 Objective

- Identify fraudulent transactions using SQL queries.
- Understand transactional patterns and behavior of fraud.
- Derive insights into common fraud schemes.

## ⚙️ Tools Used

- **SQL** (MySQL / PostgreSQL compatible syntax)
- **DBMS**: MySQL Workbench / pgAdmin / any relational DB tool
- **Excel** or CSV viewer for preliminary data checks

## 📌 Key SQL Operations

- Data cleaning and formatting
- Filtering fraudulent transactions
- Analyzing transaction types prone to fraud
- Grouping and aggregating transactions by time, user, or type
- Creating fraud detection flags based on business logic

## 📂 Repository Structure
Bank_Fraud_detection_SQL/ │ 
├── Bank_fraud_detection.sql # Main SQL script containing queries and logic 

├── Dataset.csv # Transaction dataset used for analysis 

└── README.md # Project documentation


## ✅ Highlights

- Focuses on `CASH_OUT` and `TRANSFER` types, which are most vulnerable to fraud.
- Applies logical checks to identify suspicious patterns, such as:
  - Sender’s balance not reducing as expected
  - Receiver's balance not increasing
  - High-value transfers in short time frames
- Uses SQL `CASE`, `JOIN`, `GROUP BY`, `ORDER BY`, and `WINDOW FUNCTIONS` where applicable.

## 📈 Sample Insights

- Majority of frauds are seen in `TRANSFER` and `CASH_OUT` types.
- Fraudulent transactions often have inconsistencies in balance updates.
- Certain accounts appear repeatedly as fraud destinations.

## 🧠 Learning Outcomes

- Hands-on experience with SQL for data analysis.
- Fraud pattern identification through transactional data.
- Strengthened logic-building in SQL query writing.

## 🏁 Future Improvements

- Integration with Python or Power BI for visualization.
- Building a fraud scoring model.
- Automating alerts for suspicious patterns.

## 📬 Contact

For any queries or feedback:

**Archita Sinha**  
📧 [architasinha8434@gmail.com]  
🔗 [LinkedIn]([https://linkedin.com/in/yourprofile](https://www.linkedin.com/in/archita-sinha-77161925a/)) 

---

⭐ If you found this project helpful, consider giving it a star!


