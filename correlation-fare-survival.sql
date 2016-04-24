select sum(((Survived - mean_Survival)/stddev_Survival) * 
((Fare - mean_Fare)/stddev_Fare))/count(*) Correlation_Coefficient
from (select PassengerId, Survived, Fare,
(select avg(Survived) from train) mean_Survival,
(select stddev(Survived) from train) stddev_Survival,
(select avg(Fare) from train) mean_Fare,
(select stddev(Fare) from train) stddev_Fare
from train y Group by PassengerId) t;
