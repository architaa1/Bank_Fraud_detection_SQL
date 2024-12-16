use bank;

CREATE TABLE transactions (
step INT,
type VARCHAR(20),
amount DECIMAL (15,2),
nameOrig VARCHAR (20),
oldbalanceOrg DECIMAL (15,2),
newbalanceOrig DECIMAL (15,2),
nameDest VARCHAR(20),
oldbalanceDest DECIMAL (15,2),
newbalanceDest DECIMAL (15,2),
isFraud TINYINT,
isFlaggedFraud TINYINT
);

select * from transactions;

-- 1. Detecting Recursive Fraudulent Transactions

WITH RECURSIVE fraud_chain AS (
    -- Anchor query: initial fraudulent transactions
    SELECT 
        nameOrig AS initial_account,
        nameDest AS next_account,
        step,
        amount,
        newbalanceorig
    FROM 
        transactions
    WHERE 
        isFraud = 1 
        AND type = 'TRANSFER'

    UNION ALL

    -- Recursive query: extending the fraud chain
    SELECT 
        fc.initial_account,
        t.nameDest,
        t.step,
        t.amount,
        t.newbalanceorig
    FROM 
        fraud_chain fc
    JOIN 
        transactions t
    ON 
        fc.next_account = t.nameOrig
        AND fc.step < t.step
    WHERE 
        t.isFraud = 1 
        AND t.type = 'TRANSFER'
)
-- Select from the recursive CTE to see the result
SELECT * FROM fraud_chain;


SELECT * FROM fraud_chain;

-- 2. Use a CTE to calculate the rolling sum of fraudulent transactions for each account over the last 5 steps.


with rolling_fraud as ( SELECT nameorig,step, 
SUM(isfraud) OVER (PARTITION BY nameOrig order by STEP ROWS BETWEEN 4 PRECEDING and CURRENT ROW ) as fraud_rolling
FROM transactions)

SELECT * FROM rolling_fraud
WHERE fraud_rolling > 0 ;

-- 3. Complex Fraud Detection Using Multiple CTEs
-- Question:
-- Use multiple CTEs to identify accounts with suspicious activity, including large transfers, consecutive transactions without balance change, and flagged transactions.

WITH large_transfers as (
SELECT nameOrig,step,amount FROM transactions WHERE type = 'TRANSFER' and amount >500000),
no_balance_change as (
SELECT nameOrig,step,oldbalanceOrg,newbalanceOrig FROM transactions where oldbalanceOrg=newbalanceOrig),
flagged_transactions as (
SELECT nameOrig,step FROM transactions where  isflaggedfraud = 1) 

SELECT 
    lt.nameOrig
FROM 
    large_transfers lt
JOIN 
    no_balance_change nbc ON lt.nameOrig = nbc.nameOrig AND lt.step = nbc.step
JOIN 
    flagged_transactions ft ON lt.nameOrig = ft.nameOrig AND lt.step = ft.step;


-- 4. Write me a query that checks if the computed new_updated_Balance is the same as the actual newbalanceDest in the table. If they are equal, it returns those rows.

with CTE as (
SELECT amount,nameorig,oldbalancedest,newbalanceDest,(amount+oldbalancedest) as new_updated_Balance 
FROM transactions
)
SELECT * FROM CTE where new_updated_Balance = newbalanceDest;

