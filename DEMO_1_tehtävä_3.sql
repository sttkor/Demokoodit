SELECT SUM (määrä*kplhinta) as tilaushinta
FROM tuote_tilauksessa
GROUP BY tilaus_nro
ORDER BY tilaushinta DESC limit 1;