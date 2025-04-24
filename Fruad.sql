SELECT*FROM users
SELECT*FROM cards
SELECT*FROM transactions
SELECT*FROM transaction_insights
SELECT*FROM security_features


/*
Fraud by location
*/
SELECT 
    u.location,
	COUNT(t.transaction_id)AS total_transaction,
	SUM(t.fraud_label)AS fraud_count,
	ROUND(SUM(t.fraud_label)::DECIMAL/COUNT(t.transaction_id)*100,2) AS Fraud_percent
FROM transactions t
JOIN users u ON u.user_id = t.user_id
GROUP BY u.location
ORDER BY Fraud_percent DESC



/*
Fraud detection by card type
*/
SELECT
      c.card_type,
	  t.transaction_type,
      COUNT(u.user_id) AS user_count,
	  SUM(i.avg_transaction_amount_7D)AS transaction_amount_7D,
	  SUM(u.previous_fraudulent_activity) AS fraud_count
FROM users u
JOIN cards c ON c.user_id = u.user_id
JOIN transactions t ON t.user_id = u.user_id
JOIN transaction_insights i ON i.user_id = u.user_id
GROUP BY c.card_type,t.transaction_type
ORDER BY user_count 


/*
Monthly fraud trends
*/
SELECT 
    TO_CHAR(datetime, 'YYYY-MON') AS month,
    COUNT(*) AS total_transaction,
    SUM(fraud_label) AS total_frauds
FROM transactions 
GROUP BY month
ORDER BY total_frauds DESC


/*
Fraud detection by authentication method
*/
SELECT 
    s.authentication_method,
    ROUND(AVG(s.risk_score)::NUMERIC,3) AS Avg_Risk,
    SUM(CASE WHEN t.fraud_label = 1 THEN 1 ELSE 0 END) AS Fraud_Count
FROM security_features s
JOIN transactions t ON s.transaction_ID = t.transaction_ID
GROUP BY s.authentication_method
ORDER BY Avg_Risk DESC


/*
Top 5 high_risky transaction
*/
WITH risky_transaction AS (
    SELECT 
        t.transaction_id,
		s.authentication_method,
        t.transaction_amount,
        s.risk_score,
        t.fraud_label
    FROM transactions t
    JOIN security_features s ON t.transaction_id = s.transaction_id
	WHERE t.fraud_label = 1
	ORDER BY s.risk_score DESC
)
SELECT * 
FROM risky_transaction
LIMIT 5


/*
Weekend vs Weekday fraud
*/

SELECT 
    s.is_weekend,
    COUNT(*) AS Total_Transactions,
    SUM(t.fraud_label) AS Fraud_Count,
    ROUND(SUM(t.fraud_label)::NUMERIC / COUNT(*) * 100, 2) AS Fraud_Rate
FROM transactions t
JOIN security_features s ON t.transaction_id = s.transaction_id
GROUP BY is_weekend


SELECT 
     card_type,COUNT(*) AS card_count
FROM cards
GROUP BY card_type


