CREATE VIEW MEDIANBYCOUNTRYNAME AS SELECT * FROM (SELECT COUNTRY, nvl(MEDIAN(DAILY_VACCINATIONS), 0) AS DAILY_VACCINATIONS FROM COUNTRY_VACCINATIONS_DATASET GROUP BY COUNTRY);

SELECT COUNTRY_VACCINATIONS_DATASET.COUNTRY,
NVL(COUNTRY_VACCINATIONS_DATASET.DAILY_VACCINATIONS, (SELECT MEDIANBYCOUNTRYNAME.DAILY_VACCINATIONS FROM MEDIANBYCOUNTRYNAME WHERE MEDIANBYCOUNTRYNAME.COUNTRY = COUNTRY_VACCINATIONS_DATASET.COUNTRY)) AS DAILY_VACCINATIONS
FROM COUNTRY_VACCINATIONS_DATASET;