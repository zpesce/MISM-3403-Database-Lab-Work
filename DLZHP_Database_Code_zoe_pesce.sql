DROP SCHEMA IF EXISTS neu_student_zoe_pesce_labwork;
CREATE SCHEMA neu_student_zoe_pesce_labwork;
USE neu_student_zoe_pesce_labwork;

DROP TABLE IF EXISTS leases, tenantphone, tenant, apartment, inspects, inspector, building, managerphone, manager;

#manager, managerphone, building, inspector, inspects, apartment, tenant, tenantphone, leases

CREATE TABLE manager
(
  ManagerID VARCHAR(5) NOT NULL,
  ManagerFName VARCHAR(20) NOT NULL,
  ManagerLName VARCHAR(20) NOT NULL,
  ManagerBDate Date NOT NULL,
  ManagerSalary Decimal(10,2) NOT NULL,
  ManagerBonus Decimal(10,2),
  MResBuildingID VARCHAR(5),
  PRIMARY KEY (ManagerID)
);

CREATE TABLE managerphone
(
  ManagerID VARCHAR(5) NOT NULL,
  ManagerPhone VARCHAR(14) NOT NULL,
  PRIMARY KEY (ManagerID, ManagerPhone),
  FOREIGN KEY (ManagerID) REFERENCES manager(ManagerID)
);

CREATE TABLE building
(
  BuildingID VARCHAR(5) NOT NULL,
  BuildingAddress VARCHAR(60) NOT NULL,
  BNoOfFloors INT NOT NULL,
  BPricePurchased Decimal(10,2) NOT NULL,
  BYearPurchased Int NOT NULL,
  BYearBuilt INT NOT NULL,
  ManagerID VARCHAR(5) NOT NULL,
  PRIMARY KEY (BuildingID),
  FOREIGN KEY (ManagerID) REFERENCES manager(ManagerID)
);

CREATE TABLE inspector
(
  InspectorID VARCHAR(5) NOT NULL,
  InspectorFName VARCHAR(20) NOT NULL,
  InspectorLName VARCHAR(20) NOT NULL,
  PRIMARY KEY (InspectorID)
);

CREATE TABLE inspects
(
  BuildingID VARCHAR(5) NOT NULL,
  InspectorID VARCHAR(5) NOT NULL,
  DateLast Date NOT NULL,
  DateNext Date NOT NULL,
  PRIMARY KEY (BuildingID, InspectorID),
  FOREIGN KEY (BuildingID) REFERENCES building(BuildingID),
  FOREIGN KEY (InspectorID) REFERENCES inspector(InspectorID)
);

CREATE TABLE apartment
(
  BuildingID VARCHAR(5) NOT NULL,
  AptNo INT NOT NULL,
  AptNoOfRooms INT NOT NULL,
  AptNoOfBedroom INT NOT NULL,
  AptRentAmt Decimal(10,2) NOT NULL,
  PRIMARY KEY (BuildingID, AptNo),
  FOREIGN KEY (BuildingID) REFERENCES building(BuildingID)
);

CREATE TABLE tenant
(
  TenantID VARCHAR(5) NOT NULL,
  TenantFName VARCHAR(20) NOT NULL,
  TenantLName VARCHAR(20) NOT NULL,
  TenantBDate Date NOT NULL,
  PRIMARY KEY (TenantID)
);

CREATE TABLE tenantphone
(
  TenantID VARCHAR(5) NOT NULL,
  TenantPhone VARCHAR(14) NOT NULL,
  PRIMARY KEY (TenantID, TenantPhone),
  FOREIGN KEY (TenantID) REFERENCES tenant(TenantID)
);

CREATE TABLE leases
(
  BuildingID VARCHAR(5) NOT NULL,
  AptNo INT NOT NULL,
  TenantID VARCHAR(5) NOT NULL,
  TMoveInDate Date NOT NULL,
  TLeaseTermDate Date NOT NULL,
  PRIMARY KEY (BuildingID, AptNo, TenantID),
  FOREIGN KEY (BuildingID, AptNo) REFERENCES apartment(BuildingID, AptNo),
  FOREIGN KEY (TenantID) REFERENCES tenant(TenantID)
);


INSERT INTO manager (ManagerID, ManagerFName, ManagerLName, ManagerBDate, ManagerSalary, ManagerBonus) VALUES ('M1','Tony','Hernandez','1979-06-10',73000.00,2500.00);
INSERT INTO manager (ManagerID, ManagerFName, ManagerLName, ManagerBDate, ManagerSalary, MResBuildingID) VALUES ('M2','Dan','Pesce','1966-08-24',105000.00,'B1');

INSERT INTO managerphone VALUES ('M1','212-555-0810');
INSERT INTO managerphone VALUES ('M1','212-555-1738');
INSERT INTO managerphone VALUES ('M2','914-555-2555');
INSERT INTO managerphone VALUES ('M2','914-555-6063');
INSERT INTO managerphone VALUES ('M2','914-555-6510');

INSERT INTO building VALUES ('B1','30 Downing St. New York, NY 10014',6,2000000.00,2002,1901,'M2');
INSERT INTO building VALUES ('B2','3242 Middletown Rd. Bronx, NY 10465',4,350000.00,1995,1932,'M1');
INSERT INTO building VALUES ('B3','3244 Middletown Rd. Bronx, NY 10465',4,300000.00,1993,1932,'M1');
INSERT INTO building VALUES ('B4','1628 Kennelworth Pl. Bronx, NY 10465',4,550000.00,2007,1921,'M1');
INSERT INTO building VALUES ('B5','1634 Kennelworth Pl. Bronx, NY 10465',2,250000.00,2008,1947,'M1');
INSERT INTO building VALUES ('B6','3268 Middletown Rd. Bronx, NY 10465',3,480000.00,2006,1935,'M1');

