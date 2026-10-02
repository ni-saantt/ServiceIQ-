-- SLA performance by assignment group
-- Groups with fewer than 50 incidents are excluded
-- to avoid over-interpreting very small samples.

SELECT
    assignment_group,
    COUNT(*) AS total_incidents,
    SUM(sla_breached) AS sla_breaches,
    ROUND(
        SUM(sla_breached) * 100.0 / COUNT(*),
        2
    ) AS sla_breach_rate
FROM incidents
GROUP BY assignment_group
HAVING COUNT(*) >= 50
ORDER BY sla_breach_rate DESC;
