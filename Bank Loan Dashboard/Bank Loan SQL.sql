Use PowerBiReports

select * from bank_loan_data

--Total Loan Application 
Select count(id) as Total_Loan_Application from bank_loan_data

-- MTD Loan Applications
SELECT COUNT(id) AS MTD_Total_Applications FROM bank_loan_data
WHERE Month(issue_date) =12 and YEAR(issue_date)=2021

--PMTD Loan Applications
SELECT COUNT(id) AS PMTDTotal_Applications FROM bank_loan_data
WHERE MONTH(issue_date) = 11 and year(issue_date)=2021

--- Total Funded Amount
SELECT SUM(loan_amount) AS Total_Funded_Amount FROM bank_loan_data

-- MTD Total Funded Amount
SELECT SUM(loan_amount) AS Total_Funded_Amount FROM bank_loan_data
WHERE MONTH(issue_date) = 12 AND  year(issue_date)=2021

-- PMTD Total Funded Amount
SELECT SUM(loan_amount) AS Total_Funded_Amount FROM bank_loan_data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date)=2021

-- Total Amount Received
SELECT SUM(total_payment) AS Total_Amount_Collected FROM bank_loan_data

-- MTD Total Amount Received

SELECT SUM(total_payment) AS Total_Funded_Amount FROM bank_loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date)=2021

-- PMTD total Amount 
SELECT SUM(total_payment) AS Total_Funded_Amount FROM bank_loan_data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date)=2021

-- Average Interest Rate
SELECT AVG(int_rate)*100 AS Avg_Int_Rate FROM bank_loan_data

-- MTD Average Interest
SELECT AVG(int_rate)*100 AS MTD_Avg_Int_Rate FROM bank_loan_data
WHERE MONTH(issue_date) = 12 and YEAR(issue_date)=2021

-- PMTD Average Interest
SELECT AVG(int_rate)*100 AS PMTD_Avg_Int_Rate FROM bank_loan_data
WHERE MONTH(issue_date) = 11 and YEAR(issue_date)=2021


--vg DTI
SELECT AVG(dti)*100 AS Avg_DTI FROM bank_loan_data

--MTD Avg DTI
SELECT AVG(dti)*100 AS MTD_Avg_DTI FROM bank_loan_data
WHERE MONTH(issue_date) = 12 and YEAR(issue_date)=2021

-- PMTD Avg DTI
SELECT AVG(dti)*100 AS PMTD_Avg_DTI FROM bank_loan_data
WHERE MONTH(issue_date) = 11 and YEAR(issue_date)=2021

