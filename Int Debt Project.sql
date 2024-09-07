create database data;

#1. The World Bank's international debt data
#It's not that we humans only take debts to manage our necessities. A country may also take debt to manage its economy. 
#For example, infrastructure spending is one costly ingredient required for a country's citizens to lead comfortable lives. 
#The World Bank is the organization that provides debt to countries.

#In this notebook, we are going to analyze international debt data collected by The World Bank. 
#The dataset contains information about the amount of debt (in USD) owed by developing countries across several categories. 
#We are going to find the answers to questions like:

select * from international_debt limit 10;

#1.What is the total amount of debt that is owed by the countries listed in the dataset?
SELECT SUM(debt) Total_debt
FROM international_debt;

#2.What is the total amount of debt that is owed by the each countries listed in the dataset?
SELECT country_code, country_name, SUM(debt) Total_debt
FROM international_debt
GROUP BY country_code;

#3.Which country owns the maximum amount of debt and what does that amount look like?
SELECT country_code, country_name, SUM(debt) Total_debt
FROM international_debt
GROUP BY country_code
ORDER BY Total_debt DESC
LIMIT 1;

#4.What is the average amount of debt owed by countries across different debt indicators?
SELECT country_code,country_name,AVG(debt) Avg_debt,indicator_name
FROM international_debt
GROUP BY indicator_name;

#5.Finding the number of distinct countries
select count(distinct(country_name)) No_Of_Countries from international_debt;

#6. The highest amount of principal repayments
SELECT country_code, country_name, indicator_name
FROM international_debt
WHERE
    debt = (SELECT MAX(debt)
        FROM international_debt
        WHERE indicator_code = 'DT.AMT.DLXF.CD');

#7. The most common debt indicator
SELECT indicator_name, COUNT(indicator_code) Indicator_Count
FROM international_debt
GROUP BY indicator_code
ORDER BY Indicator_Count DESC
LIMIT 10;

#8.Top 5 Countries with Highest Debt for a Specific Indicator Interest payments on external debt, long-term (INT, current US$) [DT.INT.DLXF.CD]:
SELECT country_code, country_name, indicator_code, debt
FROM international_debt
WHERE indicator_code = 'DT.INT.DLXF.CD'
ORDER BY debt DESC
LIMIT 5;

#9.Debt Breakdown by Indicator for a Specific Country (e.g., Afghanistan):
SELECT country_name, SUM(debt) Total_debt, indicator_name
FROM international_debt
WHERE country_name = 'Afghanistan'
GROUP BY indicator_name
order by Total_debt desc;

#10. Identifying the Largest Debt Indicators Globally
SELECT indicator_code, indicator_name,SUM(debt) Total_debt
FROM international_debt 
group by indicator_name
order by Total_debt desc
limit 5;

#11. Comparing Debt between Two or More Countries
SELECT country_name, indicator_name, debt
FROM international_debt
WHERE country_name IN ('Afghanistan', 'Albania', 'Algeria')
ORDER BY indicator_name, country_name;





































































































































































































