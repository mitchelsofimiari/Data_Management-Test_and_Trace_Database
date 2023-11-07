USE master
  GO

 -- Drop the database if it already exists
 IF  EXISTS (SELECT name FROM sys.databases WHERE name = N'TAT_1912840')
	DROP DATABASE TAT_1912840
 GO

 -- Now create the TAT database
 CREATE DATABASE TAT_1912840
 GO

 -- Ensure that TAT is the current database in use
 USE TAT_1912840
 GO


/* Create table subject */
IF OBJECT_ID('Subject', 'U') IS NOT NULL
  DROP TABLE Subject
GO

CREATE TABLE Subject (
	subject_id	NCHAR(4)		,
	sub_name	NVARCHAR(30)		NOT NULL,
	sub_add		NVARCHAR(30)		NOT NULL,
	CONSTRAINT pk_Subject PRIMARY KEY (subject_id),
	CONSTRAINT CK_subject_id CHECK (subject_id LIKE 'S[0-9][0-9][0-9]')
);


/* Create phone table */
IF OBJECT_ID('Phone', 'U') IS NOT NULL
  DROP TABLE Phone
GO

CREATE TABLE Phone (
	phone_id	INT	IDENTITY(1,1)	,
	phone		NVARCHAR(30)  		NOT NULL,
	CONSTRAINT pk_Phone PRIMARY KEY (phone_id)
);


/* Create business table */
IF OBJECT_ID('Business', 'U') IS NOT NULL
  DROP TABLE Business
GO

CREATE TABLE Business (
	busi_id		INT	IDENTITY(1,1)	,
	busi_loc	NVARCHAR(30)  		NOT NULL,
	owner		NVARCHAR(30)  		NOT NULL,
	CONSTRAINT pk_Business PRIMARY KEY (busi_id)
);


/* Create test table */
IF OBJECT_ID('Test', 'U') IS NOT NULL
  DROP TABLE Test
GO

CREATE TABLE Test (
	test_id		INT	IDENTITY(1,1)	,
	tdate		DATETIME  		NOT NULL,
	results		NVARCHAR(30)  		NOT NULL,
	subject_id	NCHAR(4)		,
	CONSTRAINT pk_Test PRIMARY KEY (test_id),
	CONSTRAINT fk_Test_Subject FOREIGN KEY (subject_id) REFERENCES Subject(subject_id)
	ON DELETE CASCADE ON UPDATE CASCADE
);


/* Create visit table */
IF OBJECT_ID('Visit', 'U') IS NOT NULL
  DROP TABLE Visit
GO

CREATE TABLE Visit (
	visit_id	INT	IDENTITY(1,1)	,
	vdate		DATETIME  		NOT NULL,
	party_n		INT  			NOT NULL,
	phone_id	INT			,
	busi_id		INT			,
	CONSTRAINT pk_Visit PRIMARY KEY (visit_id),
	CONSTRAINT fk_Visit_Phone FOREIGN KEY (phone_id) REFERENCES Phone(phone_id)
	ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT fk_Visit_Business FOREIGN KEY (busi_id) REFERENCES Business(busi_id)
	ON DELETE CASCADE ON UPDATE CASCADE
);


/* Create subject_phone table */
IF OBJECT_ID('Subject_Phone', 'U') IS NOT NULL
  DROP TABLE Subject_Phone
GO

CREATE TABLE Subject_Phone (
	phone_id	INT			,
	subject_id	NCHAR(4)		,
	CONSTRAINT pk_Subject_Phone PRIMARY KEY (phone_id),
	CONSTRAINT fk_Subject_Phone_Phone FOREIGN KEY (phone_id) REFERENCES Phone(phone_id)
	ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT fk_Subject_Phone_Subject FOREIGN KEY (subject_id) REFERENCES Subject(subject_id)
	ON DELETE CASCADE ON UPDATE CASCADE
);