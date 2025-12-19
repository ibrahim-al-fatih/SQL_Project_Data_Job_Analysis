/*
Question: What are the most optimal skills to learn?
    (aka it's in high demand and a high-paying skills)
- Identify skills in high demand and associated with high avg salaries for data analyst roles
- Concentrate on remote positions with specified salaries
- Why? Targets skills that offer job security (high demand) and financial benefits (high salaries),
    offering strategic insight for career development in data analysis
*/

WITH skill_demand AS (
    SELECT
        skills_dim.skills,
        count(skills_job_dim.job_id) AS total_jobs
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
        skills_dim.skills
), skill_salary AS (
    SELECT
        skills_dim.skills,
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
        skills_dim.skills
)

SELECT
    skill_demand.skills,
    total_jobs,
    average_salary
FROM
    skill_demand
INNER JOIN skill_salary ON skill_salary.skills = skill_demand.skills
WHERE
    total_jobs > 10
ORDER BY
    total_jobs DESC,
    average_salary DESC
LIMIT 25;

-- Rewriting more concisely without the use of CTE
SELECT 
    skills,
    skills_dim.skill_id, -- skill_dim is used to correlate with skills by scale of 1:1
    COUNT(skills_job_dim.job_id) AS total_jobs,
    ROUND(AVG(jpf.salary_year_avg),0) AS average_salary
FROM job_postings_fact AS jpf
INNER JOIN skills_job_dim ON skills_job_dim.job_id = jpf.job_id
-- INNER JOIN is used because not all job postings have skill_id
LEFT JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
WHERE
    jpf.salary_year_avg IS NOT NULL AND
    jpf.job_title_short = 'Data Analyst' AND
    jpf.job_work_from_home = true
GROUP BY
    skills_dim.skill_id
HAVING
    COUNT(skills_job_dim.job_id) > 10
ORDER BY
    total_jobs DESC,
    average_salary DESC
LIMIT 25;