INSERT INTO inspector VALUES ('I1','John','Peabody');
INSERT INTO inspector VALUES ('I2','Ralph','Eames');
INSERT INTO inspector VALUES ('I3','Anthony','Zaro');

INSERT INTO inspects VALUES ('B1','I3','2017-03-15','2018-05-15');
INSERT INTO inspects VALUES ('B2','I1','2017-04-01','2018-06-08');
INSERT INTO inspects VALUES ('B3','I2','2017-02-15','2018-07-10');
INSERT INTO inspects VALUES ('B4','I2','2017-08-17','2018-09-20');
INSERT INTO inspects VALUES ('B5','I1','2017-10-26','2018-11-15');
INSERT INTO inspects VALUES ('B6','I1','2017-09-18','2018-09-20');

INSERT INTO apartment VALUES ('B1',1,2,1,2500.00);
INSERT INTO apartment VALUES ('B1',2,2,1,2500.00);
INSERT INTO apartment VALUES ('B1',3,4,1,4500.00);
INSERT INTO apartment VALUES ('B1',4,6,2,6500.00);
INSERT INTO apartment VALUES ('B2',1,5,2,1600.00);
INSERT INTO apartment VALUES ('B2',2,4,1,1250.00);
INSERT INTO apartment VALUES ('B2',3,4,1,1200.00);
INSERT INTO apartment VALUES ('B2',4,4,1,1250.00);
INSERT INTO apartment VALUES ('B2',5,4,1,1475.00);
INSERT INTO apartment VALUES ('B2',6,5,2,1600.00);
INSERT INTO apartment VALUES ('B2',7,2,1,850.00);
INSERT INTO apartment VALUES ('B3',1,6,2,1500.00);
INSERT INTO apartment VALUES ('B3',2,4,1,1400.00);
INSERT INTO apartment VALUES ('B3',3,4,1,1200.00);
INSERT INTO apartment VALUES ('B3',4,4,1,1250.00);
INSERT INTO apartment VALUES ('B3',5,4,1,950.00);
INSERT INTO apartment VALUES ('B3',6,3,1,1300.00);
INSERT INTO apartment VALUES ('B3',7,2,1,1100.00);
INSERT INTO apartment VALUES ('B4',1,7,3,1800.00);
INSERT INTO apartment VALUES ('B4',2,7,3,2000.00);
INSERT INTO apartment VALUES ('B4',3,5,2,1600.00);
INSERT INTO apartment VALUES ('B4',4,5,2,1750.00);
INSERT INTO apartment VALUES ('B5',1,3,1,1500.00);
INSERT INTO apartment VALUES ('B5',2,3,1,1300.00);
INSERT INTO apartment VALUES ('B6',1,6,2,1600.00);
INSERT INTO apartment VALUES ('B6',2,5,2,1350.00);
INSERT INTO apartment VALUES ('B6',3,3,1,1300.00);
INSERT INTO apartment VALUES ('B6',4,2,1,1100.00);

INSERT INTO tenant VALUES ('T1','Andrew','Pesce','1992-06-05');
INSERT INTO tenant VALUES ('T2','Hannah','Pesce','1998-06-10');
INSERT INTO tenant VALUES ('T3','Dan','Pesce','1966-08-24');
INSERT INTO tenant VALUES ('T4','Lucia','Pesce','1967-03-25');
INSERT INTO tenant VALUES ('T5','Rebecca','Johnson','1985-07-06');
INSERT INTO tenant VALUES ('T6','Catherine','Turlington','1984-02-03');
INSERT INTO tenant VALUES ('T7','Debbie','Freedman','1970-04-21');
INSERT INTO tenant VALUES ('T8','Vivian','Charles','1962-07-20');
INSERT INTO tenant VALUES ('T9','Tim','Arnold','1967-12-30');
INSERT INTO tenant VALUES ('T10','Rita','Wright','1968-05-10');
INSERT INTO tenant VALUES ('T11','Chris','Lloyd','1988-09-13');
INSERT INTO tenant VALUES ('T12','Bill','Rogers','1965-08-04');
INSERT INTO tenant VALUES ('T13','Carol','Coscia','1955-03-16');
INSERT INTO tenant VALUES ('T14','Yvonne','Snell','1963-04-07');
INSERT INTO tenant VALUES ('T15','Colleen','Smith','1982-10-10');
INSERT INTO tenant VALUES ('T16','Nicholas','Cruz','1985-10-20');
INSERT INTO tenant VALUES ('T17','Rudy','Rose','1977-02-18');
INSERT INTO tenant VALUES ('T18','Milton','Mason','1964-06-22');
INSERT INTO tenant VALUES ('T19','Jennifer','Apple','1961-01-25');
INSERT INTO tenant VALUES ('T20','Tony','Cooke','1976-01-27');
INSERT INTO tenant VALUES ('T21','Ashley','Bloomberg','1958-01-18');
INSERT INTO tenant VALUES ('T22','Lizbeth','Simpson','1974-06-12');
INSERT INTO tenant VALUES ('T23','Mario','Dutti','1966-11-19');
INSERT INTO tenant VALUES ('T24','Manual','Perry','1983-12-03');
INSERT INTO tenant VALUES ('T25','George','Clark','1981-08-29');
INSERT INTO tenant VALUES ('T26','Peter','Pan','1982-09-10');
INSERT INTO tenant VALUES ('T27','Emily','Bell','1983-03-14');
INSERT INTO tenant VALUES ('T28','Chris','Cooper','1986-05-04');

