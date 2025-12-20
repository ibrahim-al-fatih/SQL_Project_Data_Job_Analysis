# Introduction
📊 Data Analyst Job Market Insights (2023)
I built this project to understand what actually pays in the Data Analyst job market. Using real job posting data from 2023, I analysed top-paying roles, in-demand skills, and the overlap between salary and demand. The aim is simple: turn market data into clear, practical insights for smarter career decisions.

Curious about the SQL? 👀 Check out all the queries behind this analysis here: [project_sql_folder](/project_sql/) 

# Background
To understand the Data Analyst job market more clearly, I structured this project around five core questions:
1. Which Data Analyst jobs pay the most?
2. What skills are required for those top-paying roles?
3. Which skills are most in demand across the market?
4. Which skills are associated with the highest salaries?
5. Which skills offer the best balance between demand and pay?

Each question builds on the previous one, moving from job-level insights to skill-level optimisation. Together, they form a data-driven view of how Data Analyst roles are evolving — and where to focus effort for maximum career impact.

# Tools I Used
This project was built using a simple but powerful analytics stack:
- **SQL** – for data cleaning, aggregation, and analysis
- **PostgreSQL** – as the primary database for querying job market data
- **Visual Studio Code** – for writing, testing, and organising SQL queries
- **Git & GitHub** – for version control and sharing the project transparently

Together, these tools enabled a reproducible, end-to-end market analysis, from raw data to insights.

# The Analysis
### 1. Top Paying Data Analyst Job
This analysis explores the highest-paying Data Analyst positions in the 2023 job market. By focusing only on job postings that specify salaries, we aim to uncover which companies, roles, and industries offer the most lucrative opportunities. The goal is to highlight trends in seniority, location flexibility, and sector to provide actionable insights for data professionals seeking high-paying positions.

```sql
SELECT
    jpf.job_id,
    company_dim.name AS company_name,
    jpf.salary_year_avg,
    jpf.job_title,
    jpf.job_location,
    jpf.job_schedule_type,
    jpf.job_posted_date::DATE
FROM
    job_postings_fact AS jpf
LEFT JOIN company_dim ON company_dim.company_id = jpf.company_id
WHERE
    jpf.salary_year_avg IS NOT NULL AND
    jpf.job_title_short = 'Data Analyst' AND
    jpf.job_location = 'Anywhere'
ORDER BY
    jpf.salary_year_avg DESC
LIMIT 10;
```
Key insights:
Key Insights
- **High-paying roles often require seniority or specialization** (Director, Principal).
- Remote opportunities are common in the top salary range — important for job seekers considering relocation.
- **Tech and finance sectors** offer the most lucrative positions.
- Regular Data Analyst roles typically see salaries in the $180k–$230k range; opportunities to climb to $300k+ usually involve leadership positions.
- Companies are actively seeking experienced talent across various industries, signaling a ***robust market for skilled data analysts.***


# What I Learned

# Conclusions