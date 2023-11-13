USE TAT_1912840
Go

--####################################################
--Procedure ONE
--####################################################
CREATE PROCEDURE NumberLookup @num nvarchar(30)
AS

SELECT IIF(COUNT(phone)<1, 'Unrecognized',
(SELECT sub_name
FROM Subject, Subject_Phone, Phone
WHERE
	Phone.phone = @num AND
	Phone.phone_id = Subject_Phone.phone_id AND
	Subject_Phone.subject_id = Subject.subject_id)
) AS [Sub Name]

FROM Subject, Subject_Phone, Phone
WHERE
	Phone.phone = @num AND
	Phone.phone_id = Subject_Phone.phone_id AND
	Subject_Phone.subject_id = Subject.subject_id
;
GO




--####################################################
--Procedure TWO
--####################################################
CREATE PROCEDURE VisitArchive @date DATETIME
AS
BEGIN
if not exists (select * from sysobjects where name='Visit_Archive' and xtype='U')
		CREATE TABLE Visit_Archive (
        	visit_id	INT				NOT NULL,
			vdate		DATETIME  		NOT NULL,
			party_n		INT  			NOT NULL,
			phone_id	INT				NULL,
			busi_id		INT				NULL,
			CONSTRAINT pk_Visit_Archive_Visit PRIMARY KEY (visit_id),
			CONSTRAINT fk_Visit_Archive_Phone FOREIGN KEY (phone_id) REFERENCES Phone(phone_id)
			ON DELETE CASCADE ON UPDATE CASCADE,
			CONSTRAINT fk_Visit_Archive_Business FOREIGN KEY (busi_id) REFERENCES Business(busi_id)
			ON DELETE CASCADE ON UPDATE CASCADE
		)

INSERT INTO Visit_Archive
SELECT * 
FROM Visit
WHERE 
	vdate < DATEADD(day, -21, @date)


DELETE FROM Visit 
WHERE 
	vdate < DATEADD(day, -21, @date)


SELECT *
FROM Visit_Archive;

END
GO

--####################################################
--TEST BLOCK TWO
--####################################################
--TEST Procedure ONE
EXEC NumberLookup @num = '07123-123456'; --correct number
EXEC NumberLookup @num = '07123-123457'; --wrong number

--TEST Procedure TWO
EXEC VisitArchive @date = '2020/08/23 00:00:00'; -- only 2 rows should show
EXEC VisitArchive @date = '2020/08/24 00:00:00'; -- only 2 rows should show
EXEC VisitArchive @date = '2020/10/03 00:00:00'; -- only 5 rows should show