INSERT INTO tenantphone VALUES ('T1','212-555-3245');
INSERT INTO tenantphone VALUES ('T2','914-555-6509');
INSERT INTO tenantphone VALUES ('T2','212-555-2555');
INSERT INTO tenantphone VALUES ('T3','914-555-6063');
INSERT INTO tenantphone VALUES ('T3','914-555-2555');
INSERT INTO tenantphone VALUES ('T3','914-555-6510');
INSERT INTO tenantphone VALUES ('T4','914-555-6684');
INSERT INTO tenantphone VALUES ('T4','914-555-2555');
INSERT INTO tenantphone VALUES ('T5','413-555-5687');
INSERT INTO tenantphone VALUES ('T5','212-555-8006');
INSERT INTO tenantphone VALUES ('T6','796-555-3475');
INSERT INTO tenantphone VALUES ('T6','212-555-7468');
INSERT INTO tenantphone VALUES ('T7','948-555-9302');
INSERT INTO tenantphone VALUES ('T8','738-555-2835');
INSERT INTO tenantphone VALUES ('T9','934-555-1029');
INSERT INTO tenantphone VALUES ('T9','212-555-3927');
INSERT INTO tenantphone VALUES ('T10','832-555-6930');
INSERT INTO tenantphone VALUES ('T11','938-555-4830');
INSERT INTO tenantphone VALUES ('T11','212-555-2234');
INSERT INTO tenantphone VALUES ('T12','349-555-7730');
INSERT INTO tenantphone VALUES ('T13','834-555-3928');
INSERT INTO tenantphone VALUES ('T13','212-555-8854');
INSERT INTO tenantphone VALUES ('T14','254-555-6054');
INSERT INTO tenantphone VALUES ('T14','212-555-5936');
INSERT INTO tenantphone VALUES ('T15','530-555-3928');
INSERT INTO tenantphone VALUES ('T16','720-555-3948');
INSERT INTO tenantphone VALUES ('T17','648-555-2039');
INSERT INTO tenantphone VALUES ('T18','182-555-3759');
INSERT INTO tenantphone VALUES ('T19','134-555-2261');
INSERT INTO tenantphone VALUES ('T19','212-555-7993');
INSERT INTO tenantphone VALUES ('T20','453-555-3344');
INSERT INTO tenantphone VALUES ('T20','212-555-9952');
INSERT INTO tenantphone VALUES ('T21','326-555-1284');
INSERT INTO tenantphone VALUES ('T22','372-555-0384');
INSERT INTO tenantphone VALUES ('T23','843-555-3027');
INSERT INTO tenantphone VALUES ('T23','212-555-0674');
INSERT INTO tenantphone VALUES ('T24','947-555-0384');
INSERT INTO tenantphone VALUES ('T24','212-555-0085');
INSERT INTO tenantphone VALUES ('T25','382-555-3221');
INSERT INTO tenantphone VALUES ('T25','212-555-4038');
INSERT INTO tenantphone VALUES ('T26','418-555-6748');
INSERT INTO tenantphone VALUES ('T27','418-555-9744');
INSERT INTO tenantphone VALUES ('T28','638-555-9853');

INSERT INTO leases VALUES ('B1',1,'T1','2016-06-01','2018-06-01');
INSERT INTO leases VALUES ('B1',2,'T2','2016-08-01','2018-08-01');
INSERT INTO leases VALUES ('B1',3,'T3','2009-03-01','2019-03-01');
INSERT INTO leases VALUES ('B1',4,'T3','2015-03-01','2019-03-01');
INSERT INTO leases VALUES ('B1',4,'T4','2015-03-01','2019-03-01');
INSERT INTO leases VALUES ('B2',1,'T5','2016-08-01','2018-08-01');
INSERT INTO leases VALUES ('B2',2,'T6','2015-05-01','2018-05-01');
INSERT INTO leases VALUES ('B2',3,'T7','2008-04-01','2019-04-01');
INSERT INTO leases VALUES ('B2',4,'T8','2015-02-01','2019-02-01');
INSERT INTO leases VALUES ('B2',5,'T9','2017-10-01','2018-10-01');
INSERT INTO leases VALUES ('B2',6,'T10','2016-07-01','2018-07-01');
INSERT INTO leases VALUES ('B2',7,'T11','2017-08-01','2018-08-01');
INSERT INTO leases VALUES ('B3',1,'T12','2010-04-01','2019-04-01');
INSERT INTO leases VALUES ('B3',2,'T13','2014-07-01','2018-07-01');
INSERT INTO leases VALUES ('B3',3,'T14','2015-04-01','2019-04-01');
INSERT INTO leases VALUES ('B3',4,'T15','2016-05-01','2018-05-01');
INSERT INTO leases VALUES ('B3',5,'T16','2015-09-01','2018-09-01');
INSERT INTO leases VALUES ('B3',6,'T17','2014-04-01','2019-04-01');
INSERT INTO leases VALUES ('B3',7,'T18','2015-07-01','2018-07-01');
INSERT INTO leases VALUES ('B4',1,'T19','2015-03-01','2019-03-01');
INSERT INTO leases VALUES ('B4',2,'T20','2015-05-01','2018-05-01');
INSERT INTO leases VALUES ('B4',3,'T21','2017-10-01','2018-10-01');
INSERT INTO leases VALUES ('B4',4,'T22','2016-11-01','2018-11-01');
INSERT INTO leases VALUES ('B5',1,'T23','2018-03-01','2019-03-01');
INSERT INTO leases VALUES ('B5',2,'T24','2017-04-01','2019-04-01');
INSERT INTO leases VALUES ('B6',1,'T25','2017-05-01','2018-05-01');
INSERT INTO leases VALUES ('B6',2,'T26','2006-04-01','2019-04-01');
INSERT INTO leases VALUES ('B6',3,'T27','2017-01-01','2018-01-01');
INSERT INTO leases VALUES ('B6',4,'T28','2018-04-01','2019-04-01');

