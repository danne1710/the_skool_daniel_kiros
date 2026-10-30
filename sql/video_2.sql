
SELECT
    utbildningsomrade,
    COUNT(*) AS antal_ansokningar,
    COUNT(*) FILTER (WHERE beslut = 'Beviljad') AS antal_beviljade,
    ROUND(100.0 * COUNT(*) FILTER (WHERE beslut = 'Beviljad') / COUNT(*), 1) AS beviljandegrad_procent
FROM ansokan_raw
GROUP BY utbildningsomrade
ORDER BY beviljandegrad_procent DESC;
