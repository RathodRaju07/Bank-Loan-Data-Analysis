USE [Bank Lone DB];
GO
SELECT name from sys.databases;

select * from bank_lone_data;
select count (ID) as Total_Lone_Applications FROM bank_lone_data;

SELECT COUNT(ID) AS MTD_Total_Loan_Applications
FROM dbo.bank_lone_data
WHERE MONTH(issue_date) = 12
  AND YEAR(issue_date) = 2021;


SELECT SUM (loan_amount) AS MTD_Total_Funded_Amount FROM dbo.bank_lone_data;


SELECT SUM(loan_amount) AS MTD_Total_Funded_Amount
FROM dbo.bank_lone_data
WHERE MONTH(issue_date) = 12
  AND YEAR(issue_date) = 2021;

  SELECT SUM(loan_amount) AS PMTD_Total_Funded_Amount
FROM dbo.bank_lone_data
WHERE MONTH(issue_date) = 11
  AND YEAR(issue_date) = 2021;

 
 SELECT SUM(total_payment) AS MTD_Total_Amount_Received FROM dbo.bank_lone_data
 WHERE MONTH (issue_date) = 12 AND YEAR (issue_date) = 2021;

 SELECT SUM(total_payment) AS PMTD_Total_Amount_Received FROM dbo.bank_lone_data
 WHERE MONTH (issue_date) = 11 AND YEAR (issue_date) = 2021;

 select ROUND(avg(int_rate),4) *100 AS AVG_Interast_Rate from dbo.bank_lone_data;

 select ROUND(avg(int_rate),4) *100 AS MTD_AVG_Interast_Rate from dbo.bank_lone_data
 where month(issue_date) = 12 AND YEAR (issue_date) =2021;

  select ROUND(avg(int_rate),4) *100 AS PMTD_AVG_Interast_Rate from dbo.bank_lone_data
 where month(issue_date) = 11 AND YEAR (issue_date) =2021;

 select round (avg(dti),4) *100 AS MTD_Avg_DTI from dbo.bank_lone_data
 where month(issue_date) = 12 and year (issue_date) = 2021;

  select round (avg(dti),4) *100 AS PMTD_Avg_DTI from dbo.bank_lone_data
 where month(issue_date) = 11 and year (issue_date) = 2021;


 select
       (count(case when loan_status = 'Fully Paid' OR loan_status = 'current' then id end) *100)
       /
       count(id) AS Good_lone_percentage
       from dbo.bank_lone_data;

       select count (id) AS Good_loan_application from dbo.bank_lone_data
       where loan_status = 'Fully Paid' OR loan_status = 'Current';


 select sum (loan_amount) AS Good_loan_Funded_Amount from dbo.bank_lone_data
  where loan_status = 'Fully Paid' OR loan_status = 'Current';


  select sum (total_payment) AS Good_loan_Recieved_Amount from dbo.bank_lone_data
  where loan_status = 'Fully Paid' OR loan_status = 'Current';


  select 
      (count (case when loan_status = 'Charged off ' then id end) *100.0) /
      count(id) AS Bad_Loan_percentage
      from dbo.bank_lone_data;

      select count (id) AS Bad_loan_applications from dbo.bank_lone_data
      where loan_status = 'charged off';

 select sum (loan_amount) AS Bad_loan_Funded_amount from dbo.bank_lone_data
 where loan_status = 'charged off';

  select sum (total_payment) AS Bad_loan_amount_recieved from dbo.bank_lone_data
   where loan_status = 'charged off';



SELECT 
    loan_status,
    COUNT(id) AS Total_loan_application,
    SUM(total_payment) AS Total_Payment,
    SUM(loan_amount) AS Total_Loan_Amount,
    AVG(int_rate) * 100 AS Avg_Int_Rate_Percent,
    AVG(dti) * 100 AS Avg_DTI_Percent
FROM dbo.bank_lone_data
GROUP BY loan_status;


SELECT 
	loan_status, 
	SUM(total_payment) AS MTD_Total_Amount_Received, 
	SUM(loan_amount) AS MTD_Total_Funded_Amount 
FROM dbo.bank_lone_data
WHERE MONTH(issue_date) = 12 
GROUP BY loan_status;

SELECT 
	MONTH(issue_date) AS Month_Munber, 
	DATENAME(MONTH, issue_date) AS Month_name, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM dbo.bank_lone_data
GROUP BY MONTH(issue_date), DATENAME(MONTH, issue_date)
ORDER BY MONTH(issue_date)



SELECT 
	address_state AS State, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM dbo.bank_lone_data
GROUP BY address_state
ORDER BY address_state


select 
     address_state,
	 count (id) as Total_loan_application,
	 sum(loan_amount) as Total_Funded_Amount,
	 sum(total_payment) as Total_recived_amount
	 from dbo.bank_lone_data
	 group by address_state
	 order by count(id) desc;


SELECT 
	term AS Term, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM dbo.bank_lone_data
GROUP BY term
ORDER BY term


SELECT 
	emp_length AS Employee_Length, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM dbo.bank_lone_data
GROUP BY emp_length
ORDER BY emp_length


SELECT 
	purpose AS PURPOSE, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM dbo.bank_lone_data
GROUP BY purpose
ORDER BY purpose



SELECT 
	home_ownership AS Home_Ownership, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM dbo.bank_lone_data
GROUP BY home_ownership
ORDER BY home_ownership


SELECT
	purpose AS PURPOSE, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM dbo.bank_lone_data
WHERE grade = 'A' and address_state = 'CA'
GROUP BY purpose 
ORDER BY purpose






