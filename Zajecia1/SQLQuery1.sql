-- Zadanie 1 --
SELECT * FROM ZESPOLY;
-- Zadanie 2 --
SELECT * FROM PRACOWNICY;
-- Zadanie 3 --
SELECT NAZWISKO, ETAT, PLACA_POD*12 FROM PRACOWNICY;
-- Zadanie 4 --
SELECT NAZWISKO, placa_pod+ISNULL(placa_dod,0)
AS MIESIECZNE_ZAROBKI
FROM PRACOWNICY;
-- Zadanie 5 --
SELECT * FROM ZESPOLY ORDER BY NAZWA;
-- Zadanie 6 --
SELECT DISTINCT etat FROM pracownicy;
-- Zadanie 7 --
SELECT * FROM PRACOWNICY WHERE ETAT = 'ASYSTENT';
-- Zadanie 8 --
SELECT ID_PRAC, NAZWISKO, ETAT, PLACA_POD, ID_ZESP
FROM PRACOWNICY
WHERE ID_ZESP = 40 OR ID_ZESP = 30
ORDER BY PLACA_POD DESC;
-- Zadanie 9 --
SELECT nazwisko, id_zesp, placa_pod
FROM pracownicy
WHERE placa_pod BETWEEN 1000 AND 2000;
-- Zadanie 10 --
SELECT NAZWISKO, ETAT, ID_ZESP
FROM PRACOWNICY
WHERE NAZWISKO LIKE '%ski' OR NAZWISKO LIKE '%ska';
-- Zadanie 11 --
SELECT IMIE, NAZWISKO FROM PRACOWNICY
WHERE ID_ZESP IS NULL;
-- ZADANIE 12 --
SELECT ID_PRAC, ID_SZEFA, NAZWISKO, PLACA_POD
FROM PRACOWNICY
WHERE PLACA_POD > 2000 AND ID_SZEFA IS NOT NULL;
-- ZADANIE 13 --
SELECT IMIE, NAZWISKO, ID_ZESP
FROM PRACOWNICY
WHERE ID_ZESP = 20 AND (NAZWISKO LIKE '%ski' OR NAZWISKO LIKE 'M%');
-- ZADANIE 14 --
SELECT NAZWISKO, ETAT, PLACA_POD/20 AS DNIOWKA, PLACA_POD/20/8 AS STAWKA_GODZINOWA
FROM PRACOWNICY
WHERE ETAT NOT IN ('ADIUNKT','ASYSTENT','DOKTORANT')
AND NOT PLACA_POD BETWEEN 1000 AND 2000
ORDER BY STAWKA_GODZINOWA;
-- ZADANIE 15 --
SELECT NAZWISKO, ETAT, PLACA_POD, PLACA_DOD
FROM PRACOWNICY
WHERE (placa_pod+ISNULL(placa_dod,0)) > 3000
ORDER BY ETAT, NAZWISKO;
-- ZADANIE 16 --
SELECT
CONCAT(IMIE, ' ', NAZWISKO, ' pracuje od ',
CAST(ZATRUDNIONY AS DATE), ' i zarabia ', PLACA_POD)
as PROFESOROWIE
FROM PRACOWNICY
WHERE ETAT = 'PROFESOR'
ORDER BY PLACA_POD DESC;