# Add foreign key constraint for MResBuildingID
ALTER TABLE manager
ADD CONSTRAINT fkresidesin
FOREIGN KEY (MResBuildingID) REFERENCES building(BuildingID);

#Create new Table phonetype
CREATE TABLE phonetype
(
  PhoneTypeID CHAR(1) NOT NULL,
  PhoneType VARCHAR(6) NOT NULL,
  PRIMARY KEY (PhoneTypeID)
);

INSERT INTO phonetype VALUES ('M','Mobile');
INSERT INTO phonetype VALUES ('H','Home');

#Alter Tables managerphone and tenantphone to include a foreign key column that references PhoneTypeID in phonetype
ALTER TABLE managerphone
ADD MPhoneType CHAR(1) NOT NULL;

ALTER TABLE tenantphone
ADD TPhoneType CHAR(1) NOT NULL;

#Update managerphone and tenantphone Tables to include values in the new MPhoneType and TPhoneType columns, respectively
UPDATE managerphone set MPhoneType = 'M' where ManagerPhone like '%212-555-0810%';
UPDATE managerphone set MPhoneType = 'H' where ManagerPhone like '%212-555-1738%';
UPDATE managerphone set MPhoneType = 'H' where ManagerPhone like '%914-555-2555%';
UPDATE managerphone set MPhoneType = 'M' where ManagerPhone like '%914-555-6063%';
UPDATE managerphone set MPhoneType = 'M' where ManagerPhone like '%914-555-6510%';

UPDATE tenantphone set TPhoneType = 'M' where TenantPhone like '%212-555-3245%';
UPDATE tenantphone set TPhoneType = 'M' where TenantPhone like '%914-555-6509%';
UPDATE tenantphone set TPhoneType = 'H' where TenantPhone like '%212-555-2555%';
UPDATE tenantphone set TPhoneType = 'H' where TenantPhone like '%914-555-6063%';
UPDATE tenantphone set TPhoneType = 'H' where TenantPhone like '%914-555-2555%';
UPDATE tenantphone set TPhoneType = 'M' where TenantPhone like '%914-555-6510%';
UPDATE tenantphone set TPhoneType = 'M' where TenantPhone like '%914-555-6684%';
UPDATE tenantphone set TPhoneType = 'H' where TenantPhone like '%914-555-2555%';
UPDATE tenantphone set TPhoneType = 'M' where TenantPhone like '%413-555-5687%';
UPDATE tenantphone set TPhoneType = 'H' where TenantPhone like '%212-555-8006%';
UPDATE tenantphone set TPhoneType = 'M' where TenantPhone like '%796-555-3475%';
UPDATE tenantphone set TPhoneType = 'H' where TenantPhone like '%212-555-7468%';
UPDATE tenantphone set TPhoneType = 'M' where TenantPhone like '%948-555-9302%';
UPDATE tenantphone set TPhoneType = 'M' where TenantPhone like '%738-555-2835%';
UPDATE tenantphone set TPhoneType = 'M' where TenantPhone like '%934-555-1029%';
UPDATE tenantphone set TPhoneType = 'H' where TenantPhone like '%212-555-3927%';
UPDATE tenantphone set TPhoneType = 'M' where TenantPhone like '%832-555-6930%';
UPDATE tenantphone set TPhoneType = 'M' where TenantPhone like '%938-555-4830%';
UPDATE tenantphone set TPhoneType = 'H' where TenantPhone like '%212-555-2234%';
UPDATE tenantphone set TPhoneType = 'M' where TenantPhone like '%349-555-7730%';
UPDATE tenantphone set TPhoneType = 'M' where TenantPhone like '%834-555-3928%';
UPDATE tenantphone set TPhoneType = 'H' where TenantPhone like '%212-555-8854%';
UPDATE tenantphone set TPhoneType = 'M' where TenantPhone like '%254-555-6054%';
UPDATE tenantphone set TPhoneType = 'H' where TenantPhone like '%212-555-5936%';
UPDATE tenantphone set TPhoneType = 'M' where TenantPhone like '%530-555-3928%';
UPDATE tenantphone set TPhoneType = 'M' where TenantPhone like '%720-555-3948%';
UPDATE tenantphone set TPhoneType = 'M' where TenantPhone like '%648-555-2039%';
UPDATE tenantphone set TPhoneType = 'M' where TenantPhone like '%182-555-3759%';
UPDATE tenantphone set TPhoneType = 'M' where TenantPhone like '%134-555-2261%';
UPDATE tenantphone set TPhoneType = 'H' where TenantPhone like '%212-555-7993%';
UPDATE tenantphone set TPhoneType = 'M' where TenantPhone like '%453-555-3344%';
UPDATE tenantphone set TPhoneType = 'H' where TenantPhone like '%212-555-9952%';
UPDATE tenantphone set TPhoneType = 'M' where TenantPhone like '%326-555-1284%';
UPDATE tenantphone set TPhoneType = 'M' where TenantPhone like '%372-555-0384%';
UPDATE tenantphone set TPhoneType = 'M' where TenantPhone like '%843-555-3027%';
UPDATE tenantphone set TPhoneType = 'H' where TenantPhone like '%212-555-0674%';
UPDATE tenantphone set TPhoneType = 'M' where TenantPhone like '%947-555-0384%';
UPDATE tenantphone set TPhoneType = 'H' where TenantPhone like '%212-555-0085%';
UPDATE tenantphone set TPhoneType = 'M' where TenantPhone like '%382-555-3221%';
UPDATE tenantphone set TPhoneType = 'H' where TenantPhone like '%212-555-4038%';
UPDATE tenantphone set TPhoneType = 'M' where TenantPhone like '%418-555-6748%';
UPDATE tenantphone set TPhoneType = 'M' where TenantPhone like '%418-555-9744%';
UPDATE tenantphone set TPhoneType = 'M' where TenantPhone like '%638-555-9853%';

