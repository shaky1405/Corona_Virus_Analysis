--Q1. write a code to Check Null values.

Select * from Corona_Virus
where Province is nuul or
Country is null or
Longitude is null or
Latitude is null or
Confirmed is null or
Deaths is null or
Recovered is null;

--Q2. If NULL values are present, update tehm with zeroes for all columns.

update Corona_Virus
set Province = COALESCE(Province, ''),
Country = COALESCE(Country, ''),
Latitude = COALESCE(Latitude, 0),
Longitude = COALESCE(Longitude, 0),
Confirmed = COALESCE(Confirmed, 0),
Recovered = COALESCE(Recovered, 0),
Deaths = COALESCE(Deaths, 0);

--Q3. Check total number of rows.

select count(*) from Corona_Virus;

--Q4. Check what isn start_date and end_date.
--start_date
select date from Corona_Virus
Order by date
limit 1;

--end_date
select date from Corona_Virus
Order by date desc
limit 1;

--Q5. Number of months present in dataset.
select Extract(month from date) as number_of_months
from Corona_virus
Group by Extract(month from date)
Order by number_of_months;

--Q6. Find monthly average for Confirmed, deaths, recovered. 
select Extract(month from date) as months,
Avg(Confirmed) as avg_confirmed,
Avg(Deaths) as avg_deaths,
Avg(Recovered) as avg_recovered
from Corona_virus
Group by Extract(month from date)
Order by months;

--Q7. Find most frequently for Confirmed, deaths, recovered each month. 
select Extract(month from date) as months,
Max(Confirmed) as most_frequent_confirmed,
Max(Deaths) as most_frequent_deaths,
Max(Recovered) as most_frequent_recovered
from Corona_virus
Group by Extract(month from date)
Order by months;

--Q8. Find minimum for Confirmed, deaths, recovered per year. 
select Extract(year from date) as years,
Min(Confirmed) as min_confirmed,
Min(Deaths) as min_deaths,
Min(Recovered) as min_recovered
from Corona_virus
Group by Extract(year from date)
Order by years;

--Q9. Find maximum for Confirmed, deaths, recovered per year. 
select Extract(year from date) as years,
Max(Confirmed) as max_confirmed,
Max(Deaths) as max_deaths,
Max(Recovered) as max_recovered
from Corona_virus
Group by Extract(year from date)
Order by years;

--Q10. Find total number of case for Confirmed, deaths, recovered for each month. 
select Extract(month from date) as months,
Count(Confirmed) as total_confirmed,
Count(Deaths) as total_deaths,
Count(Recovered) as total_recovered
from Corona_virus
Group by Extract(month from date)
Order by months;

--Q.11 Check how corona virus spread outh with respect to confirmed, deaths, recovered.
--  (Eg. total confirmed cases, their average, variance $ STDEV)

Select Count (Confirmed) as total_confirmed_cases,
Avg(Confirmed) as avg_confirmed_cases,
variance (Confirmed) as variance_confirmed,
stddev(Confirmed) as stddev_confirmed
from Corona_Virus;

--Q12. Check how corona virus spread out with respect to deaths deaths cases per months.
--  (Eg. total confirmed cases, their average, variance $ STDEV)

Select Extract(month from date) as months,
Count (Deaths) as total_death_cases,
Avg(Deaths) as avg_death_cases,
variance (Deaths) as variance_deaths,
stddev (Deaths) as stddev_deaths
from Corona_Virus
Group by Extract (month from date)
Order by months;

--Q13. Check how corona virus spread out with respect to recovered deaths cases per months.
--  (Eg. total confirmed cases, their average, variance $ STDEV)

Select Count (Recovered) as total_recovered_cases,
Avg(Recovered) as avg_Recovered_cases,
variance(Recovered) as variance_recovered,
stddev(Recovered) as stddev_recovered
from Corona_Virus;

--Q14. Find country having highest number of the Confirmed cases. 

Select Country, Max(confirmed) as highest_confirmed_cases
from Corona_Virus
Group by Country
Order by highest_confirmed_cases desc
limit 1;

--Q15. Find country having lowest number of the death cases. 

Select Country, Min(Deaths) as lowest_death_cases
from Corona_Virus
Group by Country
Order by lowest_death_cases desc

--Q16. Find top 5 country having highest recovered cases. 

Select Country, Max(Recovered) as highest_recovered_cases
from Corona_Virus
Group by Country
Order by highest_recovered_cases desc
limit 5;
