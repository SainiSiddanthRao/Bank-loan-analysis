	use bankanalysis;
select count(*) from `copy of finance_1`;

#KPI 1

select year(issue_d) as year_of_issue_d , sum(loan_amnt) as total_loan_amnt
from  `copy of finance_1`
group by Year_of_issue_d
order by year_of_issue_d ;

#KPI 2
select
grade , sub_grade , sum(revol_bal) as total_revol_bal
from `copy of finance_1` inner join `copy of finance_2` on(`copy of finance_1`.id = `copy of finance_2`.id) group by grade , sub_grade order by grade , sub_grade ;

#KPI 3

select verification_status , 
concat("$" , format(round(sum(total_pymnt)/1000000,2),2), "M") as total_payment from `copy of finance_1` inner join `copy of finance_2` on(`copy of finance_1`.id = `copy of finance_2`.id) 
group by verification_status ;


#KPI 4

select addr_state , last_Credit_pull_D , loan_status
from `copy of finance_1` inner join `copy of finance_2`
on(`copy of finance_1`.id = `copy of finance_2`.id)
group by addr_state , last_Credit_pull_D , loan_status
order by last_credit_pull_D ;


# KPI 5

select home_ownership , (last_pymnt_d) ,
concat('$' , format(round(sum(last_pymnt_amnt) / 10000 , 2), 2),'K') as total_amount
 from `copy of finance_1` inner join `copy of finance_2` on(`copy of finance_1`.id = `copy of finance_2`.id)
 group by home_ownership , last_pymnt_d
 order by last_pymnt_d desc, home_ownership desc;