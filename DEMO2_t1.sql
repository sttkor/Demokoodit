DROP TABLE IF EXISTS Tehtävät;
CREATE TABLE "Tehtävät" ( 
"id" INTEGER PRIMARY KEY,
"otsikko" TEXT, 
"kuvaus" TEXT, 
"takaraja" TEXT, 
"suoritettu" BOOLEAN 
);
CREATE INDEX id ON Tehtävät(otsikko);

INSERT INTO Tehtävät(otsikko, kuvaus, takaraja, suoritettu) VALUES ("Tehtävä1", "Todista fubinin lause", "30.9.2026", "TRUE");
INSERT INTO Tehtävät(otsikko, kuvaus, takaraja, suoritettu) VALUES ("Tehtävä2", "Väritä värikuva", "30.9.2026", "FALSE");
INSERT INTO Tehtävät(otsikko, kuvaus, takaraja, suoritettu) VALUES ("Tehtävä3", "Tee isänpäiväkortti", "7.11.2026", "FALSE");

SELECT *
FROM Tehtävät