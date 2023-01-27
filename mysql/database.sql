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
    
    FOREIGN KEY(varietyID) REFERENCES varieties(id) ON DELETE CASCADE
);

CREATE TABLE varietiesPhotos (
	id INT AUTO_INCREMENT PRIMARY KEY,
	varietyID INT NOT NULL,
	imgURL VARCHAR(155) NOT NULL,
	dateCreated TIMESTAMP NOT NULL DEFAULT NOW(),
	editDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
	FOREIGN KEY(varietyID) REFERENCES varieties(id) ON DELETE CASCADE
);



/* batch schemas */

CREATE TABLE trays (
	id INT AUTO_INCREMENT PRIMARY KEY,
	size INT NOT NULL DEFAULT 1,
	trayName VARCHAR(55) UNIQUE NOT NULL,
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
	editDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
	FOREIGN KEY(varietyID) REFERENCES varieties(id) ON DELETE CASCADE,
	FOREIGN KEY(trayID) REFERENCES trays(id) ON DELETE CASCADE
);

CREATE TABLE batchComments (
	id INT AUTO_INCREMENT PRIMARY KEY,
	batchID INT NOT NULL,
	batchComment VARCHAR(255) NOT NULL,
	createdDate DATETIME NOT NULL DEFAULT NOW(),
	editDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
	FOREIGN KEY(batchID) REFERENCES batches(id) ON DELETE CASCADE
);

CREATE TABLE batchMeasurements (
	id INT AUTO_INCREMENT PRIMARY KEY,
	batchID INT NOT NULL,
	measurement INT NOT NULL,
	createdDate DATETIME NOT NULL DEFAULT NOW(),
	editDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
	FOREIGN KEY(batchID) REFERENCES batches(id) ON DELETE CASCADE
);

CREATE TABLE batchPhotos (
	id INT AUTO_INCREMENT PRIMARY KEY,
	batchID INT NOT NULL,
	imgURL VARCHAR(155) NOT NULL,
	createdDate DATETIME NOT NULL DEFAULT NOW(),
	editDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
	FOREIGN KEY(batchID) REFERENCES batches(id) ON DELETE CASCADE
    
);

/* plant schemas */

CREATE TABLE pots (
	id INT AUTO_INCREMENT PRIMARY KEY,
	size VARCHAR(55) NOT NULL ,
	potName VARCHAR(55) UNIQUE NOT NULL,
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
	editDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
	FOREIGN KEY(varietyID) REFERENCES varieties(id) ON DELETE CASCADE,
	FOREIGN KEY(potID) REFERENCES pots(id) ON DELETE CASCADE,
	FOREIGN KEY(batchID) REFERENCES batches(id) ON DELETE CASCADE
);

CREATE TABLE plantsComments (
	id INT AUTO_INCREMENT PRIMARY KEY,
	plantID INT NOT NULL,
	plantComment VARCHAR(255) NOT NULL,
	createdDate TIMESTAMP NOT NULL DEFAULT NOW(),
	editDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	FOREIGN KEY(plantID) REFERENCES plants(id) ON DELETE CASCADE
);

CREATE TABLE plantsMeasurements (
	id INT AUTO_INCREMENT PRIMARY KEY,
	plantID INT NOT NULL,
	measurement INT NOT NULL,
	createdDate TIMESTAMP NOT NULL DEFAULT NOW(),
	editDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	FOREIGN KEY(plantID) REFERENCES plants(id) ON DELETE CASCADE
);

CREATE TABLE plantsPhotos (
	id INT AUTO_INCREMENT PRIMARY KEY,
	plantID INT NOT NULL,
	imgURL VARCHAR(155) NOT NULL,
	createdDate TIMESTAMP NOT NULL DEFAULT NOW(),
	editDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	FOREIGN KEY(plantID) REFERENCES plants(id) ON DELETE CASCADE   
);

/* HASHES SCHEMA */