#Add foreign key constraints for managerphone and tenantphone for MPhoneType and TPhoneType, respectively
ALTER TABLE managerphone
ADD CONSTRAINT fkmphonetype
FOREIGN KEY (MPhoneType) REFERENCES phonetype(PhoneTypeID);

ALTER TABLE tenantphone
ADD CONSTRAINT fktphonetype
FOREIGN KEY (TPhoneType) REFERENCES phonetype(PhoneTypeID);

#New code to include phonetype Table in initial creation
DROP SCHEMA IF EXISTS neu_student_zoe_pesce_labwork;
CREATE SCHEMA neu_student_zoe_pesce_labwork;
USE neu_student_zoe_pesce_labwork;

CREATE TABLE phonetype (
  PhoneTypeID CHAR(1) NOT NULL,
  PhoneType VARCHAR(6) NOT NULL,
  PRIMARY KEY (PhoneTypeID)
);

CREATE TABLE manager
(
  ManagerID VARCHAR(5) NOT NULL,
  ManagerFName VARCHAR(20) NOT NULL,
  ManagerLName VARCHAR(20) NOT NULL,
  ManagerBDate Date NOT NULL,
  ManagerSalary Decimal(10,2) NOT NULL,
  ManagerBonus Decimal(10,2),
  MResBuildingID VARCHAR(5),
  PRIMARY KEY (ManagerID)
);

CREATE TABLE managerphone
(
  ManagerID VARCHAR(5) NOT NULL,
  ManagerPhone VARCHAR(14) NOT NULL,
  MPhoneType CHAR(1)NOT NULL,
  PRIMARY KEY (ManagerID, ManagerPhone),
  FOREIGN KEY (ManagerID) REFERENCES manager(ManagerID),
  FOREIGN KEY (MPhoneType) REFERENCES phonetype(PhoneTypeID)
);

CREATE TABLE building
(
  BuildingID VARCHAR(5) NOT NULL,
  BuildingAddress VARCHAR(60) NOT NULL,
  BNoOfFloors INT NOT NULL,
  BPricePurchased Decimal(10,2) NOT NULL,
  BYearPurchased Int NOT NULL,
  BYearBuilt INT NOT NULL,
  ManagerID VARCHAR(5) NOT NULL,
  PRIMARY KEY (BuildingID),
  FOREIGN KEY (ManagerID) REFERENCES manager(ManagerID)
);

CREATE TABLE inspector
(
  InspectorID VARCHAR(5) NOT NULL,
  InspectorFName VARCHAR(20) NOT NULL,
  InspectorLName VARCHAR(20) NOT NULL,
  PRIMARY KEY (InspectorID)
);

CREATE TABLE inspects
(
  BuildingID VARCHAR(5) NOT NULL,
  InspectorID VARCHAR(5) NOT NULL,
  DateLast Date NOT NULL,
  DateNext Date NOT NULL,
  PRIMARY KEY (BuildingID, InspectorID),
  FOREIGN KEY (BuildingID) REFERENCES building(BuildingID),
  FOREIGN KEY (InspectorID) REFERENCES inspector(InspectorID)
);

CREATE TABLE apartment
(
  BuildingID VARCHAR(5) NOT NULL,
  AptNo INT NOT NULL,
  AptNoOfRooms INT NOT NULL,
  AptNoOfBedroom INT NOT NULL,
  AptRentAmt Decimal(10,2) NOT NULL,
  PRIMARY KEY (BuildingID, AptNo),
  FOREIGN KEY (BuildingID) REFERENCES building(BuildingID)
);

CREATE TABLE tenant
(
  TenantID VARCHAR(5) NOT NULL,
  TenantFName VARCHAR(20) NOT NULL,
  TenantLName VARCHAR(20) NOT NULL,
  TenantBDate Date NOT NULL,
  PRIMARY KEY (TenantID)
);

