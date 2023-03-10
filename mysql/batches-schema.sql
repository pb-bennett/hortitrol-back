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