CREATE TABLE hashes (
    hashID VARCHAR(45) NOT NULL,
    IDType VARCHAR(45) NOT NULL,
    ForeignID INT NOT NULL,
    createdDate TIMESTAMP NOT NULL DEFAULT NOW(),
	editDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (IDType, ForeignID)
);

/* varieties data */

INSERT INTO varieties (varietyName, plantType) 
VALUES 	('hundreds & thousands', 'tomato'),
		('black cherry', 'tomato'),
        ('bonsai', 'tomato'),
        ('aftershock', 'tomato'),
        ('millefleur', 'tomato'),
        ('cherry falls', 'tomato'),
        ('agata', 'potato'),
        ('almond', 'potato'),
        ('champion', 'potato'),
        ('espirit', 'potato'),
        ('anaheim', 'chilli'),
        ('cayenne', 'chilli'),
        ('jalapeno', 'chilli'),
        ('sarrano', 'chilli');

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

INSERT INTO trays (size, trayName)
VALUES  (24, 'Molina'),
        (24, 'Herrero'),
        (24, 'Blesa'),
        (24, 'Gallardo'),
        (24, 'Aguilar'),
        (24, 'Rubio'),
        (24, 'Bravo'),
        (24, 'Cruz'),
        (24, 'Lorenzo'),
        (24, 'Ferrer'),
        (24, 'Vargas'),
        (24, 'Ruiz'),
        (24, 'Herrera'),
        (24, 'Guerrero'),
        (24, 'Ramos'),
        (24, 'Mora'),
        (24, 'Castro');

INSERT INTO batches (varietyID, trayID, qtyPlanted, qtyGerminated, sewnDate, germinatedDate, activeStatus)
VALUES  (1,1,12,7,'2023-01-12 14:43:12','2023-02-05 12:04:23', 0),
        (2,1,12,5,'2023-01-12 14:49:11','2023-01-30 20:30:18', 0),
        (3,2,12,3,'2023-01-12 14:59:23','2023-02-13 01:07:37', 0),
        (4,2,12,11,'2023-01-12 15:03:41','2023-02-02 19:53:14', 0),
        (5,3,12,9,'2023-01-12 15:07:27','2023-01-27 14:59:55', 0),
        (6,3,12,10,'2023-01-12 15:19:17','2023-01-28 00:02:10', 0),
        (1,4,12,6,'2023-01-23 11:10:12','2023-02-28 06:22:46', 1),
        (2,4,12,12,'2023-01-23 11:23:16','2023-02-10 23:01:22', 1),
        (3,5,8,7,'2023-01-23 11:30:23','2023-02-12 07:30:22', 1),
        (4,5,12,8,'2023-01-23 12:06:45','2023-02-21 12:33:07', 1),
        (5,6,7,11,'2023-01-23 12:12:23','2023-02-19 06:35:46', 1),
        (6,6,12,3,'2023-01-23 12:27:16','2023-02-24 00:01:07', 1);

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

INSERT INTO pots (size, potName)
VALUES  ('large', 'Castillo'),
        ('large', 'Odonnell'),
        ('large', 'Gregory'),
        ('large', 'Mcgee'),
        ('large', 'Brennan'),
        ('large', 'Harrison'),
        ('large', 'Winters'),
        ('large', 'Moran'),
        ('large', 'Miller'),
        ('large', 'Conway'),
        ('medium', 'Holmes'),
        ('medium', 'Duncan'),
        ('medium', 'Chambers'),
        ('medium', 'Hopkins'),
        ('medium', 'Larson'),
        ('medium', 'Sanford'),
        ('medium', 'Osborn'),
        ('medium', 'Miranda'),
        ('small', 'Wallace'),
        ('small', 'Landry'),
        ('small', 'Lee'),
        ('small', 'Foster'),
        ('small', 'Combs'),
        ('small', 'Santana'),
        ('small', 'Stein'),
        ('small', 'Lambert'),
        ('small', 'Lowe'),
        ('small', 'West');

