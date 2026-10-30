
SELECT
    CASE
        WHEN utbildningsnamn LIKE '%AI%' THEN 'AI-utbildning'
        ELSE 'Övriga utbildningar'
    END AS kategori,
    COUNT(*) AS antal_ansokningar,
    COUNT(*) FILTER (WHERE beslut = 'Beviljad') AS antal_beviljade
FROM ansokan_raw
GROUP BY kategori;
