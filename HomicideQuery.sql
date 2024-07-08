SELECT *
FROM (
    SELECT SUBSTRING(CNTYFIPS, 0, CHARINDEX(',', CNTYFIPS)) AS CNTYFIPS,
    SUBSTRING(CNTYFIPS, CHARINDEX(',', CNTYFIPS)  + 1, LEN(CNTYFIPS)) AS State, Source, 
    Year, Month, Incident, VicAge, VicSex, VicRace, OffAge, OffSex, OffRace,
    CASE WHEN Homicide = 'Murder and non-negligent manslaughter' THEN 1 ELSE 0 END AS Homicide, 
    Weapon, Relationship, Circumstance, VicCount + 1 AS VicCount, OffCount + 1 AS OffCount, Solved
    FROM Homicide
    WHERE VicCount > '1'
) AS Mult_Murder;