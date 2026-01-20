SELECT * FROM bank_transaction.bank_transactions_dataset;

DESCRIBE bank_transaction_dataset;

USE bank_transaction;

-- Matching total records of the dataset
SELECT COUNT(*) AS total_records
FROM bank_transactions_dataset;

-- Summary of the bank_transaction data
SELECT 
  MIN(TransactionAmount) AS min_transaction,
  MAX(TransactionAmount) AS max_transaction,
  AVG(TransactionAmount) AS avg_transaction
FROM bank_transactions_dataset;

-- Filter from the records, where transaction type is Credit through ATM of the Customer who's Age is greater than 70
SELECT * FROM bank_transactions_dataset WHERE TransactionType = "Credit" AND Channel = "ATM" AND CustomerAge > 70;

-- Filter from the records, which location has TransactionAmount greater than 1000
SELECT * FROM bank_transactions_dataset Having TransactionAmount > 1000 
ORDER BY Location DESC
LIMIT 10;

--  Summary of Average of Customer's Age and sum of their Transaction Amount according to their Occupation and Transaction Type
SELECT CustomerOccupation, TransactionType,  
AVG(CustomerAge) AS Average_CustomerAge, 
SUM(TransactionAmount) AS sum_transaction
FROM bank_transactions_dataset
GROUP BY CustomerOccupation, TransactionType;

-- Summary of the AccountID who's online login attempts > 20 with Location-wise
SELECT Location,
SUM(LoginAttempts) AS Total_Login_Attempts
FROM bank_transactions_dataset
WHERE Channel = "Online"
GROUP BY Location
HAVING SUM(LoginAttempts) > 20;

--  Summary Report of the total transactions
SELECT TransactionID, CustomerOccupation, TransactionType,  
AVG(CustomerAge) AS Average_CustomerAge, 
SUM(TransactionAmount) AS sum_transaction
FROM bank_transactions_dataset
GROUP BY TransactionID, CustomerOccupation, TransactionType;


-- Between 
SELECT * FROM bank_transactions_dataset WHERE TransactionDate BETWEEN '10-05-2023' AND '10-07-2023';

-- Like
SELECT * FROM bank_transactions_dataset WHERE AccountID LIKE '%AC00302%';

