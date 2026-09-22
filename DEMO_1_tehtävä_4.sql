SELECT nimi, SUM(kplhinta*määrä) as kokonaishinnat
FROM asiakas JOIN tilaus
ON asiakas.id = asiakas_id
JOIN tuote_tilauksessa
ON tilaus.id = tuote_tilauksessa.tilaus_nro
GROUP BY asiakas.nimi
ORDER BY kokonaishinnat DESC;
