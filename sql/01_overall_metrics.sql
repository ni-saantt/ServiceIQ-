-- Overall IT support performance

SELECT
    COUNT(*) AS total_incidents,
    SUM(sla_breached) AS sla_breaches,
    ROUND(
        SUM(sla_breached) * 100.0 / COUNT(*),
        2
    ) AS sla_breach_rate,
    ROUND(
        AVG(resolution_time_hours),
        2
    ) AS avg_resolution_hours,
    ROUND(
        AVG(closure_time_hours),
        2
    ) AS avg_closure_hours,
    SUM(is_reopened) AS reopened_incidents,
    SUM(is_reassigned) AS reassigned_incidents
FROM incidents;
