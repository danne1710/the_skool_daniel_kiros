SELECT 
    utbildningsomrade,
    COUNT(*) AS antal_ansokningar
FROM ansokan_raw
GROUP BY utbildningsomrade
ORDER BY antal_ansokningar DESC;

