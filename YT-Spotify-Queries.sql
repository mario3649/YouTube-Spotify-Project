SELECT views, Stream
FROM spotify_youtube;

----------------------- 

SELECT 
    Artist,
    SUM(Stream) AS total_streams,
    SUM(Views) AS total_views
FROM 
    spotify_youtube
WHERE 
    Stream IS NOT NULL
    AND Views IS NOT NULL
GROUP BY 
    Artist
ORDER BY 
    total_views DESC, 
    total_streams DESC
LIMIT 10;  

------------------------

SELECT 
    Artist,
    SUM(Stream) AS total_streams,
    SUM(Views) AS total_views
FROM 
    spotify_youtube
WHERE 
    Stream IS NOT NULL
    AND Views IS NOT NULL
GROUP BY 
    Artist
ORDER BY 
    total_streams DESC, 
    total_views DESC
LIMIT 10;  

-------------------

SELECT 
    Artist,
    SUM(Views) AS total_views,
    SUM(Likes) AS total_likes,
    SUM(Comments) AS total_comments,
    (SUM(Likes) + SUM(Comments)) / SUM(Views) AS engagement_rate
FROM 
    spotify_youtube
WHERE 
    Views > 0  
GROUP BY 
    Artist
ORDER BY 
    engagement_rate DESC
LIMIT 10;

----------------------

SELECT
    FLOOR(Duration_ms / 30000) * 30000 AS duration_bin,  -- Group by 30-second intervals
    AVG(Stream) AS avg_streams,
    COUNT(*) AS total_songs
FROM
    spotify_youtube
GROUP BY
    duration_bin
ORDER BY
    duration_bin;