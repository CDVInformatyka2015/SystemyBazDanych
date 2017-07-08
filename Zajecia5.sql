-- 1 --
SELECT nazwisko, etat, id_zesp
FROM pracownicy
WHERE id_zesp = (SELECT id_zesp
FROM pracownicy
WHERE nazwisko = 'Nowak'
)

-- 2 --
SELECT Nazwisko, etat, zatrudniony
FROM pracownicy
WHERE zatrudniony = (SELECT MIN(zatrudniony)
FROM pracownicy
WHERE etat = 'profesor')

-- 3 --
SELECT	nazwisko, zatrudniony, id_zesp
FROM	pracownicy 
WHERE zatrudniony in (SELECT max(zatrudniony)
FROM pracownicy
WHERE id_zesp is not null
GROUP BY id_zesp)
ORDER BY zatrudniony

-- 4 --
SELECT * 
FROM Zespoly z
WHERE id_zesp not in (SELECT ID_ZESP
FROM pracownicy WHERE ID_ZESP is not null )

-- 5 --
SELECT nazwisko, placa_pod, etat
FROM Pracownicy P
WHERE PLACA_POD > (SELECT avg(placa_pod) FROM pracownicy WHERE etat=p.ETAT GROUP BY ETAT)
ORDER BY placa_pod desc

-- 6 --
SELECT nazwisko, p.placa_pod
FROM Pracownicy p
WHERE p.PLACA_POD > 0.75*(SELECT placa_pod FROM pracownicy s WHERE p.ID_SZEFA = s.ID_PRAC)
ORDER BY NAZWISKO
-- 7 --
SELECT *
FROM Pracownicy p JOIN Pracownicy s on p.id_prac = s.ID_SZEFA 
WHERE p.nazwisko not in (SELECT p.nazwisko FROM Pracownicy p JOIN Pracownicy s
on p.ID_PRAC = s.ID_SZEFA WHERE s.etat = 'doktorant') and p.etat = 'profesor'
ORDER BY p.nazwisko

-- 8 --
SELECT * 
FROM zespoly z 
WHERE z.id_zesp not in 
(SELECT id_zesp FROM pracownicy p WHERE p.id_zesp = z.ID_ZESP)
-- 9 --
SELECT ID_ZESP, SUM(PLACA_POD) FROM Pracownicy GROUP BY  id_zesp
HAVING sum(placa_pod) = (SELECT max(y.num) FROM (SELECT sum(placa_pod) as num FROM
PRACOWNICY GROUP BY id_zesp) y )

-- 10 --
SELECT nazwisko, placa_pod
FROM pracownicy p
WHERE (SELECT count(*) FROM pracownicy WHERE placa_pod > p.placa_pod) < 3
ORDER BY placa_pod desc

-- 11 --
SELECT year(zatrudniony) as rok, COUNT(*) as liczba
FROM PRACOWNICY P
GROUP BY year(zatrudniony)
ORDER BY liczba desc

-- 12 --
SELECT year(zatrudniony) as rok, COUNT(*) as liczba
FROM PRACOWNICY P
GROUP BY year(zatrudniony)
having COUNT(*)  = (SELECT max(y.num) FROM (SELECT COUNT(*) as num
FROM PRACOWNICY P GROUP BY year(zatrudniony)) y) 

-- 13 --
SELECT nazwisko, placa_pod, etat
FROM Pracownicy P  
WHERE PLACA_POD < (SELECT avg(placa_pod) FROM pracownicy WHERE etat=p.ETAT GROUP BY ETAT)
ORDER BY nazwisko 

-- 14 --
SELECT p.nazwisko, p.placa_pod, p.etat, isnull(z.nazwa, '')
FROM Pracownicy P left JOIN Zespoly z on p.ID_ZESP = z.ID_ZESP
WHERE PLACA_POD < (SELECT avg(placa_pod) FROM pracownicy WHERE etat=p.ETAT GROUP BY ETAT)
ORDER BY nazwisko

-- 15 --
SELECT nazwisko,
(SELECT count(*) FROM pracownicy WHERE id_szefa = p.id_prac) liczba_podw
FROM pracownicy p JOIN zespoly z on p.id_zesp = z.id_zesp
WHERE etat = 'profesor'
ORDER BY liczba_podw

-- 16 --
SELECT nazwisko, 
(SELECT avg(placa_pod) FROM pracownicy WHERE id_zesp = p.id_zesp) srednia, 
(SELECT max(placa_pod) FROM pracownicy) max_w_ins
FROM pracownicy p
WHERE etat = 'profesor'

-- zadania 17 --
SELECT nazwisko, (SELECT nazwa FROM zespoly WHERE id_zesp = p.id_zesp) FROM 
pracownicy p