INSERT INTO plants (varietyID, potID, batchID,repottedDate1)
VALUES  (1,11,1, '2023-03-02 14:39:22'),
        (1,12,1, '2023-03-02 14:13:50'),
        (1,13,1, '2023-03-02 15:22:47'),
        (2,14,2, '2023-03-02 13:23:18'),
        (2,15,2, '2023-03-02 14:54:25'),
        (2,16,2, '2023-03-02 13:36:50'),
        (3,17,3, '2023-03-02 13:24:13'),
        (3,18,3, '2023-03-02 13:29:45'),
        (3,19,3, '2023-03-02 14:24:51'),
        (3,20,3, '2023-03-02 15:27:55'),
        (4,21,4, '2023-03-02 14:33:57'),
        (4,22,4, '2023-03-02 15:30:30'),
        (4,23,4, '2023-03-02 15:17:46'),
        (4,23,4, '2023-03-02 13:21:47'),
        (5,23,5, '2023-03-02 13:30:04'),
        (5,23,5, '2023-03-02 14:45:59'),
        (6,23,6, '2023-03-02 14:18:35'),
        (6,23,6, '2023-03-02 15:42:51');

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


/* HASHES TABLE DATA */

INSERT INTO hashes (hashID, IDType, ForeignID)
VALUES  ('88ba6b14d5a4db4648b1b146289a3915', 'trays', 1),
        ('ce4d65c14cd5359bab003be3ca84310d', 'trays', 2),
        ('4b19a3fa14d772c0a48f96e46eed1ea1', 'trays', 3),
        ('5ff5d526fe651ebab073f9e53007dc45', 'trays', 4),
        ('7b554154008af5aa921db9de648f4fb8', 'trays', 5),
        ('8488db19d0695ca7301f8f321ebd8906', 'trays', 6),
        ('fe1c9b4061482ab60265bca2000a0275', 'trays', 7),
        ('3ed3ab9df01c2357876c25da88692cda', 'trays', 8),
        ('a32dce883062c3326a1e6fd7350df7c1', 'trays', 9),
        ('160fd7c730a6b1201f07a20106db8bda', 'trays', 10),
        ('8752ea3c3c824c1807e3b9b2cd970747', 'trays', 11),
        ('fbfab90a2d3d151aae7202860d8a22dd', 'trays', 12),
        ('966df67753abbeb7b87148ec6d5277d1', 'trays', 13),
        ('e6e5970c8f927ba03cb749f150e2c74b', 'trays', 14),
        ('d514dc875cef7c7e1dc7df9d588e12f6', 'trays', 15),
        ('85470058a907c0bb2a8ee8eb7475ed22', 'trays', 16),
        ('d3b285f9e7a4ff5f1817335fac896dfb', 'trays', 17),
        ('c85b217497fcf6f5421a15172ed77ccf', 'pots', 1),
        ('a1b936c228843ab8c68f086a1ffcd52e', 'pots', 2),
        ('be6702cb34c5e64f91c8577eb5eef8c3', 'pots', 3),
        ('958a965f0187df66cd1f4d2467a15dd3', 'pots', 4),
        ('131221d5911e73309e77a00b01eadc81', 'pots', 5),
        ('be49ff3770536889a8efc7eb0f1f5ff6', 'pots', 6),
        ('6a12bcc5384540b62ef5e9a6904d8ff9', 'pots', 7),
        ('7642e692bf5e99427400325b5404c744', 'pots', 8),
        ('944233b545b46886075c72a548fb7249', 'pots', 9),
        ('6150b5ba7094bf58f2f588dedb870761', 'pots', 10),
        ('63d1d734b8a9729fc5bcae2d8e03f049', 'pots', 11),
        ('bb45a15abbb9c2c2abdd7850712f01c1', 'pots', 12),
        ('5c503af41d9e7f68028d651dc3b54f90', 'pots', 13),
        ('55d8bfa8001280cfdbf2a57b54d57d7e', 'pots', 14),
        ('59fefd5701e7574d824bb557a48754fb', 'pots', 15),
        ('80985c21765ebeb2a2d34c3629f863e5', 'pots', 16),
        ('01f70a494f5fd8e2faff03fc2c3cef51', 'pots', 17),
        ('1c124eac52f5a1121b65f0542ee83ae2', 'pots', 18),
        ('153f6551fd5721a7d3dbc66f91235262', 'pots', 19),
        ('be3faa7f23d159917fbe4081e457b096', 'pots', 20),
        ('25de2fa75c4bb76aaa1a55439fe8cddb', 'pots', 21),
        ('366c05e71c6e6d87a53ce104ca24fcd4', 'pots', 22),
        ('e12e7f372024a4390a4f9ac967bb2a80', 'pots', 23),
        ('7c8527a268e3630ede0a8ff8aeeea237', 'pots', 24),
        ('7d21246440307cbeba330ee5c4a43b4b', 'pots', 25),
        ('10a229f9775ceea094cf79a3e235ae42', 'pots', 26),
        ('ddd1368bbc80893420645e84c1b8491b', 'pots', 27),
        ('e77a1355ad3989dbcb5a8dc00007e9c7', 'pots', 28),
        ('3cd1c8678a31919d8b90a167a63542ea', 'bacthes', 1),
        ('ac209f2a91881557782992646f733154', 'bacthes', 2),
        ('7c8091a42c71039c0b7cd5d5fcf53b1a', 'bacthes', 3),
        ('37538e1706128713afd20791718222d5', 'bacthes', 4),
        ('4c99420de72282e6df50f03d4e5c2445', 'bacthes', 5),
        ('889613fe6bb597e990a1f30e1a180d3a', 'bacthes', 6),
        ('d2f5599bddf89d6d9b4a629e4a9baf91', 'bacthes', 7),
        ('9f8c6958cfc949aa6cf09263c4138b86', 'bacthes', 8),
        ('3154e414838be9ca804055d49659852f', 'bacthes', 9),
        ('4e507a01837fa624508649ba66a45058', 'bacthes', 10),
        ('5ca1509a832a169f2e7807ede910d5dc', 'bacthes', 11),
        ('2e17b1975bfa9dad82e4fefd6c29cd29', 'bacthes', 12),
        ('9441c1217c4aac8e87ae78f19d0f35f8', 'plants', 1),
        ('39da0f75c5d3b69b885be99f302f527a', 'plants', 2),
        ('4a76de300060c44c2c073bf37459701b', 'plants', 3),
        ('82a8403b093cec9cbb8e582805bd939b', 'plants', 4),
        ('299c00a50b02a078e1a89e1bb2515288', 'plants', 5),
        ('219b9ba0ec60a3663e5b878e45c73083', 'plants', 6),
        ('9a86969558bcb7447b551105337ed065', 'plants', 7),
        ('5b4fb2260f58f6fd1d927d1dbab72656', 'plants', 8),
        ('738ed8dbacd8785debc43c74965303cf', 'plants', 9),
        ('15f6d4e98d8d144be9113db7b59d19db', 'plants', 10),
        ('49e89256a739b4c3a714397dd9cd6949', 'plants', 11),
        ('185e8602bb7ccc480583db8ff31a94fa', 'plants', 12),
        ('51f4e3f3e5101eeacaa4e298c336f33c', 'plants', 13),
        ('462eb88dbeaa3b4da6aea7faff4324ad', 'plants', 14),
        ('87bd991b41339c569f7a7861b0a07c40', 'plants', 15),
        ('318cbe69539ba628c243861e35c70f3d', 'plants', 16),
        ('fd86bae5b593fb364162700c5893ed67', 'plants', 17),
        ('dc8225008bf50e6f6ede5c5353899313', 'plants', 18);
        

        
