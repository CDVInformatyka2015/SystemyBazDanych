-- Zadanie 1 --
SELECT NAZWISKO,CONCAT(LEFT(ETAT,2),ID_PRAC) AS KOD FROM PRACOWNICY;

-- Zadanie 2 --
SELECT NAZWISKO,REPLACE(REPLACE(REPLACE(NAZWISKO,'m','X'),'l','X'),'k','X') AS WOJNA_LITEROM FROM Pracownicy
ORDER BY WOJNA_LITEROM ASC;

-- Zadanie 3 --
SELECT NAZWISKO FROM Pracownicy WHERE SUBSTRING(NAZWISKO,1,LEN(NAZWISKO)/2) LIKE '%[Ll]%';

-- Zadanie 4 --
SELECT NAZWISKO,CAST(ROUND(PLACA_POD*1.15,0) AS INT) AS PODWYZKA FROM Pracownicy;

-- Zadanie 5 --


-- Zadanie 6 --
