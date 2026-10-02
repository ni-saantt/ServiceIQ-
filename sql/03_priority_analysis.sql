-- SLA performance and resolution time by priority

SELECT
    priority,
    COUNT(*) AS total_incidents,
    SUM(sla_breached) AS sla_breaches,
    ROUND(
        SUM(sla_breached) * 100.0 / COUNT(*),
        2
    ) AS sla_breach_rate,
    ROUND(
        AVG(resolution_time_hours),
        2
    ) AS avg_resolution_hours
FROM incidents
GROUP BY priority
ORDER BY priority;
