-- Volumes
-- How many encounters did we have in 2019?
select count(*) from Healthcare.encounters
where START >= "2019-01-01"
and START < "2020-01-01"

-- How many distinct patients did we treat in 2019?
SELECT count(distinct PATIENT) from Healthcare.encounters
where START >= "2019-01-01"
and START < "2020-01-01"

-- How many inpatient encounters did we have in 2019?
select count(*) from Healthcare.encounters
where START >= "2019-01-01"
and START < "2020-01-01"
and ENCOUNTERCLASS = "inpatient"

-- How many ambulatory encounters did we have in 2019?
select count(*) from Healthcare.encounters
where START >= "2019-01-01"
and START < "2020-01-01"
and ENCOUNTERCLASS = "ambulatory"