CREATE TABLE tenantphone
(
  TenantID VARCHAR(5) NOT NULL,
  TenantPhone VARCHAR(14) NOT NULL,
  TPhoneType CHAR(1) NOT NULL,
  PRIMARY KEY (TenantID, TenantPhone),
  FOREIGN KEY (TenantID) REFERENCES tenant(TenantID),
  FOREIGN KEY (TPhoneType) REFERENCES phonetype(PhoneTypeID)
);

CREATE TABLE leases
(
  BuildingID VARCHAR(5) NOT NULL,
  AptNo INT NOT NULL,
  TenantID VARCHAR(5) NOT NULL,
  TMoveInDate Date NOT NULL,
  TLeaseTermDate Date NOT NULL,
  PRIMARY KEY (BuildingID, AptNo, TenantID),
  FOREIGN KEY (BuildingID, AptNo) REFERENCES apartment(BuildingID, AptNo),
  FOREIGN KEY (TenantID) REFERENCES tenant(TenantID)
);

INSERT INTO phonetype VALUES('M','Mobile');
INSERT INTO phonetype VALUES('H','Home');

INSERT INTO manager (ManagerID, ManagerFName, ManagerLName, ManagerBDate, ManagerSalary, ManagerBonus) VALUES ('M1','Tony','Hernandez','1979-06-10',73000.00,2500.00);
INSERT INTO manager (ManagerID, ManagerFName, ManagerLName, ManagerBDate, ManagerSalary, MResBuildingID) VALUES ('M2','Dan','Pesce','1966-08-24',105000.00,'B1');

INSERT INTO managerphone VALUES('M1','212-555-0810','M');
INSERT INTO managerphone VALUES('M1','212-555-1738','H');
INSERT INTO managerphone VALUES('M2','914-555-2555','H');
INSERT INTO managerphone VALUES('M2','914-555-6063','M');
INSERT INTO managerphone VALUES('M2','914-555-6510','M');

INSERT INTO building VALUES ('B1','30 Downing St. New York, NY 10014',6,2000000.00,2002,1901,'M2');
INSERT INTO building VALUES ('B2','3242 Middletown Rd. Bronx, NY 10465',4,350000.00,1995,1932,'M1');
INSERT INTO building VALUES ('B3','3244 Middletown Rd. Bronx, NY 10465',4,300000.00,1993,1932,'M1');
INSERT INTO building VALUES ('B4','1628 Kennelworth Pl. Bronx, NY 10465',4,550000.00,2007,1921,'M1');
INSERT INTO building VALUES ('B5','1634 Kennelworth Pl. Bronx, NY 10465',2,250000.00,2008,1947,'M1');
INSERT INTO building VALUES ('B6','3268 Middletown Rd. Bronx, NY 10465',3,480000.00,2006,1935,'M1');

INSERT INTO inspector VALUES ('I1','John','Peabody');
INSERT INTO inspector VALUES ('I2','Ralph','Eames');
INSERT INTO inspector VALUES ('I3','Anthony','Zaro');

INSERT INTO inspects VALUES ('B1','I3','2017-03-15','2018-05-15');
INSERT INTO inspects VALUES ('B2','I1','2017-04-01','2018-06-08');
INSERT INTO inspects VALUES ('B3','I2','2017-02-15','2018-07-10');
INSERT INTO inspects VALUES ('B4','I2','2017-08-17','2018-09-20');
INSERT INTO inspects VALUES ('B5','I1','2017-10-26','2018-11-15');
INSERT INTO inspects VALUES ('B6','I1','2017-09-18','2018-09-20');

INSERT INTO apartment VALUES ('B1',1,2,1,2500.00);
INSERT INTO apartment VALUES ('B1',2,2,1,2500.00);
INSERT INTO apartment VALUES ('B1',3,4,1,4500.00);
INSERT INTO apartment VALUES ('B1',4,6,2,6500.00);
INSERT INTO apartment VALUES ('B2',1,5,2,1600.00);
INSERT INTO apartment VALUES ('B2',2,4,1,1250.00);
INSERT INTO apartment VALUES ('B2',3,4,1,1200.00);
INSERT INTO apartment VALUES ('B2',4,4,1,1250.00);
INSERT INTO apartment VALUES ('B2',5,4,1,1475.00);
INSERT INTO apartment VALUES ('B2',6,5,2,1600.00);
INSERT INTO apartment VALUES ('B2',7,2,1,850.00);
INSERT INTO apartment VALUES ('B3',1,6,2,1500.00);
INSERT INTO apartment VALUES ('B3',2,4,1,1400.00);
INSERT INTO apartment VALUES ('B3',3,4,1,1200.00);
INSERT INTO apartment VALUES ('B3',4,4,1,1250.00);
INSERT INTO apartment VALUES ('B3',5,4,1,950.00);
INSERT INTO apartment VALUES ('B3',6,3,1,1300.00);
INSERT INTO apartment VALUES ('B3',7,2,1,1100.00);
INSERT INTO apartment VALUES ('B4',1,7,3,1800.00);
INSERT INTO apartment VALUES ('B4',2,7,3,2000.00);
INSERT INTO apartment VALUES ('B4',3,5,2,1600.00);
INSERT INTO apartment VALUES ('B4',4,5,2,1750.00);
INSERT INTO apartment VALUES ('B5',1,3,1,1500.00);
INSERT INTO apartment VALUES ('B5',2,3,1,1300.00);
INSERT INTO apartment VALUES ('B6',1,6,2,1600.00);
INSERT INTO apartment VALUES ('B6',2,5,2,1350.00);
INSERT INTO apartment VALUES ('B6',3,3,1,1300.00);
INSERT INTO apartment VALUES ('B6',4,2,1,1100.00);

