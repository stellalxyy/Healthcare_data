-- Patients
-- What is our patient mix by gender, race and ethnicity?
select GENDER, count(*) 
from Healthcare.patients
group by GENDER;

select RACE, count(*) 
from Healthcare.patients
group by RACE;

select ETHNICITY, count(*) 
from Healthcare.patients
group by ETHNICITY;

select GENDER, RACE, ETHNICITY 
from Healthcare.patients
group by GENDER, RACE, ETHNICITY;

-- What about age?
select ID, BIRTHDATE, floor(datediff(curdate(),BIRTHDATE)/365.25) as age
from Healthcare.patients;

-- How many states and zip codes do we treat patients from?
select DISTINCT STATE
from Healthcare.patients;

select DISTINCT ZIP, count(*)
from Healthcare.patients
GROUP BY ZIP;

-- Which state, zip and county do we treat the most patients from?
select DISTINCT COUNTY, count(*)
from Healthcare.patients
GROUP BY COUNTY;

-- What is our patient mix for patients who had an inpatient encounter in 2019?
select GENDER,RACE,ETHNICITY,count(*) as volumes
from Healthcare.encounters ENC
left join Healthcare.patients PAT on ENC.PATIENT=PAT.ID
where START >= "2019-01-01"
and START < "2020-01-01"
and ENCOUNTERCLASS = "inpatient"
GROUP BY GENDER, RACE, ETHNICITY







