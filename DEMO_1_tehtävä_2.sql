SELECT asiakas.id, nimi, COUNT(asiakas_id) AS tilausten_lukumaara
FROM asiakas LEFT JOIN tilaus
ON asiakas.id = asiakas_id
GROUP BY asiakas.id
ORDER BY tilausten_lukumaara DESC;
/* Käytännössä left join tuottaa oikean, koska se säilyttää asiakas taulusta myös ne asiakas
id:t jotka eivät täytä ehtoa asiakas.id = asiakas_id eli ne jotka eivät ole tilanneet mitään (eivät sisälly tilaukset tauluun) */