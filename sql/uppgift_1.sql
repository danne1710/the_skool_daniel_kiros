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

