Create database finance_loan;
use finance_loan;
select issue_date from financial_loan;

update financial_loan
set issue_date = str_to_date(issue_date,'%d-%m-%Y');

-- KPI's
-- 1 Total Loan Applications
Select Count(id) from financial_loan;

-- MTD Total loan application
select count(id)  from financial_loan
where month(issue_date)=12 and year(issue_date)=2021;

-- MOM total loan application
select count(id)  from financial_loan
where month(issue_date)=11 and year(issue_date)=2021;

-- 2 Total Funded Amount
select sum(loan_amount) from financial_loan;

-- MTD Total funded amount
select sum(loan_amount) from financial_loan
where month(issue_date)=12 and year(issue_date)=2021;

-- MOM total Funded amount
select sum(loan_amount) from financial_loan
where month(issue_date)=11 and year(issue_date)=2021;

-- 3 Total amount received
select sum(total_payment) as total_amount_received from financial_loan;

-- MTD total amount received
select sum(total_payment) as MTD_total_amount_received from financial_loan
where month(issue_date)=12 and year(issue_date)=2021;

-- MOM total amount received
select sum(total_payment) as MOM_total_amount_received from financial_loan
where month(issue_date)=11 and year(issue_date)=2021;

-- 4 average interest rate
select round(avg(int_rate)*100,2) as average_int_rate from financial_loan;

-- Good loan aplication percentage
select 
round(count(
case when loan_status = "Fully Paid" or loan_status ="Current" then id end) * 100/
count(loan_status),2) as good_loan_percentage
from financial_loan;

-- Total good loan application
select count(id) from financial_loan
where loan_status = "Fully Paid" or loan_status="Current";

-- Total good loan funded amount
select sum(loan_amount) from financial_loan
where loan_status = "Fully Paid" or loan_status="Current";

-- Total good loan amount received
select sum(total_payment) from financial_loan
where loan_status = "Fully Paid" or loan_status="Current";

-- total Bad loan application percentage
select 
round(count(
case when loan_status = "charged off" then id end) * 100/
count(loan_status),2) as good_loan_percentage
from financial_loan;

-- Total bad loan application
select count(loan_status) as bad_loan_application from financial_loan
where loan_status="charged off";

-- bad loan funded amount
select sum(loan_amount) as bad_loan_funded_amount from financial_loan
where loan_status="charged off";

-- bad loan amount received
select sum(total_payment) as bad_loan_funded_amount from financial_loan
where loan_status="charged off";

-- find the total loan aplication, total funded amount, total received amount, avg interset rate, avd dti according o loan status
select loan_status,
count(id) as total_loan_application ,
sum(total_payment) as total_amount_received,
sum(loan_amount) as total_funded_amount,
round(avg(dti *100),2) as avg_dti,
round(avg(int_rate*100),2) as avg_interest_rate
from financial_loan
group by loan_status;

-- monthly trends of issue date according funded amount and received amount
select	month(issue_date)as month_number,
monthname(issue_date) as month_name,
sum(loan_amount) as total_funded_amount,
sum(total_payment) as total_amount_received
from financial_loan
group by month(issue_date),monthname(issue_date)
order by month(issue_date);

-- statewise total loan application,amount funded,amount received
select address_state,
count(id) as total_loan_application,
sum(loan_amount) as toal_funded_amount,
sum(total_payment) as total_amount_received
from financial_loan
group by address_state;

-- find the total loan application,amount funded, amount received by term
select term,
count(id) as total_loan_application,
sum(loan_amount) as toal_funded_amount,
sum(total_payment) as total_amount_received
from financial_loan
group by term;

-- by employee lengh
select emp_length,
count(id) as total_loan_application,
sum(loan_amount) as toal_funded_amount,
sum(total_payment) as total_amount_received
from financial_loan
group by emp_length
order by emp_length;

-- by purpose
select purpose,
count(id) as total_loan_application,
sum(loan_amount) as toal_funded_amount,
sum(total_payment) as total_amount_received
from financial_loan
group by purpose;

-- by homeownership
select home_ownership,
count(id) as total_loan_application,
sum(loan_amount) as toal_funded_amount,
sum(total_payment) as total_amount_received
from financial_loan
group by home_ownership;




