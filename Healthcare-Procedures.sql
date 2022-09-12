-- How many different types of procedures did we perform in 2019?

select
  description,
  count(*) as total_procs
from Healthcare.procedures
where DATE >= "2019-01-01"
  and DATE < "2020-01-01"
group by DESCRIPTION
order by total_procs desc;

-- How many procedures were performed across each care setting (inpatient/ambulatory)?

select
  enc.ENCOUNTERCLASS,
  count(*) as total_procs_for_class
from Healthcare.procedures procs
join Healthcare.encounters enc on procs.ENCOUNTER = enc.ID
where DATE >= "2019-01-01"
  and DATE < "2020-01-01"
group by enc.ENCOUNTERCLASS;

-- Which organization performed the most inpatient procedures in 2019?

select
enc.ORGANIZATION,
count(*) as total_procs
from Healthcare.procedures procs
join Healthcare.encounters enc on procs.ENCOUNTER = enc.ID
join Healthcare.organizations org on enc.ORGANIZATION = org.Id
where DATE >= "2019-01-01"
  and DATE < "2020-01-01"
  and enc.ENCOUNTERCLASS = "inpatient"
group by enc.ORGANIZATION
order by total_procs desc







