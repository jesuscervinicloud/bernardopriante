CREATE TABLE SERIES_TO_UPDATE
(ID INTEGER NOT NULL,
SERIE VARCHAR(30) NOT NULL,
FECHA TIMESTAMP NOT NULL,
UPDATED CHAR(1) DEFAULT 'F',
PRIMARY KEY (ID))