INSERT INTO tenant VALUES ('T1','Andrew','Pesce','1992-06-05');
INSERT INTO tenant VALUES ('T2','Hannah','Pesce','1998-06-10');
INSERT INTO tenant VALUES ('T3','Dan','Pesce','1966-08-24');
INSERT INTO tenant VALUES ('T4','Lucia','Pesce','1967-03-25');
INSERT INTO tenant VALUES ('T5','Rebecca','Johnson','1985-07-06');
INSERT INTO tenant VALUES ('T6','Catherine','Turlington','1984-02-03');
INSERT INTO tenant VALUES ('T7','Debbie','Freedman','1970-04-21');
INSERT INTO tenant VALUES ('T8','Vivian','Charles','1962-07-20');
INSERT INTO tenant VALUES ('T9','Tim','Arnold','1967-12-30');
INSERT INTO tenant VALUES ('T10','Rita','Wright','1968-05-10');
INSERT INTO tenant VALUES ('T11','Chris','Lloyd','1988-09-13');
INSERT INTO tenant VALUES ('T12','Bill','Rogers','1965-08-04');
INSERT INTO tenant VALUES ('T13','Carol','Coscia','1955-03-16');
INSERT INTO tenant VALUES ('T14','Yvonne','Snell','1963-04-07');
INSERT INTO tenant VALUES ('T15','Colleen','Smith','1982-10-10');
INSERT INTO tenant VALUES ('T16','Nicholas','Cruz','1985-10-20');
INSERT INTO tenant VALUES ('T17','Rudy','Rose','1977-02-18');
INSERT INTO tenant VALUES ('T18','Milton','Mason','1964-06-22');
INSERT INTO tenant VALUES ('T19','Jennifer','Apple','1961-01-25');
INSERT INTO tenant VALUES ('T20','Tony','Cooke','1976-01-27');
INSERT INTO tenant VALUES ('T21','Ashley','Bloomberg','1958-01-18');
INSERT INTO tenant VALUES ('T22','Lizbeth','Simpson','1974-06-12');
INSERT INTO tenant VALUES ('T23','Mario','Dutti','1966-11-19');
INSERT INTO tenant VALUES ('T24','Manual','Perry','1983-12-03');
INSERT INTO tenant VALUES ('T25','George','Clark','1981-08-29');
INSERT INTO tenant VALUES ('T26','Peter','Pan','1982-09-10');
INSERT INTO tenant VALUES ('T27','Emily','Bell','1983-03-14');
INSERT INTO tenant VALUES ('T28','Chris','Cooper','1986-05-04');

INSERT INTO tenantphone VALUES('T1','212-555-3245','M');
INSERT INTO tenantphone VALUES('T2','914-555-6509','M');
INSERT INTO tenantphone VALUES('T2','212-555-2555','H');
INSERT INTO tenantphone VALUES('T3','914-555-6063','M');
INSERT INTO tenantphone VALUES('T3','914-555-2555','H');
INSERT INTO tenantphone VALUES('T3','914-555-6510','M');
INSERT INTO tenantphone VALUES('T4','914-555-6684','M');
INSERT INTO tenantphone VALUES('T4','914-555-2555','H');
INSERT INTO tenantphone VALUES('T5','413-555-5687','M');
INSERT INTO tenantphone VALUES('T5','212-555-8006','H');
INSERT INTO tenantphone VALUES('T6','796-555-3475','M');
INSERT INTO tenantphone VALUES('T6','212-555-7468','H');
INSERT INTO tenantphone VALUES('T7','948-555-9302','M');
INSERT INTO tenantphone VALUES('T8','738-555-2835','M');
INSERT INTO tenantphone VALUES('T9','934-555-1029','M');
INSERT INTO tenantphone VALUES('T9','212-555-3927','H');
INSERT INTO tenantphone VALUES('T10','832-555-6930','M');
INSERT INTO tenantphone VALUES('T11','938-555-4830','M');
INSERT INTO tenantphone VALUES('T11','212-555-2234','H');
INSERT INTO tenantphone VALUES('T12','349-555-7730','M');
INSERT INTO tenantphone VALUES('T13','834-555-3928','M');
INSERT INTO tenantphone VALUES('T13','212-555-8854','H');
INSERT INTO tenantphone VALUES('T14','254-555-6054','M');
INSERT INTO tenantphone VALUES('T14','212-555-5936','H');
INSERT INTO tenantphone VALUES('T15','530-555-3928','M');
INSERT INTO tenantphone VALUES('T16','720-555-3948','M');
INSERT INTO tenantphone VALUES('T17','648-555-2039','M');
INSERT INTO tenantphone VALUES('T18','182-555-3759','M');
INSERT INTO tenantphone VALUES('T19','134-555-2261','M');
INSERT INTO tenantphone VALUES('T19','212-555-7993','H');
INSERT INTO tenantphone VALUES('T20','453-555-3344','M');
INSERT INTO tenantphone VALUES('T20','212-555-9952','H');
INSERT INTO tenantphone VALUES('T21','326-555-1284','M');
INSERT INTO tenantphone VALUES('T22','372-555-0384','M');
INSERT INTO tenantphone VALUES('T23','843-555-3027','M');
INSERT INTO tenantphone VALUES('T23','212-555-0674','H');
INSERT INTO tenantphone VALUES('T24','947-555-0384','M');
INSERT INTO tenantphone VALUES('T24','212-555-0085','H');
INSERT INTO tenantphone VALUES('T25','382-555-3221','M');
INSERT INTO tenantphone VALUES('T25','212-555-4038','H');
INSERT INTO tenantphone VALUES('T26','418-555-6748','M');
INSERT INTO tenantphone VALUES('T27','418-555-9744','M');
INSERT INTO tenantphone VALUES('T28','638-555-9853','M');

