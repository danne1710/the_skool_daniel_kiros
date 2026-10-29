SELECT
    utbildningsomrade,
    COUNT(*) AS antal_ansokningar,
    COUNT(*) FILTER (WHERE beslut = 'Beviljad') AS antal_beviljade,
    ROUND(100.0 * COUNT(*) FILTER (WHERE beslut = 'Beviljad') /COUNT(*), 1) AS beviljandegrad_procent
FROM ansokan_raw
GROUP BY utbildningsomrade
ORDER BY beviljandegrad_procent DESC;
SELECT
    CASE 
        WHEN utbildningsnamn LIKE '%AI%' THEN 'AI-UTBILDNING'
        ELSE 'Övriga utbildningar'
    END AS kategori,
    COUNT(*) AS antal_ansokningar,
    COUNT(*) FILTER (WHERE beslut = 'Beviljad') AS antal_beviljade,
    ROUND(100.0 * COUNT(*) FILTER (WHERE beslut = 'Beviljad') / COUNT(*), 1) AS beviljandegrad_procent
FROM ansokan_raw
GROUP BY kategori
ORDER BY beviljandegrad_procent DESC;
SELECT
    studieform,
    COUNT(*) AS antal_ansokningar,
    ROUND(100.0 * COUNT(*) FILTER (WHERE beslut = 'Beviljad') /COUNT(*), 1) AS beviljandegrad_procent
FROM ansokan_raw
GROUP BY studieform
ORDER BY beviljandegrad_procent DESC;
SELECT
    Studieform,
    COUNT(*) AS antal_ansokningar,
    ROUND(100.0 * COUNT(*) FILTER (WHERE beslut = 'Beviljad') / COUNT(*), 1) AS beviljandegrad_procent
FROM ansokan_raw
WHERE utbildningsomrade = 'Data/IT'
GROUP BY studieform
ORDER BY beviljandegrad_procent DESC;
SELECT
    huvudmannatyp,
    COUNT(*) AS antal_ansokningar,
    ROUND(100.0 * COUNT(*) FILTER (WHERE beslut = 'Beviljad') /COUNT(*), 1) AS beviljandegrad_procent
FROM ansokan_raw
GROUP BY huvudmannatyp
ORDER BY beviljandegrad_procent DESC;
SELECT
    utbildningsanordnare_administrativ_enhet,
    COUNT(*) AS antal_ansokningar,
    COUNT(*) FILTER(WHERE beslut = 'Beviljad') AS antal_beviljade,
    ROUND(100.0 * COUNT(*) FILTER (WHERE beslut = 'Beviljad') / COUNT(*), 1) AS beviljandegrad_procent
FROM ansokan_raw
WHERE utbildningsomrade = 'Data/IT'
GROUP BY utbildningsanordnare_administrativ_enhet
HAVING COUNT(*) >= 5
ORDER BY antal_beviljade DESC, beviljandegrad_procent DESC;


