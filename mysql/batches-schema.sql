CREATE TABLE trays (
	id INT AUTO_INCREMENT PRIMARY KEY,
    size INT NOT NULL DEFAULT 1,
    hashID VARCHAR(45)
);

CREATE TABLE batches (
	id INT AUTO_INCREMENT PRIMARY KEY,
    varietyID INT NOT NULL,
    trayID INT NOT NULL,
    activeStatus INT NOT NULL DEFAULT 1,
    qtyPlanted INT NOT NULL DEFAULT 1,
    qtyGerminated INT NOT NULL DEFAULT 0,
    sewnDate DATETIME NOT NULL DEFAULT now(),
    germinatedDate DATETIME,
    trayPositons VARCHAR(155),
    hashID VARCHAR(45),
    
    FOREIGN KEY(varietyID) REFERENCES varieties(id),
    FOREIGN KEY(trayID) REFERENCES trays(id)
);

CREATE TABLE batchComments (
	id INT AUTO_INCREMENT PRIMARY KEY,
	batchID INT NOT NULL,
    batchComment VARCHAR(255) NOT NULL,
    createdDate TIMESTAMP NOT NULL DEFAULT NOW(),
    
    FOREIGN KEY(batchID) REFERENCES batches(id) 
);

CREATE TABLE batchMeasurements (
	id INT AUTO_INCREMENT PRIMARY KEY,
	batchID INT NOT NULL,
    measurement INT NOT NULL,
    createdDate TIMESTAMP NOT NULL DEFAULT NOW(),
    
    FOREIGN KEY(batchID) REFERENCES batches(id) 
);

CREATE TABLE batchPhotos (
	id INT AUTO_INCREMENT PRIMARY KEY,
	batchID INT NOT NULL,
    imgURL VARCHAR(155) NOT NULL,
    createdDate TIMESTAMP NOT NULL DEFAULT NOW(),
    
    FOREIGN KEY(batchID) REFERENCES batches(id) 
    
);