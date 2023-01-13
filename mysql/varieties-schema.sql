CREATE TABLE varieties (
	id INT AUTO_INCREMENT PRIMARY KEY,
    varietyName VARCHAR(155) NOT NULL UNIQUE,
    plantType VARCHAR(155) NOT NULL,
    dateCreated TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE varietiesURLs (
	id INT AUTO_INCREMENT PRIMARY KEY,
    varietyID INT NOT NULL,
    varietyURL VARCHAR(155) NOT NULL,
    dateCreated TIMESTAMP NOT NULL DEFAULT NOW(),
    
    FOREIGN KEY(varietyID) REFERENCES varieties(id)
);

CREATE TABLE varietiesPhotos (
	id INT AUTO_INCREMENT PRIMARY KEY,
    varietyID INT NOT NULL,
    imgURL VARCHAR(155) NOT NULL,
    dateCreated TIMESTAMP NOT NULL DEFAULT NOW(),
    
    FOREIGN KEY(varietyID) REFERENCES varieties(id)
);

-- DROP TABLE varietiesPhotos, varietiesURLs ;