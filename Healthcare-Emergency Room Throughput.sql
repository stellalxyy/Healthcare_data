-- How many emergency encounters did we have in 2019?
select count(*) as ER_VOLUMES
from Healthcare.encounters
where START >= "2019-01-01"
and START < "2020-01-01"
and ENCOUNTERCLASS="emergency";

-- What conditions were treated in those encounters?
select CON.DESCRIPTION, count(*) as condition_volumes
from Healthcare.encounters ENC
left join Healthcare.conditions CON on ENC.ID = CON.ENCOUNTER
where ENC.START >= "2019-01-01"
and ENC.START < "2020-01-01"
and ENC.ENCOUNTERCLASS="emergency"
GROUP BY CON.DESCRIPTION;

-- What was the emergency throughput and how did that vary by condition treated?
select throughput.DESCRIPTION,
AVG(THROUGHPUT_IN_MIN) as THR_AVG
from (
  select ENC.ID, CON.DESCRIPTION,
  timestampdiff(minute,ENC.START,ENC.STOP) THROUGHPUT_IN_MIN
  from Healthcare.encounters ENC
  left join Healthcare.conditions CON on ENC.ID=CON.ENCOUNTER
  where ENC.START >= "2019-01-01"
  and ENC.START < "2020-01-01"
  and ENC.ENCOUNTERCLASS="emergency"
) throughput
group by throughput.DESCRIPTION