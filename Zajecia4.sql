-- 1 --
SELECT
	p.nazwisko,
	p.etat,
	z.id_zesp,
	z.nazwa
FROM Pracownicy p JOIN Zespoly z on p.id_zesp=z.id_zesp
ORDER BY p.nazwisko 

-- 2--
SELECT p.nazwisko, p.etat, z.id_zesp, z.adres
FROM Pracownicy p JOIN Zespoly z on p.id_zesp=z.id_zesp 
WHERE adres = 'Piotrowo 3a' 
ORDER BY p.nazwisko 

-- 3 --
SELECT p.nazwisko, z.adres, z.nazwa
FROM Pracownicy p JOIN Zespoly z on p.id_zesp=z.id_zesp 
WHERE p.Placa_pod > 1500 
ORDER BY p.Placa_pod 

-- 4--
SELECT p.nazwisko, p.placa_pod, p.etat as kategoria, e.placa_od, e.placa_do
FROM Pracownicy p JOIN etaty e on p.etat = e.nazwa
ORDER BY p.nazwisko

-- 5--
SELECT p.nazwisko, p.placa_pod, p.etat as kategoria, e.placa_od, e.placa_do
FROM Pracownicy p JOIN etaty e on p.etat = e.nazwa
WHERE p.placa_pod between e.placa_od and  p.placa_pod and etat = 'asystent'
ORDER BY p.nazwisko

-- 6--
SELECT p.nazwisko, p.ETAT, p.placa_pod,e.NAZWA as kat_plac, z.nazwa
FROM Pracownicy p JOIN Zespoly z  on p.ID_ZESP = z.ID_ZESP 
JOIN etaty e on e.nazwa = p.etat    
WHERE etat != 'asystent'
ORDER BY p.PLACA_POD desc

-- 7--
SELECT p.nazwisko, p.ETAT, ((p.placa_pod + isnull(p.placa_dod,0)) * 12) as roczna_placa, z.NAZWA, e.NAZWA as kategoria_placowa   
FROM Pracownicy p JOIN Zespoly z  on p.ID_ZESP = z.ID_ZESP 
JOIN etaty e on e.nazwa = p.etat    
WHERE ((p.placa_pod + isnull(p.placa_dod,0)) * 12) > 30000 and etat = 'asystent' or etat = 'adiunkt'

-- 8--
SELECT p.nazwisko, isnull(z.nazwa, '')
FROM Pracownicy p left JOIN Zespoly z on p.id_zesp=z.id_zesp 
ORDER BY NAZWISKO

-- 9 --
SELECT z.nazwa
FROM Pracownicy p right JOIN Zespoly z on p.id_zesp=z.id_zesp 
WHERE p.ID_ZESP is null

-- 10--
SELECT p.id_prac, p.nazwisko as pracownik, s.id_prac, s.nazwisko as szef
FROM Pracownicy p JOIN Pracownicy s on p.id_szefa = s.id_prac
ORDER BY p.nazwisko

-- 11
SELECT p.id_prac, p.nazwisko as pracownik, isnull(s.id_prac, ' ') as id_prac, isnull(s.nazwisko, ' ') as szef
FROM Pracownicy p left JOIN Pracownicy s on p.id_szefa = s.id_prac
ORDER BY p.nazwisko


-- 12--

SELECT z.nazwa , count (id_prac) as liczba, round(isnull(avg (placa_pod), 0), 1) as placa
FROM Pracownicy p right JOIN Zespoly z on p.id_zesp=z.id_zesp 
group by z.nazwa


-- 13--
SELECT s.nazwisko,count(*) as liczba
FROM Pracownicy p JOIN Pracownicy s on p.id_szefa = s.id_prac
group by s.nazwisko
ORDER BY liczba desc


-- 14--
SELECT p.nazwisko, p.zatrudniony, s.nazwisko, s.zatrudniony, abs(datediff(day, 
p.zatrudniony, s.zatrudniony)) as dni
FROM Pracownicy p JOIN Pracownicy s on p.id_szefa = s.id_prac
WHERE p.zatrudniony <=  dateadd ( year, 10, s.zatrudniony)
