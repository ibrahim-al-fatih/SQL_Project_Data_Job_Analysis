/*
Question: What are the top skills based on salary?
- Look at the average salary associated with each skill for Data Analyst positions
- Focuses on roles with specified salaries, regardless of location
- Why? It reveals how different skill impact salary levels for data analyst and
    helps identify the most financially rewarding skills to acquire or improve
*/

SELECT
    skills,
    ROUND(AVG(jpf.salary_year_avg),0) AS average_salary
FROM 
    job_postings_fact AS jpf
INNER JOIN skills_job_dim ON skills_job_dim.job_id = jpf.job_id
-- INNER JOIN is used because not all job postings have skill_id
LEFT JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
WHERE
    jpf.salary_year_avg IS NOT NULL AND
    jpf.job_title_short = 'Data Analyst' AND
    jpf.job_work_from_home = true
GROUP BY
    skills
ORDER BY
    average_salary DESC
LIMIT 50;

/*
The highest pay doesn’t go to people who only analyse data; it goes to those who build the systems that make analysis possible. Skills like PySpark, Databricks, and Kubernetes sit at the top because companies need analysts who can handle data at scale, not just inside dashboards.

Python still sits at the heart of everything, but knowing Python alone isn’t enough anymore. The real jump in salary happens when Python is used deeply — powering machine learning, large datasets, and distributed processing. That’s why tools like Pandas, NumPy, and scikit-learn quietly lift pay far beyond the average.

As data moves to the cloud, analysts who understand the infrastructure behind it become far more valuable. Experience with AWS, GCP, Azure, and modern warehouses like Snowflake signals seniority — someone who can balance insight, performance, and cost.

Interestingly, some of the strongest salary signals come from tools many analysts overlook: Git, Bitbucket, Airflow, Jenkins. These aren’t “analysis” tools — they’re production tools. They show an analyst who works like an engineer, shipping reliable data products instead of one-off reports.

And finally, while BI tools still matter, they tell a quieter story. Dashboards alone no longer command top pay. The ceiling lifts only when visualisation is paired with engineering depth and system thinking.
*/
