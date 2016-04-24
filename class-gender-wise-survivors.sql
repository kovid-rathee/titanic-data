select 
/* case when round(age) between 0 and 6 then '0 - 6'
     when round(age) between 6 and 12 then '6 - 12'
     when round(age) between 13 and 18 then '12 - 18'
     when round(age) between 19 and 24 then '19 - 24'
     when round(age) between 25 and 34 then '25 - 34'
     when round(age) between 35 and 44 then '35 - 44'
     when round(age) between 45 and 54 then '45 - 54'
     when round(age) between 55 and 64 then '55 - 64'
     when round(age) > 64 then '> 64' 
  end age_group, */
Pclass, 
case when age < 15 then 'Children' 
     when Sex = 'male' then 'Men' 
     when sex = 'female' then 'Women' 
end Category, count(*) total_passengers, sum(Survived) survivors, 
round(100 * sum(Survived)/count(*),2) `% survivors`
/* round(avg(Fare),2) fare */
from train
group by 1, 2 with rollup;
