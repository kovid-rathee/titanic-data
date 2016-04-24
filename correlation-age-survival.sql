select sum(((Survived - mean_Survival)/stddev_Survival) * 
((age - mean_age)/stddev_age))/count(*) Correlation_Coefficient
from (select PassengerId, Survived, age,
(select avg(Survived) from train) mean_Survival,
(select stddev(Survived) from train) stddev_Survival,
(select avg(age) from train) mean_age,
(select stddev(age) from train) stddev_age
from train y Group by PassengerId) t;
