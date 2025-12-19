/*
Question: What are the most in-demand skills for Data Analyst?
- Join job postings to inner table similar to query 2
- Identify the top 5 in-demand skills for a data analyst
- Focus on all job postings
- Why? Retrieve the top 5 skills with the highest in demand in the market,
providing insight into the most valuable skills for job seekers.
*/

SELECT
    skills,
    count(skills_job_dim.job_id) AS total_jobs
FROM
    job_postings_fact AS jpf
INNER JOIN skills_job_dim ON skills_job_dim.job_id = jpf.job_id
-- INNER JOIN is used because not all job postings have skill_id
LEFT JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
WHERE
    jpf.job_title_short = 'Data Analyst'
GROUP BY
    skills
ORDER BY
    total_jobs DESC
LIMIT 5;

