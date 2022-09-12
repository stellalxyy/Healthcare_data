-- How many patients had documented uncontrolled hypertension at any time in 2018 and 2019?

select
  count(distinct patient) as num_of_patients
from Healthcare.observations
where (
(DESCRIPTION = "Diastolic Blood Pressure" and value > 90)
  or (DESCRIPTION = "Systolic Blood Pressure" and value > 140)
)
  and date >= "2018-01-01"
  and date < "2020-01-01";
  
-- Which providers treated patients with uncontrolled hypertension in 2018 and 2019?

select
  distinct bp.patient,
  pro.NAME,
  pro.SPECIALITY
from Healthcare.observations bp
join Healthcare.encounters enc on bp.PATIENT=enc.PATIENT
  and enc.START >= bp.DATE
join Healthcare.providers pro on enc.provider = pro.Id
where (
(bp.DESCRIPTION = "Diastolic Blood Pressure" and value > 90)
  or (bp.DESCRIPTION = "Systolic Blood Pressure" and value > 140)
)
  and bp.date >= "2018-01-01"
  and bp.date < "2020-01-01";
  
-- What medications were given to patients with uncontrolled hypertension?

select
  distinct bp.patient,
  med.DESCRIPTION as medication
from Healthcare.observations bp
join Healthcare.medications med on bp.PATIENT=med.PATIENT
  and med.START >= bp.DATE
where (
(bp.DESCRIPTION = "Diastolic Blood Pressure" and bp.value > 90)
  or (bp.DESCRIPTION = "Systolic Blood Pressure" and bp.value > 140)
)
  and bp.date >= "2018-01-01"
  and bp.date < "2020-01-01";
  
  
  
  