INSERT INTO leases VALUES ('B1',1,'T1','2016-06-01','2018-06-01');
INSERT INTO leases VALUES ('B1',2,'T2','2016-08-01','2018-08-01');
INSERT INTO leases VALUES ('B1',3,'T3','2009-03-01','2019-03-01');
INSERT INTO leases VALUES ('B1',4,'T3','2015-03-01','2019-03-01');
INSERT INTO leases VALUES ('B1',4,'T4','2015-03-01','2019-03-01');
INSERT INTO leases VALUES ('B2',1,'T5','2016-08-01','2018-08-01');
INSERT INTO leases VALUES ('B2',2,'T6','2015-05-01','2018-05-01');
INSERT INTO leases VALUES ('B2',3,'T7','2008-04-01','2019-04-01');
INSERT INTO leases VALUES ('B2',4,'T8','2015-02-01','2019-02-01');
INSERT INTO leases VALUES ('B2',5,'T9','2017-10-01','2018-10-01');
INSERT INTO leases VALUES ('B2',6,'T10','2016-07-01','2018-07-01');
INSERT INTO leases VALUES ('B2',7,'T11','2017-08-01','2018-08-01');
INSERT INTO leases VALUES ('B3',1,'T12','2010-04-01','2019-04-01');
INSERT INTO leases VALUES ('B3',2,'T13','2014-07-01','2018-07-01');
INSERT INTO leases VALUES ('B3',3,'T14','2015-04-01','2019-04-01');
INSERT INTO leases VALUES ('B3',4,'T15','2016-05-01','2018-05-01');
INSERT INTO leases VALUES ('B3',5,'T16','2015-09-01','2018-09-01');
INSERT INTO leases VALUES ('B3',6,'T17','2014-04-01','2019-04-01');
INSERT INTO leases VALUES ('B3',7,'T18','2015-07-01','2018-07-01');
INSERT INTO leases VALUES ('B4',1,'T19','2015-03-01','2019-03-01');
INSERT INTO leases VALUES ('B4',2,'T20','2015-05-01','2018-05-01');
INSERT INTO leases VALUES ('B4',3,'T21','2017-10-01','2018-10-01');
INSERT INTO leases VALUES ('B4',4,'T22','2016-11-01','2018-11-01');
INSERT INTO leases VALUES ('B5',1,'T23','2018-03-01','2019-03-01');
INSERT INTO leases VALUES ('B5',2,'T24','2017-04-01','2019-04-01');
INSERT INTO leases VALUES ('B6',1,'T25','2017-05-01','2018-05-01');
INSERT INTO leases VALUES ('B6',2,'T26','2006-04-01','2019-04-01');
INSERT INTO leases VALUES ('B6',3,'T27','2017-01-01','2018-01-01');
INSERT INTO leases VALUES ('B6',4,'T28','2018-04-01','2019-04-01');

ALTER TABLE manager
ADD CONSTRAINT fkresidesin
FOREIGN KEY (MResBuildingID) REFERENCES building(BuildingID);

#Delete, Insert, Update Commands:

#Tenant T28, Chris, got a new job in Massachusetts and is moving out
DELETE FROM tenantphone WHERE TenantID = 'T28';
DELETE FROM leases WHERE TenantID = 'T28';
DELETE FROM tenant WHERE TenantID = 'T28';

#A new Tenant moves in to B6 Apt #4
INSERT INTO tenant VALUES ('T28','Sally','Stone','1980-11-13');
INSERT INTO tenantphone VALUES ('T28','653-555-0126','M');
INSERT INTO tenantphone VALUES ('T28','212-555-1818','H');
INSERT INTO leases VALUES ('B6',4,'T28','2018-05-01','2019-05-01');

#Hannah, T2, gets a family and friends discount on her rent and it is lowered to $2,000.00 a month
UPDATE apartment SET AptRentAmt = 2000.00 WHERE BuildingID = 'B1' AND AptNo = 2;

#Select and Group By Commands:

#DLZHP LLC is considering lowering rents by 5% and would like to see what each apartment would rent 
#for when AptRentAmt is decreased by 5% compared to what they're currently renting for
SELECT BuildingID, AptNo, AptRentAmt, AptRentAmt*0.95 FROM apartment;

#DLZHP LLC would like to see how many numbers they have recorded for each type of phone: mobile and home
SELECT TPhoneType, COUNT(*) FROM tenantphone GROUP BY TPhoneType;

#Extra Query:

#JOIN/NESTED
#Tony wants to throw a tenant appreciation party for B3 and would like a list of tenants
#who live in B3 that includes their full name, phone numbers, and phone types

SELECT t.TenantID, t.TenantFName, t.TenantLName, tp.TenantPhone, tp.TPhoneType, l.BuildingID 
FROM tenant t, tenantphone tp, leases l 
WHERE t.TenantID = tp.tenantID AND t.tenantID = l.TenantID AND l.TenantID IN (SELECT TenantID FROM leases WHERE BuildingID = 'B3')
ORDER BY l.TenantID;

