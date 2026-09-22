DROP TABLE IF EXISTS kurssi;
CREATE TABLE kurssi(
	"kurssikoodi" TEXT PRIMARY KEY,
	"Aine" TEXT,
	"Opettaja" TEXT NOT NULL
	);
	
DROP TABLE IF EXISTS demo;
CREATE TABLE demo(
	"koodi" INTEGER PRIMARY KEY,
	"tehty" BOOLEAN,
	"Viikko" INTEGER,
FOREIGN KEY(koodi) REFERENCES kurssi(kurssikoodi)
);
