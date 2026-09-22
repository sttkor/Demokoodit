DROP TABLE IF EXISTS Kirjailija;
CREATE TABLE Kirjailija (
	"id" INTEGER PRIMARY KEY,
	"nimi" TEXT,
	"syntymävuosi" INTEGER
	);
DROP TABLE IF EXISTS Kirja;
CREATE TABLE Kirja (
	"id" INTEGER PRIMARY KEY,
	"kirjailija_id" INTEGER,
	"syntymävuosi" INTEGER,
	"julkaisuvuosi" INTEGER,
	"sivumäärä" INTEGER,
FOREIGN KEY(kirjailija_id) REFERENCES Kirjailija(id)
);