/*
Question: What skills are required for the top paying-paying data analyst jobs?
- Use the top 10 highest-paying Data Analyst jobs from first query
- Add the specific skills required for these roles
- Why? It provides a detailed look at which high-paying jobs demand certain skills.
    Helping job seekers understand which skills to develop that align with top salaries
*/

WITH top_paying_jobs AS (
    SELECT
        job_id,
        company_dim.name AS company_name,
        salary_year_avg,
        job_title,
        job_location
    FROM
        job_postings_fact AS jpf
    LEFT JOIN company_dim ON company_dim.company_id = jpf.company_id
    WHERE
        salary_year_avg IS NOT NULL AND
        job_title_short = 'Data Analyst' AND
        job_location = 'Anywhere'
    ORDER BY
        salary_year_avg DESC
    LIMIT 10
)

SELECT 
    top_paying_jobs.*,
    skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON skills_job_dim.job_id = top_paying_jobs.job_id
-- INNER JOIN is used to eliminate job postings with no skill information
LEFT JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
-- LEFT JOIN is used because all skill_id belongs to skill name

/*
Key takeaways from the visual
	•	SQL (100%) dominates — it’s mandatory
	•	Python (~88%) and Tableau (~75%) clearly form the second tier
	•	Snowflake, Excel, Pandas (~35–40%) show analysts are expected to work closer to data infrastructure
	•	Long-tail tools (Azure, Git, Databricks, Hadoop, Spark) appear less often but signal senior / modern analytics stacks

[
  {
    "job_id": 552322,
    "company_name": "AT&T",
    "salary_year_avg": "255829.5",
    "job_title": "Associate Director- Data Insights",
    "job_location": "Anywhere",
    "skills": "sql"
  },
  {
    "job_id": 552322,
    "company_name": "AT&T",
    "salary_year_avg": "255829.5",
    "job_title": "Associate Director- Data Insights",
    "job_location": "Anywhere",
    "skills": "python"
  },
  {
    "job_id": 552322,
    "company_name": "AT&T",
    "salary_year_avg": "255829.5",
    "job_title": "Associate Director- Data Insights",
    "job_location": "Anywhere",
    "skills": "r"
  },
  {
    "job_id": 552322,
    "company_name": "AT&T",
    "salary_year_avg": "255829.5",
    "job_title": "Associate Director- Data Insights",
    "job_location": "Anywhere",
    "skills": "azure"
  },
  {
    "job_id": 552322,
    "company_name": "AT&T",
    "salary_year_avg": "255829.5",
    "job_title": "Associate Director- Data Insights",
    "job_location": "Anywhere",
    "skills": "databricks"
  },
  {
    "job_id": 552322,
    "company_name": "AT&T",
    "salary_year_avg": "255829.5",
    "job_title": "Associate Director- Data Insights",
    "job_location": "Anywhere",
    "skills": "aws"
  },
  {
    "job_id": 552322,
    "company_name": "AT&T",
    "salary_year_avg": "255829.5",
    "job_title": "Associate Director- Data Insights",
    "job_location": "Anywhere",
    "skills": "pandas"
  },
  {
    "job_id": 552322,
    "company_name": "AT&T",
    "salary_year_avg": "255829.5",
    "job_title": "Associate Director- Data Insights",
    "job_location": "Anywhere",
    "skills": "pyspark"
  },
  {
    "job_id": 552322,
    "company_name": "AT&T",
    "salary_year_avg": "255829.5",
    "job_title": "Associate Director- Data Insights",
    "job_location": "Anywhere",
    "skills": "jupyter"
  },
  {
    "job_id": 552322,
    "company_name": "AT&T",
    "salary_year_avg": "255829.5",
    "job_title": "Associate Director- Data Insights",
    "job_location": "Anywhere",
    "skills": "excel"
  },
  {
    "job_id": 552322,
    "company_name": "AT&T",
    "salary_year_avg": "255829.5",
    "job_title": "Associate Director- Data Insights",
    "job_location": "Anywhere",
    "skills": "tableau"
  },
  {
    "job_id": 552322,
    "company_name": "AT&T",
    "salary_year_avg": "255829.5",
    "job_title": "Associate Director- Data Insights",
    "job_location": "Anywhere",
    "skills": "power bi"
  },
  {
    "job_id": 552322,
    "company_name": "AT&T",
    "salary_year_avg": "255829.5",
    "job_title": "Associate Director- Data Insights",
    "job_location": "Anywhere",
    "skills": "powerpoint"
  },
  {
    "job_id": 99305,
    "company_name": "Pinterest Job Advertisements",
    "salary_year_avg": "232423.0",
    "job_title": "Data Analyst, Marketing",
    "job_location": "Anywhere",
    "skills": "sql"
  },
  {
    "job_id": 99305,
    "company_name": "Pinterest Job Advertisements",
    "salary_year_avg": "232423.0",
    "job_title": "Data Analyst, Marketing",
    "job_location": "Anywhere",
    "skills": "python"
  },
  {
    "job_id": 99305,
    "company_name": "Pinterest Job Advertisements",
    "salary_year_avg": "232423.0",
    "job_title": "Data Analyst, Marketing",
    "job_location": "Anywhere",
    "skills": "r"
  },
  {
    "job_id": 99305,
    "company_name": "Pinterest Job Advertisements",
    "salary_year_avg": "232423.0",
    "job_title": "Data Analyst, Marketing",
    "job_location": "Anywhere",
    "skills": "hadoop"
  },
  {
    "job_id": 99305,
    "company_name": "Pinterest Job Advertisements",
    "salary_year_avg": "232423.0",
    "job_title": "Data Analyst, Marketing",
    "job_location": "Anywhere",
    "skills": "tableau"
  },
  {
    "job_id": 1021647,
    "company_name": "Uclahealthcareers",
    "salary_year_avg": "217000.0",
    "job_title": "Data Analyst (Hybrid/Remote)",
    "job_location": "Anywhere",
    "skills": "sql"
  },
  {
    "job_id": 1021647,
    "company_name": "Uclahealthcareers",
    "salary_year_avg": "217000.0",
    "job_title": "Data Analyst (Hybrid/Remote)",
    "job_location": "Anywhere",
    "skills": "crystal"
  },
  {
    "job_id": 1021647,
    "company_name": "Uclahealthcareers",
    "salary_year_avg": "217000.0",
    "job_title": "Data Analyst (Hybrid/Remote)",
    "job_location": "Anywhere",
    "skills": "oracle"
  },
  {
    "job_id": 1021647,
    "company_name": "Uclahealthcareers",
    "salary_year_avg": "217000.0",
    "job_title": "Data Analyst (Hybrid/Remote)",
    "job_location": "Anywhere",
    "skills": "tableau"
  },
  {
    "job_id": 1021647,
    "company_name": "Uclahealthcareers",
    "salary_year_avg": "217000.0",
    "job_title": "Data Analyst (Hybrid/Remote)",
    "job_location": "Anywhere",
    "skills": "flow"
  },
  {
    "job_id": 168310,
    "company_name": "SmartAsset",
    "salary_year_avg": "205000.0",
    "job_title": "Principal Data Analyst (Remote)",
    "job_location": "Anywhere",
    "skills": "sql"
  },
  {
    "job_id": 168310,
    "company_name": "SmartAsset",
    "salary_year_avg": "205000.0",
    "job_title": "Principal Data Analyst (Remote)",
    "job_location": "Anywhere",
    "skills": "python"
  },
  {
    "job_id": 168310,
    "company_name": "SmartAsset",
    "salary_year_avg": "205000.0",
    "job_title": "Principal Data Analyst (Remote)",
    "job_location": "Anywhere",
    "skills": "go"
  },
  {
    "job_id": 168310,
    "company_name": "SmartAsset",
    "salary_year_avg": "205000.0",
    "job_title": "Principal Data Analyst (Remote)",
    "job_location": "Anywhere",
    "skills": "snowflake"
  },
  {
    "job_id": 168310,
    "company_name": "SmartAsset",
    "salary_year_avg": "205000.0",
    "job_title": "Principal Data Analyst (Remote)",
    "job_location": "Anywhere",
    "skills": "pandas"
  },
  {
    "job_id": 168310,
    "company_name": "SmartAsset",
    "salary_year_avg": "205000.0",
    "job_title": "Principal Data Analyst (Remote)",
    "job_location": "Anywhere",
    "skills": "numpy"
  },
  {
    "job_id": 168310,
    "company_name": "SmartAsset",
    "salary_year_avg": "205000.0",
    "job_title": "Principal Data Analyst (Remote)",
    "job_location": "Anywhere",
    "skills": "excel"
  },
  {
    "job_id": 168310,
    "company_name": "SmartAsset",
    "salary_year_avg": "205000.0",
    "job_title": "Principal Data Analyst (Remote)",
    "job_location": "Anywhere",
    "skills": "tableau"
  },
  {
    "job_id": 168310,
    "company_name": "SmartAsset",
    "salary_year_avg": "205000.0",
    "job_title": "Principal Data Analyst (Remote)",
    "job_location": "Anywhere",
    "skills": "gitlab"
  },
  {
    "job_id": 731368,
    "company_name": "Inclusively",
    "salary_year_avg": "189309.0",
    "job_title": "Director, Data Analyst - HYBRID",
    "job_location": "Anywhere",
    "skills": "sql"
  },
  {
    "job_id": 731368,
    "company_name": "Inclusively",
    "salary_year_avg": "189309.0",
    "job_title": "Director, Data Analyst - HYBRID",
    "job_location": "Anywhere",
    "skills": "python"
  },
  {
    "job_id": 731368,
    "company_name": "Inclusively",
    "salary_year_avg": "189309.0",
    "job_title": "Director, Data Analyst - HYBRID",
    "job_location": "Anywhere",
    "skills": "azure"
  },
  {
    "job_id": 731368,
    "company_name": "Inclusively",
    "salary_year_avg": "189309.0",
    "job_title": "Director, Data Analyst - HYBRID",
    "job_location": "Anywhere",
    "skills": "aws"
  },
  {
    "job_id": 731368,
    "company_name": "Inclusively",
    "salary_year_avg": "189309.0",
    "job_title": "Director, Data Analyst - HYBRID",
    "job_location": "Anywhere",
    "skills": "oracle"
  },
  {
    "job_id": 731368,
    "company_name": "Inclusively",
    "salary_year_avg": "189309.0",
    "job_title": "Director, Data Analyst - HYBRID",
    "job_location": "Anywhere",
    "skills": "snowflake"
  },
  {
    "job_id": 731368,
    "company_name": "Inclusively",
    "salary_year_avg": "189309.0",
    "job_title": "Director, Data Analyst - HYBRID",
    "job_location": "Anywhere",
    "skills": "tableau"
  },
  {
    "job_id": 731368,
    "company_name": "Inclusively",
    "salary_year_avg": "189309.0",
    "job_title": "Director, Data Analyst - HYBRID",
    "job_location": "Anywhere",
    "skills": "power bi"
  },
  {
    "job_id": 731368,
    "company_name": "Inclusively",
    "salary_year_avg": "189309.0",
    "job_title": "Director, Data Analyst - HYBRID",
    "job_location": "Anywhere",
    "skills": "sap"
  },
  {
    "job_id": 731368,
    "company_name": "Inclusively",
    "salary_year_avg": "189309.0",
    "job_title": "Director, Data Analyst - HYBRID",
    "job_location": "Anywhere",
    "skills": "jenkins"
  },
  {
    "job_id": 731368,
    "company_name": "Inclusively",
    "salary_year_avg": "189309.0",
    "job_title": "Director, Data Analyst - HYBRID",
    "job_location": "Anywhere",
    "skills": "bitbucket"
  },
  {
    "job_id": 731368,
    "company_name": "Inclusively",
    "salary_year_avg": "189309.0",
    "job_title": "Director, Data Analyst - HYBRID",
    "job_location": "Anywhere",
    "skills": "atlassian"
  },
  {
    "job_id": 731368,
    "company_name": "Inclusively",
    "salary_year_avg": "189309.0",
    "job_title": "Director, Data Analyst - HYBRID",
    "job_location": "Anywhere",
    "skills": "jira"
  },
  {
    "job_id": 731368,
    "company_name": "Inclusively",
    "salary_year_avg": "189309.0",
    "job_title": "Director, Data Analyst - HYBRID",
    "job_location": "Anywhere",
    "skills": "confluence"
  },
  {
    "job_id": 310660,
    "company_name": "Motional",
    "salary_year_avg": "189000.0",
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "job_location": "Anywhere",
    "skills": "sql"
  },
  {
    "job_id": 310660,
    "company_name": "Motional",
    "salary_year_avg": "189000.0",
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "job_location": "Anywhere",
    "skills": "python"
  },
  {
    "job_id": 310660,
    "company_name": "Motional",
    "salary_year_avg": "189000.0",
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "job_location": "Anywhere",
    "skills": "r"
  },
  {
    "job_id": 310660,
    "company_name": "Motional",
    "salary_year_avg": "189000.0",
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "job_location": "Anywhere",
    "skills": "git"
  },
  {
    "job_id": 310660,
    "company_name": "Motional",
    "salary_year_avg": "189000.0",
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "job_location": "Anywhere",
    "skills": "bitbucket"
  },
  {
    "job_id": 310660,
    "company_name": "Motional",
    "salary_year_avg": "189000.0",
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "job_location": "Anywhere",
    "skills": "atlassian"
  },
  {
    "job_id": 310660,
    "company_name": "Motional",
    "salary_year_avg": "189000.0",
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "job_location": "Anywhere",
    "skills": "jira"
  },
  {
    "job_id": 310660,
    "company_name": "Motional",
    "salary_year_avg": "189000.0",
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "job_location": "Anywhere",
    "skills": "confluence"
  },
  {
    "job_id": 1749593,
    "company_name": "SmartAsset",
    "salary_year_avg": "186000.0",
    "job_title": "Principal Data Analyst",
    "job_location": "Anywhere",
    "skills": "sql"
  },
  {
    "job_id": 1749593,
    "company_name": "SmartAsset",
    "salary_year_avg": "186000.0",
    "job_title": "Principal Data Analyst",
    "job_location": "Anywhere",
    "skills": "python"
  },
  {
    "job_id": 1749593,
    "company_name": "SmartAsset",
    "salary_year_avg": "186000.0",
    "job_title": "Principal Data Analyst",
    "job_location": "Anywhere",
    "skills": "go"
  },
  {
    "job_id": 1749593,
    "company_name": "SmartAsset",
    "salary_year_avg": "186000.0",
    "job_title": "Principal Data Analyst",
    "job_location": "Anywhere",
    "skills": "snowflake"
  },
  {
    "job_id": 1749593,
    "company_name": "SmartAsset",
    "salary_year_avg": "186000.0",
    "job_title": "Principal Data Analyst",
    "job_location": "Anywhere",
    "skills": "pandas"
  },
  {
    "job_id": 1749593,
    "company_name": "SmartAsset",
    "salary_year_avg": "186000.0",
    "job_title": "Principal Data Analyst",
    "job_location": "Anywhere",
    "skills": "numpy"
  },
  {
    "job_id": 1749593,
    "company_name": "SmartAsset",
    "salary_year_avg": "186000.0",
    "job_title": "Principal Data Analyst",
    "job_location": "Anywhere",
    "skills": "excel"
  },
  {
    "job_id": 1749593,
    "company_name": "SmartAsset",
    "salary_year_avg": "186000.0",
    "job_title": "Principal Data Analyst",
    "job_location": "Anywhere",
    "skills": "tableau"
  },
  {
    "job_id": 1749593,
    "company_name": "SmartAsset",
    "salary_year_avg": "186000.0",
    "job_title": "Principal Data Analyst",
    "job_location": "Anywhere",
    "skills": "gitlab"
  },
  {
    "job_id": 387860,
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "184000.0",
    "job_title": "ERM Data Analyst",
    "job_location": "Anywhere",
    "skills": "sql"
  },
  {
    "job_id": 387860,
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "184000.0",
    "job_title": "ERM Data Analyst",
    "job_location": "Anywhere",
    "skills": "python"
  },
  {
    "job_id": 387860,
    "company_name": "Get It Recruit - Information Technology",
    "salary_year_avg": "184000.0",
    "job_title": "ERM Data Analyst",
    "job_location": "Anywhere",
    "skills": "r"
  }
]
*/