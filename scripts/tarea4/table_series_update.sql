
CREATE TABLE SERIES_TO_UPDATE
(ID INTEGER NOT NULL,
ART_DISCRETO_ID_OLD INTEGER NOT NULL,
ART_DISCRETO_ID_NEW INTEGER NOT NULL,
FECHA TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
UPDATED CHAR(1) DEFAULT 'F' NOT NULL,
PRIMARY KEY (ID));