INSERT INTO varieties (varietyName, plantType, slug) 
VALUES 	('Hundreds & Thousands', 'Tomato', 'hundreds-thousands'),
		('Black Cherry', 'Tomato','black-cherry'),
        ('Bonsai', 'Tomato', 'bonsai'),
        ('Aftershock', 'Tomato', 'aftershock'),
        ('Millefleur', 'Tomato', 'millefleur'),
        ('Cherry Falls', 'Tomato', 'cherry-falls');

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
        (6, 'cherry-falls-003')
  
  SELECT * FROM varieties
	JOIN varietiesURLs ON varietiesURLs.varietyID = varieties.id; 
        

        
        
        

        