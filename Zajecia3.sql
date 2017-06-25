--- 1 ---
SELECT 
    MIN(placa_pod) AS MINIMUM,
    MAX(placa_pod) AS MAXIMUM,
    MAX(placa_pod)-MIN(placa_pod) AS ROZNICA 
FROM pracownicy
    
--- 2 ---
SELECT 
    etat,
    AVG(placa_pod)
FROM pracownicy
GROUP BY etat
ORDER BY AVG(placa_pod) DESC

--- 3 ---
SELECT
    COUNT(etat) AS PROFESOROWIE
FROM pracownicy
WHERE etat LIKE 'PROFESOR'

--- 4 ---
SELECT
    COUNT(ISNULL(id_zesp,-1)) AS BEZ_ZESP
FROM pracownicy
WHERE ISNULL(id_zesp,-1) = -1

--- 5 ---
SELECT
    ISNULL(id_zesp,0),
    SUM(placa_pod) + SUM(placa_dod) AS SUMARYCZNE_PLACE,
    COUNT(id_prac)
FROM pracownicy
GROUP BY id_zesp
ORDER BY id_zesp

--- 6 ---
SELECT
    ISNULL(id_szefa,0),
    MIN(placa_pod)
FROM pracownicy
GROUP BY id_szefa 
ORDER BY MIN(placa_pod) DESC

--- 7 ---
SELECT
    id_zesp,
    COUNT(*)
FROM pracownicy
GROUP BY id_zesp
HAVING COUNT(id_prac) > 2
ORDER BY id_zesp

--- 8 ---
SELECT
    etat,
    AVG(placa_pod),
    COUNT(*)
FROM pracownicy
WHERE DATEPART(YEAR FROM zatrudniony) < 1990
GROUP BY etat


