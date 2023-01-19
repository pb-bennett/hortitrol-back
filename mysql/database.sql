DROP DATABASE IF EXISTS hortitrol;

CREATE DATABASE hortitrol;
USE hortitrol;

/* variety schemas */

CREATE TABLE varieties (
	id INT AUTO_INCREMENT PRIMARY KEY,
	varietyName VARCHAR(155) NOT NULL UNIQUE,
	plantType VARCHAR(155) NOT NULL,
	dateCreated TIMESTAMP NOT NULL DEFAULT NOW(),
	editDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE varietiesURLs (
	id INT AUTO_INCREMENT PRIMARY KEY,
	varietyID INT NOT NULL,
	varietyURL VARCHAR(155) NOT NULL,
	dateCreated TIMESTAMP NOT NULL DEFAULT NOW(),
	editDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    FOREIGN KEY(varietyID) REFERENCES varieties(id)
);

CREATE TABLE varietiesPhotos (
	id INT AUTO_INCREMENT PRIMARY KEY,
	varietyID INT NOT NULL,
	imgURL VARCHAR(155) NOT NULL,
	dateCreated TIMESTAMP NOT NULL DEFAULT NOW(),
	editDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
	FOREIGN KEY(varietyID) REFERENCES varieties(id)
);



/* batch schemas */

CREATE TABLE trays (
	id INT AUTO_INCREMENT PRIMARY KEY,
	size INT NOT NULL DEFAULT 1,
	trayName VARCHAR(55) UNIQUE NOT NULL,
	hashID VARCHAR(45),
	createdDate DATETIME NOT NULL DEFAULT NOW(),
	editDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE batches (
	id INT AUTO_INCREMENT PRIMARY KEY,
	varietyID INT NOT NULL,
	trayID INT NOT NULL,
	activeStatus INT NOT NULL DEFAULT 1,
	qtyPlanted INT NOT NULL DEFAULT 1,
	qtyGerminated INT NOT NULL DEFAULT 0,
	sewnDate DATETIME NOT NULL DEFAULT NOW(),
	germinatedDate DATETIME,
	trayPositons VARCHAR(155),
	hashID VARCHAR(45),
	editDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
	FOREIGN KEY(varietyID) REFERENCES varieties(id),
	FOREIGN KEY(trayID) REFERENCES trays(id)
);

CREATE TABLE batchComments (
	id INT AUTO_INCREMENT PRIMARY KEY,
	batchID INT NOT NULL,
	batchComment VARCHAR(255) NOT NULL,
	createdDate DATETIME NOT NULL DEFAULT NOW(),
	editDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
	FOREIGN KEY(batchID) REFERENCES batches(id) 
);

CREATE TABLE batchMeasurements (
	id INT AUTO_INCREMENT PRIMARY KEY,
	batchID INT NOT NULL,
	measurement INT NOT NULL,
	createdDate DATETIME NOT NULL DEFAULT NOW(),
	editDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
	FOREIGN KEY(batchID) REFERENCES batches(id) 
);

CREATE TABLE batchPhotos (
	id INT AUTO_INCREMENT PRIMARY KEY,
	batchID INT NOT NULL,
	imgURL VARCHAR(155) NOT NULL,
	createdDate DATETIME NOT NULL DEFAULT NOW(),
	editDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
	FOREIGN KEY(batchID) REFERENCES batches(id) 
    
);

/* plant schemas */

CREATE TABLE pots (
	id INT AUTO_INCREMENT PRIMARY KEY,
	size VARCHAR(55) NOT NULL ,
	potName VARCHAR(55) UNIQUE NOT NULL,
	hashID VARCHAR(45) UNIQUE NOT NULL,
	activeStatus INT NOT NULL DEFAULT 1,
	createdDate DATETIME NOT NULL DEFAULT NOW(),
	editDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE plants (
	id INT AUTO_INCREMENT PRIMARY KEY,
	varietyID INT NOT NULL,
	potID INT NOT NULL,
	batchID INT DEFAULT 0,
	activeStatus INT NOT NULL DEFAULT 1,
	repottedDate1 DATETIME NOT NULL DEFAULT NOW(),
	repottedDate2 DATETIME,
	hashID VARCHAR(45),
	editDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
	FOREIGN KEY(varietyID) REFERENCES varieties(id),
	FOREIGN KEY(potID) REFERENCES pots(id),
	FOREIGN KEY(batchID) REFERENCES batches(id)
);

CREATE TABLE plantsComments (
	id INT AUTO_INCREMENT PRIMARY KEY,
	plantID INT NOT NULL,
	plantComment VARCHAR(255) NOT NULL,
	createdDate TIMESTAMP NOT NULL DEFAULT NOW(),
	editDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	FOREIGN KEY(plantID) REFERENCES plants(id)
);

CREATE TABLE plantsMeasurements (
	id INT AUTO_INCREMENT PRIMARY KEY,
	plantID INT NOT NULL,
	measurement INT NOT NULL,
	createdDate TIMESTAMP NOT NULL DEFAULT NOW(),
	editDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	FOREIGN KEY(plantID) REFERENCES plants(id)
);

CREATE TABLE plantsPhotos (
	id INT AUTO_INCREMENT PRIMARY KEY,
	plantID INT NOT NULL,
	imgURL VARCHAR(155) NOT NULL,
	createdDate TIMESTAMP NOT NULL DEFAULT NOW(),
	editDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	FOREIGN KEY(plantID) REFERENCES plants(id)    
);

/* varieties data */

INSERT INTO varieties (varietyName, plantType) 
VALUES 	('hundreds & thousands', 'tomato'),
		('black Cherry', 'tomato'),
        ('bonsai', 'tomato'),
        ('aftershock', 'tomato'),
        ('millefleur', 'tomato'),
        ('cherry falls', 'tomato');

INSERT INTO varietiesURLs (varietyID, varietyURL)
VALUES	(1, 'https://tomatprat.no/collections/tomatfro-1/products/hundreds-thousands-1'),
		(2, 'https://tomatprat.no/collections/tomatfro-1/products/black-cherry'),
        (3,'https://tomatprat.no/collections/tomatfro-1/products/bonsai'),
        (4,'https://tomatprat.no/collections/tomatfro-1/products/aftershock'),
        (5,'https://tomatprat.no/collections/tomatfro-1/products/millefleur'),
        (6,'https://tomatprat.no/collections/tomatfro-1/products/cherry-falls'),
        (1,'https://renaissancefarms.org/product/hundreds-and-thousands-tomato/'),
        (2,'https://www.gardenersworld.com/plants/lycopersicon-esculentum-black-cherry/'),
        (3,'https://renaissancefarms.org/product/bonsai-micro-dwarf-tomato/'),
        (4,'https://merakiseeds.com/aftershock-dwarf-tomato'),
        (5,'https://renaissancefarms.org/product/millefleur-tomato/'),
        (6,'https://www.plantsofdistinction.co.uk/small-fruit/small-fruit-tomatoes/tomato-cherry-falls-0506');
	
INSERT INTO varietiesPhotos (varietyID, imgURL)
VALUES	(1, 'hundreds-thousands-001'),
		(1, 'hundreds-thousands-002'),
        (1, 'hundreds-thousands-003'),
        (2, 'black-cherry-001'),
        (2, 'black-cherry-002'),
        (2, 'black-cherry-003'),
        (3, 'bonsai-001'),
        (3, 'bonsai-002'),
        (3, 'bonsai-003'),
        (4, 'aftershock-001'),
        (4, 'aftershock-002'),
        (4, 'aftershock-003'),
        (5, 'millefleur-001'),
        (5, 'millefleur-002'),
        (5, 'millefleur-003'),
        (6, 'cherry-falls-001'),
        (6, 'cherry-falls-002'),
        (6, 'cherry-falls-003');
  

/* batches data */

INSERT INTO trays (size, trayName, hashID)
VALUES  (24, 'Molina', 'c1413613314bcfb83ff97aec563afc7d'),
        (24, 'Herrero', 'a83cbc2bee44057d1f659925b260457a'),
        (24, 'Blesa', '73fc2eb4abb47f532f54cd096b3fc8b2'),
        (24, 'Gallardo', '4836e7cde92389558a7afd0f3362559e'),
        (24, 'Aguilar', '3bdf7a5837fe585f27713efacc72b201'),
        (24, 'Rubio', '15d1080e94707390ea9bf762f87c888f'),
        (24, 'Bravo', '2da8b51fe60c4a75d6a6d1bdc2c28781'),
        (24, 'Cruz', 'ac9cbad076e4f9d969fef4aab79698fa'),
        (24, 'Lorenzo', 'cc8aff471357ea13c7cc18946a34241b'),
        (24, 'Ferrer', '9bb351675b7e8c9ed5ef1475a468a41c'),
        (24, 'Vargas', '5c73b66faecf6186dced82533d95e9f4'),
        (24, 'Ruiz', '04dccd2c02fcb910a56c1c20bd1542c1'),
        (24, 'Herrera', 'fb5f58d9e64f86f3d3d81e8fcdb5b75b'),
        (24, 'Guerrero', 'bef90762eca2a777abd8a6e5ae6626bd'),
        (24, 'Ramos', 'd96003581165b15091cc292d977b56fc'),
        (24, 'Mora', '68246671e02399f5897a715367fecab3'),
        (24, 'Castro', '1708c27caa56c8e7630b46341f4d0a84');

INSERT INTO batches (varietyID, trayID, qtyPlanted, qtyGerminated, sewnDate, germinatedDate, hashID, activeStatus)
VALUES  (1,1,12,7,'2023-01-12 14:43:12','2023-02-05 12:04:23','731291aad18c7f622ab2dedb26dd9c9b', 0),
        (2,1,12,5,'2023-01-12 14:49:11','2023-01-30 20:30:18','66a553d3362783ef32cd4520e7010e0e', 0),
        (3,2,12,3,'2023-01-12 14:59:23','2023-02-13 01:07:37','cd148edf91003ea4d82d675bd08b0558', 0),
        (4,2,12,11,'2023-01-12 15:03:41','2023-02-02 19:53:14','4d939b045d42b2f33ada1b9581db6436', 0),
        (5,3,12,9,'2023-01-12 15:07:27','2023-01-27 14:59:55','a4312362c8ab91925f30bd1f9628d9e5', 0),
        (6,3,12,10,'2023-01-12 15:19:17','2023-01-28 00:02:10','80eb1ab6891c1312b27548d871748cb8', 0),
        (1,4,12,6,'2023-01-23 11:10:12','2023-02-28 06:22:46','731291aad18c7f622ab2dedb26dd9c9b', 1),
        (2,4,12,12,'2023-01-23 11:23:16','2023-02-10 23:01:22','66a553d3362783ef32cd4520e7010e0e', 1),
        (3,5,8,7,'2023-01-23 11:30:23','2023-02-12 07:30:22','cd148edf91003ea4d82d675bd08b0558', 1),
        (4,5,12,8,'2023-01-23 12:06:45','2023-02-21 12:33:07','4d939b045d42b2f33ada1b9581db6436', 1),
        (5,6,7,11,'2023-01-23 12:12:23','2023-02-19 06:35:46','a4312362c8ab91925f30bd1f9628d9e5', 1),
        (6,6,12,3,'2023-01-23 12:27:16','2023-02-24 00:01:07','80eb1ab6891c1312b27548d871748cb8', 1);

INSERT INTO batchComments (batchID, batchComment, createdDate)
VALUES  (1, '5 extra seeds in the packet, bonus!  Used potting soil.', '2023-01-12 14:47:12'),
        (2, 'Seeds look a bit odd.  Used potting soil.', '2023-01-12 14:52:12'),
        (3, 'Used potting soil.', '2023-01-12 15:01:12'),
        (4, '3 too few seeds in pack :(  Used potting soil.', '2023-01-12 15:04:12'),
        (5, 'Cat attack!  Hope we not lost any seeds.', '2023-01-12 15:10:12'),
        (6, 'Used potting soil.', '2023-01-12 15:25:12'),
        (7, 'First of the second round of planting. All smooth.  Potting soil.', '2023-01-23 11:12:15'),
        (8, 'Potting soil. Some wastage.', '2023-01-23 11:25:15'),
        (9, 'Potting soil. All seeds used up - only 8 of planned 12 planted.' ,'2023-01-23 11:34:15'),
        (10, 'Potting soil. All good, nothing to see here.' ,'2023-01-23 12:10:15'),
        (11, 'USed potting soil again, 7 of 12 planted.  Run out of seeds.','2023-01-23 12:15:15' ),
        (12, 'Last of potting soil used up.  Possibly too little in some pots.', '2023-01-23 12:34:16');

/* plants data */

INSERT INTO pots (size, potName, hashID)
VALUES  ('large', 'Castillo', 'e55c920bf4f815ca053cef5f12ac99e0'),
        ('large', 'Odonnell', '23290acc6d3ebe035ad627de9463d878'),
        ('large', 'Gregory', '07d3d4e0ac3aa3e09d23cf553d71a2de'),
        ('large', 'Mcgee', 'a785971682ded0402000a9931ebf2e87'),
        ('large', 'Brennan', '60e24325eededaa9beaedd2e4a90150f'),
        ('large', 'Harrison', '85709c074c3c4fb40c22fdf52f612733'),
        ('large', 'Winters', '762475b17f7ea47df8e031bd140ab48d'),
        ('large', 'Moran', '06103beb307a2cef6b752280456cad4d'),
        ('large', 'Miller', 'b7d7e0683103e4a07115cba8639d1bb8'),
        ('large', 'Conway', 'bd0aa035a69ebec02d916f04bc4f4257'),
        ('medium', 'Holmes', '58cdcb7e89c99bc03b6f749fc69cb3f8'),
        ('medium', 'Duncan', '94e8026a757b6b27efc4da2196933a26'),
        ('medium', 'Chambers', 'fcf726be31f965ae8a6c2c30b0c68f4d'),
        ('medium', 'Hopkins', '3218bad95da2663cbfc66e51f65bf041'),
        ('medium', 'Larson', '6a08800337d9feb82d6f7ae48f33fa5c'),
        ('medium', 'Sanford', '20e1d52505a8ff245e7c7a8b3e3d263d'),
        ('medium', 'Osborn', '56126ae097ca298c8d637021d711be8f'),
        ('medium', 'Miranda', '9a1a202c554de7fbce6ea9ab50a73d25'),
        ('small', 'Wallace', '16119afc1060c2eff8d48a43b640aca4'),
        ('small', 'Landry', 'b02d5b7cc2371034de2a50880513789b'),
        ('small', 'Lee', '54c84cb22b629baa0281cddd5aacf5c6'),
        ('small', 'Foster', 'd1c3981128b0c2a860c5c2329196e645'),
        ('small', 'Combs', '3b3c4a581b7cbbdfaf9cd813a6010041'),
        ('small', 'Santana', '1235576b3d686db2ed9f3c80fd52b144'),
        ('small', 'Stein', '8fdbf975a49514455789681969802f3c'),
        ('small', 'Lambert', '246175b4adc79951119cef68501ea07a'),
        ('small', 'Lowe', 'a14dfd04d7e7e60e2a38f94bafbb7671'),
        ('small', 'West', 'b8b93973107f0ffcfa0b46a373d4fba4');

INSERT INTO plants (varietyID, potID, batchID, hashID,repottedDate1)
VALUES  (1,11,1,'d8b79fe7300775f442eee80bb1064561', '2023-03-02 14:39:22'),
        (1,12,1,'7c39f05ed5b0cd203d936f0866ddab8c', '2023-03-02 14:13:50'),
        (1,13,1,'25008bd20e3c2540ee01316f48c0018f', '2023-03-02 15:22:47'),
        (2,14,2,'66b90dc72dc34227db714cb240969fb2', '2023-03-02 13:23:18'),
        (2,15,2,'587bd454288a798b6eab882b536530f5', '2023-03-02 14:54:25'),
        (2,16,2,'aa4e107ca89cb0e32ca568b2428e4b22', '2023-03-02 13:36:50'),
        (3,17,3,'f1f160404814531b97b0a8192097277b', '2023-03-02 13:24:13'),
        (3,18,3,'d3fad8f6d056c2205778ed65df5146f0', '2023-03-02 13:29:45'),
        (3,19,3,'ec2bed98a59f314dc5c8b2879e5b3baa', '2023-03-02 14:24:51'),
        (3,20,3,'34d951881a8f1d5ab37466eb08b933e7', '2023-03-02 15:27:55'),
        (4,21,4,'75f626790624eb3cc28060c170b50025', '2023-03-02 14:33:57'),
        (4,22,4,'8bed15261a35b3d227213e7d20372190', '2023-03-02 15:30:30'),
        (4,23,4,'493299df66d96d167e917e9723074265', '2023-03-02 15:17:46'),
        (4,23,4,'98c4479cdfbd6c43d7b78e13d680d1c5', '2023-03-02 13:21:47'),
        (5,23,5,'8c215dad0e112228d1ab1bb7823fea88', '2023-03-02 13:30:04'),
        (5,23,5,'7162b66cadfcd4c7dc7147251de01d6f', '2023-03-02 14:45:59'),
        (6,23,6,'3a210c339aaa1ccf8512862cf39c43f5', '2023-03-02 14:18:35'),
        (6,23,6,'28b599ae84c0b5317ed9cf8211cc7fdd', '2023-03-02 15:42:51');

INSERT INTO plantsComments (plantID, plantComment, createdDate)
VALUES  (1,'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean    massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis', '2023-03-02 14:40:22'),
        (1,'Lorem ipsum dolor sit amet, explicari rationibus sea ne, ex est aperiri inimicus scripserit. Mea ad augue viderer. At tibique honestatis nec. Sit meis paulo ne. Has cu diceret suavitate. His an ferri inani molestiae, per id vidit dicta nostrum.', '2023-03-05 14:40:23'),
        (1,'Lorem ipsum dolor sit amet, explicari rationibus sea ne, ex est aperiri inimicus scripserit. Mea ad augue viderer. At tibique honestatis nec. Sit meis paulo ne. Has cu diceret suavitate. His an ferri inani molestiae, per id vidit dicta nostrum.', '2023-03-15 11:40:22'),
        (2,'Lorem ipsum dolor sit amet, explicari rationibus sea ne, ex est aperiri inimicus scripserit. Mea ad augue viderer. At tibique honestatis nec. Sit meis paulo ne. Has cu diceret suavitate. His an ferri inani molestiae, per id vidit dicta nostrum.', '2023-03-15 11:40:22'),
        (2,'Lorem ipsum dolor sit amet, explicari rationibus sea ne, ex est aperiri inimicus scripserit. Mea ad augue viderer. At tibique honestatis nec. Sit meis paulo ne. Has cu diceret suavitate. His an ferri inani molestiae, per id vidit dicta nostrum.', '2023-03-03 11:40:22'),
        (3,'Lorem ipsum dolor sit amet, explicari rationibus sea ne, ex est aperiri inimicus scripserit. Mea ad augue viderer. At tibique honestatis nec. Sit meis paulo ne. Has cu diceret suavitate. His an ferri inani molestiae, per id vidit dicta nostrum.', '2023-03-19 11:40:22'),
        (4,'Lorem ipsum dolor sit amet, explicari rationibus sea ne, ex est aperiri inimicus scripserit. Mea ad augue viderer. At tibique honestatis nec. Sit meis paulo ne. Has cu diceret suavitate. His an ferri inani molestiae, per id vidit dicta nostrum.', '2023-03-30 11:40:22'),
        (4,'Lorem ipsum dolor sit amet, explicari rationibus sea ne, ex est aperiri inimicus scripserit. Mea ad augue viderer. At tibique honestatis nec. Sit meis paulo ne. Has cu diceret suavitate. His an ferri inani molestiae, per id vidit dicta nostrum.', '2023-03-20 11:40:22'),
        (5,'Lorem ipsum dolor sit amet, explicari rationibus sea ne, ex est aperiri inimicus scripserit. Mea ad augue viderer. At tibique honestatis nec. Sit meis paulo ne. Has cu diceret suavitate. His an ferri inani molestiae, per id vidit dicta nostrum.', '2023-03-18 11:40:22'),
        (6,'Lorem ipsum dolor sit amet, explicari rationibus sea ne, ex est aperiri inimicus scripserit. Mea ad augue viderer. At tibique honestatis nec. Sit meis paulo ne. Has cu diceret suavitate. His an ferri inani molestiae, per id vidit dicta nostrum.', '2023-03-09 11:40:22'),
        (7,'Lorem ipsum dolor sit amet, explicari rationibus sea ne, ex est aperiri inimicus scripserit. Mea ad augue viderer. At tibique honestatis nec. Sit meis paulo ne. Has cu diceret suavitate. His an ferri inani molestiae, per id vidit dicta nostrum.', '2023-03-05 11:40:22'),
        (8,'Lorem ipsum dolor sit amet, explicari rationibus sea ne, ex est aperiri inimicus scripserit. Mea ad augue viderer. At tibique honestatis nec. Sit meis paulo ne. Has cu diceret suavitate. His an ferri inani molestiae, per id vidit dicta nostrum.', '2023-03-15 11:40:22'),
        (9,'Lorem ipsum dolor sit amet, explicari rationibus sea ne, ex est aperiri inimicus scripserit. Mea ad augue viderer. At tibique honestatis nec. Sit meis paulo ne. Has cu diceret suavitate. His an ferri inani molestiae, per id vidit dicta nostrum.', '2023-03-15 11:40:22'),
        (9,'Lorem ipsum dolor sit amet, explicari rationibus sea ne, ex est aperiri inimicus scripserit. Mea ad augue viderer. At tibique honestatis nec. Sit meis paulo ne. Has cu diceret suavitate. His an ferri inani molestiae, per id vidit dicta nostrum.', '2023-03-06 11:40:22'),
        (10,'Lorem ipsum dolor sit amet, explicari rationibus sea ne, ex est aperiri inimicus scripserit. Mea ad augue viderer. At tibique honestatis nec. Sit meis paulo ne. Has cu diceret suavitate. His an ferri inani molestiae, per id vidit dicta nostrum.', '2023-03-24 11:40:22'),
        (11,'Lorem ipsum dolor sit amet, explicari rationibus sea ne, ex est aperiri inimicus scripserit. Mea ad augue viderer. At tibique honestatis nec. Sit meis paulo ne. Has cu diceret suavitate. His an ferri inani molestiae, per id vidit dicta nostrum.', '2023-03-29 11:40:22'),
        (11,'Lorem ipsum dolor sit amet, explicari rationibus sea ne, ex est aperiri inimicus scripserit. Mea ad augue viderer. At tibique honestatis nec. Sit meis paulo ne. Has cu diceret suavitate. His an ferri inani molestiae, per id vidit dicta nostrum.', '2023-03-16 11:40:22'),
        (13,'Lorem ipsum dolor sit amet, explicari rationibus sea ne, ex est aperiri inimicus scripserit. Mea ad augue viderer. At tibique honestatis nec. Sit meis paulo ne. Has cu diceret suavitate. His an ferri inani molestiae, per id vidit dicta nostrum.', '2023-03-19 11:40:22'),
        (14,'Lorem ipsum dolor sit amet, explicari rationibus sea ne, ex est aperiri inimicus scripserit. Mea ad augue viderer. At tibique honestatis nec. Sit meis paulo ne. Has cu diceret suavitate. His an ferri inani molestiae, per id vidit dicta nostrum.', '2023-03-06 11:40:22'),
        (15,'Lorem ipsum dolor sit amet, explicari rationibus sea ne, ex est aperiri inimicus scripserit. Mea ad augue viderer. At tibique honestatis nec. Sit meis paulo ne. Has cu diceret suavitate. His an ferri inani molestiae, per id vidit dicta nostrum.', '2023-03-15 11:40:22'),
        (17,'Lorem ipsum dolor sit amet, explicari rationibus sea ne, ex est aperiri inimicus scripserit. Mea ad augue viderer. At tibique honestatis nec. Sit meis paulo ne. Has cu diceret suavitate. His an ferri inani molestiae, per id vidit dicta nostrum.', '2023-03-15 11:40:22'),
        (18,'Lorem ipsum dolor sit amet, explicari rationibus sea ne, ex est aperiri inimicus scripserit. Mea ad augue viderer. At tibique honestatis nec. Sit meis paulo ne. Has cu diceret suavitate. His an ferri inani molestiae, per id vidit dicta nostrum.', '2023-03-17 11:40:22'),
        (18,'Lorem ipsum dolor sit amet, explicari rationibus sea ne, ex est aperiri inimicus scripserit. Mea ad augue viderer. At tibique honestatis nec. Sit meis paulo ne. Has cu diceret suavitate. His an ferri inani molestiae, per id vidit dicta nostrum.', '2023-03-19 11:40:22'),
        (18,'Lorem ipsum dolor sit amet, explicari rationibus sea ne, ex est aperiri inimicus scripserit. Mea ad augue viderer. At tibique honestatis nec. Sit meis paulo ne. Has cu diceret suavitate. His an ferri inani molestiae, per id vidit dicta nostrum.', '2023-03-21 11:40:22');
