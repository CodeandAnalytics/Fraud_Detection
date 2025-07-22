SELECT*FROM users
SELECT*FROM cards
SELECT*FROM transactions
SELECT*FROM transaction_insights
SELECT*FROM security_features

	
--Total_transaction,Nonfruadtransaction,Fraudtransaction
	
SELECT 
    COUNT(transaction_id) AS total_transaction,
    SUM(CASE WHEN fraud_label = 0 THEN 1 ELSE 0 END) AS NonFraud_transaction,
    SUM(CASE WHEN fraud_label = 1 THEN 1 ELSE 0 END) AS Fraud_transaction
FROM transactions



--Total_trasaction_Amt vs FraudAmt,NonFraudAmt

SELECT 
       SUM(transaction_amount) AS total_transaction_amt,
       SUM(CASE WHEN fraud_label = 0 THEN transaction_amount ELSE 0 END) AS Nonfraud_transction_amt,
       SUM(CASE WHEN fraud_label = 1 THEN transaction_amount ELSE 0 END) AS Fraud_transaction_amt
 FROM transactions
	

--Total 56 Users affected

SELECT u.user_id,
       t.transaction_id,
       t.transaction_amount,
       t.transaction_type,
       c.card_type,
       u.location
FROM transactions t
JOIN users u ON u.user_id = t.user_id
JOIN cards c ON u.user_id = c.user_id
WHERE t.fraud_label = 1
	   

--Fraud by location

SELECT 
        u.location,
	COUNT(t.transaction_id)AS total_transaction,
	SUM(t.fraud_label)AS fraud_count,
	ROUND(SUM(t.fraud_label)::NUMERIC/COUNT(t.transaction_id)*100,2) AS Fraud_percent
FROM transactions t
JOIN users u ON u.user_id = t.user_id
GROUP BY u.location
ORDER BY Fraud_percent DESC



--Monthly fraud trends

SELECT 
    TO_CHAR(datetime, 'MON-YYYY') AS month,
    COUNT(*) AS total_transaction,
    SUM(fraud_label) AS total_fraud
FROM transactions 
GROUP BY month
ORDER BY total_fraud DESC



--Fraud detection by authentication method

SELECT 
      s.authentication_method,
      ROUND(AVG(s.risk_score)::NUMERIC,3) AS Avg_Risk,
      SUM(CASE WHEN t.fraud_label = 1 THEN 1 ELSE 0 END) AS Fraud_Count
FROM security_features s
JOIN transactions t ON s.transaction_ID = t.transaction_ID
GROUP BY s.authentication_method
ORDER BY Avg_Risk DESC



--Top 5 high_risky transaction

WITH risky_transaction AS (
     SELECT 
           t.transaction_id,
	   c.card_type,
           t.transaction_amount,
           ROUND(s.risk_score :: NUMERIC,2),
           t.fraud_label
        FROM transactions t
        JOIN security_features s ON t.transaction_id = s.transaction_id
	JOIN cards c ON 
	WHERE t.fraud_label = 1
	ORDER BY s.risk_score DESC
)
SELECT * 
FROM risky_transaction
LIMIT 5


--Weekend vs Weekday fraud

SELECT 
    s.is_weekend,
    SUM(t.fraud_label) AS Fraud_Count,
    ROUND(SUM(t.fraud_label)::NUMERIC / COUNT(*) * 100, 2) AS Fraud_Rate
FROM transactions t
JOIN security_features s ON t.transaction_id = s.transaction_id
GROUP BY is_weekend





