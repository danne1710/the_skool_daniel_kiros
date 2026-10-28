SELECT 
    utbildningsomrade,
    COUNT(*) AS antal_ansokningar
FROM ansokan_raw
GROUP BY utbildningsomrade
ORDER BY antal_ansokningar DESC;
SELECT 
    utbildningsomrade,
    COUNT(*) AS antal_beviljade
FROM ansokan_raw
WHERE beslut = 'Beviljad'
GROUP BY utbildningsomrade
ORDER BY antal_beviljade DESC;
SELECT 
    utbildningsomrade,
    COUNT(*) AS antal_avslagna
FROM ansokan_raw
WHERE beslut = 'Avslag'
GROUP BY utbildningsomrade
ORDER BY antal_avslagna DESC;

SELECT
    utbildningsnamn,
    COUNT(*) AS antal_beviljade
FROM ansokan_raw
WHERE beslut = 'Beviljad'
AND utbildningsomrade = 'Data/IT'
GROUP BY utbildningsnamn
ORDER BY antal_beviljade DESC;
SELECT 
    utbildningsnamn,
    COUNT(*) AS antal_avslagna 
FROM ansokan_raw
WHERE beslut = 'Avslag'
AND utbildningsomrade = 'Data/IT'
GROUP BY utbildningsnamn
ORDER BY antal_avslagna DESC;
SELECT
    utbildningsanordnare_administrativ_enhet,
    utbildningsnamn,
    COUNT(*) AS antal_beviljade
FROM ansokan_raw
WHERE beslut = 'Beviljad'
AND utbildningsomrade = 'Data/IT'
GROUP BY utbildningsanordnare_administrativ_enhet, utbildningsnamn
ORDER BY antal_beviljade DESC, UTbildningsanordnare_administrativ_enhet;
SELECT
    lan,
    COUNT(*) AS antal_beviljade
FROM ansokan_raw
WHERE beslut = 'Beviljad'
AND lan != 'Flera kommuner'
GROUP BY lan 
ORDER BY antal_beviljade DESC
LIMIT 5;
SELECT
    utbildningsomrade,
    COUNT(*) AS totalt,
    ROUND(100.0 * COUNT(*) FILTER (WHERE studieform = 'Distans') / COUNT(*), 1) AS andel_distans_procent,
    ROUND(100.0 * COUNT(*) FILTER (WHERE studieform = 'Bunden') / COUNT(*), 1) AS andel_bunden_procent
FROM ansokan_raw
GROUP BY utbildningsomrade
ORDER BY andel_distans_procent DESC;
SELECT 
    COUNT(*) AS antal_ai_utbildningar
FROM ansokan_raw
WHERE utbildningsnamn LIKE '%AI%';

