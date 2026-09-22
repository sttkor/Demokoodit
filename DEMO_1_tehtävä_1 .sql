SELECT etunimi, sukunimi, kurssi.koodi,  AVG(arvosana) AS keskiarvo
FROM Kurssi JOIN Opettaja ON Kurssi.opettaja_hlotunnus = Opettaja.henkilotunnus
JOIN Suoritus ON Suoritus.kurssikoodi = koodi
GROUP BY koodi