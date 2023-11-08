--USE master
USE TAT_1912840
Go

/* Populate Subject table */
INSERT INTO Subject
VALUES ('S001','Daniel Doppler','5 Beetle Avenue, Aberdeen');
INSERT INTO Subject
VALUES ('S002','Florence West','17 Green Crescent, Dundee');
INSERT INTO Subject
VALUES ('S003','Werner Flick','25A Grubb Street, Stonehaven');
INSERT INTO Subject
VALUES ('S004','Tiffany Smith','11 Green Crescent, Dundee');
INSERT INTO Subject
VALUES ('S005','Angela Ashe','113 Wasp Street, Aberdeen');


/* Populate Phone table */
INSERT INTO Phone
VALUES ('07123-123456');
INSERT INTO Phone
VALUES ('07777-111000');
INSERT INTO Phone
VALUES ('07555-246810');
INSERT INTO Phone
VALUES ('07101-484848');
INSERT INTO Phone
VALUES ('07896-102304');
INSERT INTO Phone
VALUES ('07777-534243');
INSERT INTO Phone
VALUES ('07493-285113');


/* Populate Business table */
INSERT INTO Business
VALUES ('Pink Lion Inn, Forfar','Sean Conran');
INSERT INTO Business
VALUES ('Irene’s Hair Salon, Stonehaven','Irene Jones');

--1939/07/30 00:00:00
/* Populate Test table */
INSERT INTO Test
VALUES ('2020/08/05 00:00:00','Negative','S001');
INSERT INTO Test
VALUES ('2020/08/10 00:00:00','Positive','S002');
INSERT INTO Test
VALUES ('2020/08/17 00:00:00','Negative','S003');
INSERT INTO Test
VALUES ('2020/08/22 00:00:00','Negative','S004');
INSERT INTO Test
VALUES ('2020/08/22 00:00:00','Negative','S005');
INSERT INTO Test
VALUES ('2020/09/03 00:00:00','Positive','S001');


/* Populate Visit table */
INSERT INTO Visit
VALUES ('2020/08/01 00:00:00',1,1,2);
INSERT INTO Visit
VALUES ('2020/08/01 00:00:00',2,2,2);
INSERT INTO Visit
VALUES ('2020/08/25 00:00:00',4,1,1);
INSERT INTO Visit
VALUES ('2020/08/25 00:00:00',2,7,1);
INSERT INTO Visit
VALUES ('2020/09/10 00:00:00',1,3,2);
INSERT INTO Visit
VALUES ('2020/09/15 00:00:00',3,2,1);


/* Populate Subject_Phone table */
INSERT INTO Subject_Phone
VALUES (1,'S001');
INSERT INTO Subject_Phone
VALUES (2,'S002');
INSERT INTO Subject_Phone
VALUES (3,'S003');
INSERT INTO Subject_Phone
VALUES (4,'S004');
INSERT INTO Subject_Phone
VALUES (5,'S004');
INSERT INTO Subject_Phone
VALUES (6,'S005');