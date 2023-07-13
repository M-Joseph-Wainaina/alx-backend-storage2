-- Write a SQL script that ranks country origins of bands, ordered by the number of (non-unique) fans

-- Requirements:

-- Import this table dump: metal_bands.sql.zip
-- Column names must be: origin and nb_fans
-- Your script can be executed on any database

-- Create a temporary table to store the aggregated fan counts per country
CREATE TEMPORARY TABLE temp_ranked_countries AS
SELECT origin, SUM(fans) AS nb_fans
FROM metal_bands
GROUP BY origin;

-- Rank the countries based on the total number of fans
SELECT origin, nb_fans
FROM temp_ranked_countries
ORDER BY nb_fans DESC;
