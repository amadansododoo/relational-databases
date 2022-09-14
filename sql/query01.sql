-- Retrieve the state with the median number of
-- employees in 'Education Services'
-- 1.1 marks: < 10 operators
-- 1.0 marks: < 11 operators
-- 0.8 marks: correct answer

-- Replace this comment line with the actual query

select State.`abbr`, sum(CountyIndustries.`employees`) as `TotalEmployees` 
from `CountyIndustries`
join `County` on County.`fips` = CountyIndustries.`county`
join `State` on State.`id` = County.`state`
join `Industry` on Industry.`id` = CountyIndustries.`industry`
and Industry.`name` = 'Educational Services'
group by County.`state`
order by sum(CountyIndustries.`employees`) asc 
limit 1 offset 25;
