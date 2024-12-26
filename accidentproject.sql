use projects;
select * from accident;
select * from vehicle;

select
    Area, 
    count(AccidentIndex) as 'total accident'
from 
    accident
group by
    Area;
    
select
    Day, 
    count(AccidentIndex) as 'total accident'
from 
    accident
group by
    day
order by
    'total accident' DESC;
    
select 
     VehicleType,
     count(AccidentIndex) as 'total accident',
     avg (AgeVehicle)
from
    vehicle
where
    (AgeVehicle) is not null
group by
     VehicleType
order by
     'total accident' DESC;
    
    
select
	agegroup,
	count(AccidentIndex) as 'total accident',
    avg(AgeVehicle) as 'average year'
from(
    select
    AccidentIndex,
    AgeVehicle,
    case 
       when AgeVehicle between 0 and 5 then 'new'
	   when AgeVehicle between 6 and 10 then 'regular'
       else 'old'
       end as 'agegroup'
	from
       vehicle
)as subquery
group by
     agegroup;
     
select 
     WeatherConditions,
     count(Severity) as 'total accident'
from
     accident
group by
     WeatherConditions
order by
     'total accident' DESC;
     

select
     LeftHand,
     count(AccidentIndex) as 'total accident'
from
    vehicle
group by
    LeftHand
having
    LeftHand is not null;
    
    
select 
    V.JourneyPurpose,
    count(A.Severity) as 'total accident',
    case
       when count(A.Severity) between 0 and 1000 then 'low'
       when count(A.Severity) between 1001 and 3000 then 'moderate'
       else 'high'
       end as 'level'
from
    accident A
join
    vehicle V on V.AccidentIndex = A.AccidentIndex
group by
    V.JourneyPurpose
order by
    'total accident' DESC;
    
    
select 
    A.LightConditions,
    V.PointImpact,
    avg(V.AgeVehicle) as 'average year'
from
    accident A
join
    vehicle V on v.AccidentIndex = A.AccidentIndex
group by
    A.LightConditions,  V.PointImpact
