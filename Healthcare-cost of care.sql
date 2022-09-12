-- What is total claim cost for each encounter in 2019?

select 
  sum(TOTAL_CLAIM_COST) as total_for_2019,
  avg(TOTAL_CLAIM_COST) as avg_for_2019
from Healthcare.encounters
where START >= "2019-01-01"
  and START < "2020-01-01";
  
-- What is total payer coverage for each encounter in 2019?

select 
  sum(TOTAL_CLAIM_COST) as total_claims_for_2019,
  avg(TOTAL_CLAIM_COST) as avg_claims_for_2019,
  sum(PAYER_COVERAGE) as total_payer_coverage_for_2019,
  avg(PAYER_COVERAGE) as avg_payer_coverage_for_2019
from Healthcare.encounters
where START >= "2019-01-01"
  and START < "2020-01-01";
  
-- Which encounter types had the highest cost covered by payers?

select 
  PAYER,
  NAME,
  ENCOUNTERCLASS,
  -- sum(TOTAL_CLAIM_COST) as total_claims_for_2019,
  -- avg(TOTAL_CLAIM_COST) as avg_claims_for_2019,
  -- sum(PAYER_COVERAGE) as total_payer_coverage_for_2019,
  -- avg(PAYER_COVERAGE) as avg_payer_coverage_for_2019
  sum(TOTAL_CLAIM_COST)-sum(PAYER_COVERAGE) as differ_claim_to_payer_cov,
  avg(TOTAL_CLAIM_COST)-avg(PAYER_COVERAGE) as differ_claim_to_payer_cov_avg
from Healthcare.encounters enc
  join Healthcare.payers pay on enc.PAYER = pay.ID
where START >= "2019-01-01"
  and START < "2020-01-01"
group by PAYER, NAME, ENCOUNTERCLASS
order by ENCOUNTERCLASS, differ_claim_to_payer_cov;

  
-- Which encounter types had the highest cost?

select 
  ENCOUNTERCLASS,
  -- sum(TOTAL_CLAIM_COST) as total_claims_for_2019,
  -- avg(TOTAL_CLAIM_COST) as avg_claims_for_2019,
  -- sum(PAYER_COVERAGE) as total_payer_coverage_for_2019,
  -- avg(PAYER_COVERAGE) as avg_payer_coverage_for_2019
  sum(TOTAL_CLAIM_COST)-sum(PAYER_COVERAGE) as differ_claim_to_payer_cov,
  avg(TOTAL_CLAIM_COST)-avg(PAYER_COVERAGE) as differ_claim_to_payer_cov_avg
from Healthcare.encounters enc
where START >= "2019-01-01"
  and START < "2020-01-01"
group by ENCOUNTERCLASS
order by ENCOUNTERCLASS
  
  
  
  
  
  








