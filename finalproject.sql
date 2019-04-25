DROP DATABASE movieTheater;
CREATE DATABASE movieTheater;
USE movieTheater;

CREATE TABLE Movie					(
movieId 			Char(8) 		NOT NULL,
movieName 			VARCHAR(100) 	NOT NULL,
movieDescription	VARCHAR(1024)	NOT NULL,
movieRating			VARCHAR(5)		NOT NULL,
movieReleaseDate	DATE			NOT NULL,
movieLength			INT(3)			NOT NULL,
CONSTRAINT MovieTheater_movieId_pk  PRIMARY KEY (movieId)
);

CREATE TABLE Actor					(
ActorId				Char(8)			NOT NULL,
ActorName			VARCHAR(40)		NOT NULL,
ActorGender			CHAR			NOT NULL,
ActorDOB			DATE			NOT NULL,
CONSTRAINT MovieTheater_ActorId_pk	PRIMARY KEY (ActorId),
CONSTRAINT ActorGender CHECK ('M' OR 'F')
);

CREATE TABLE ActsIn					(
ActorId				Char(8)			NOT NULL,
MovieId				Char(8)			NOT NULL,
CONSTRAINT MovieTheater_ActorId_pk	PRIMARY KEY (ActorId, movieId),
CONSTRAINT MovieTheater_ActorId_fk	FOREIGN KEY (ActorId) REFERENCES Actor(ActorId),
CONSTRAINT MovieTheater_MovieId_fk	FOREIGN KEY (movieId) REFERENCES Movie(movieId)
);
CREATE TABLE Director				(
DirectorId				CHAR(8)		NOT NULL,
DirectorName			VARCHAR(40)	NOT NULL,
DirectorGender			CHAR		NOT NULL,
DirectorDOB				DATE		NOT NULL,
CONSTRAINT MovieTheater_DirectorId_pk	PRIMARY KEY (DirectorId),
CONSTRAINT DirectorGender CHECK ('M' OR 'F')
);

CREATE TABLE Directs				(
DirectorId				CHAR(8)		NOT NULL,
movieId					CHAR(8)		NOT NULL,
CONSTRAINT MovieTheater_DirectorId_pk	PRIMARY KEY (DirectorId, movieId),
CONSTRAINT MovieTheater_DirectorId_fk	FOREIGN KEY (DirectorId) REFERENCES Director(DirectorId),
CONSTRAINT MovieTheater_movieId_fk	FOREIGN KEY (movieId) REFERENCES Movie(movieId)
);


CREATE TABLE Theater				(
TheaterId				CHAR(8)			NOT NULL,
TheaterName				VARCHAR(40)		NOT NULL,
StreetAddress			VARCHAR(100)	NOT NULL,
City					VARCHAR(40)		NOT NULL,
State					VARCHAR(2)		NOT NULL,
ZipCode					VARCHAR(5)		NOT NULL,
CONSTRAINT MovieTheater_TheaterId_pk	PRIMARY KEY (TheaterId)
);

CREATE TABLE Screens				(
ScreenId				CHAR(8)			NOT NULL,
TheaterId				CHAR(8)			NOT NULL,
ScreenName				VARCHAR(40)		NOT NULL,
ScreenSeatingCapacity	INT				NOT NULL,
CONSTRAINT MovieTheater_ScreenId_pk		PRIMARY KEY (ScreenId, TheaterId),
CONSTRAINT MovieTheater_TheaterId_fk	FOREIGN KEY (TheatherId) REFERENCES Theater(TheaterId),
CONSTRAINT ScreenSeatingCapacity CHECK (ScreenSeatingCapacity > 0)
);

CREATE TABLE PlayingInScreen		(
ScreenId				CHAR(8)			NOT NULL,
TheaterId				CHAR(8)			NOT NULL,
movieId					CHAR(8)			NOT NULL,
StartTime				DATE			NOT NULL,
CONSTRAINT MovieTheater_ScreenId_pk		PRIMARY KEY (ScreenId, TheaterId, StartTime),
CONSTRAINT MovieTheater_ScreenId_fk		FOREIGN KEY (ScreenId) REFERENCES Screen(ScreenId),
CONSTRAINT MovieTheater_TheaterId_fk	FOREIGN KEY (TheaterId) REFERENCES Screen (TheaterId),
CONSTRAINT MovieTheater_movieId_fk		FOREIGN KEY (movieId) REFERENCES Movie(movieId)
);

CREATE TABLE Ticket					(
TicketId				CHAR(8)			NOT NULL,
TheaterId				CHAR(8)			NOT NULL,
ScreenId				CHAR(8)			NOT NULL,
StartTime				DATE			NOT NULL,
Price					NUMBER			NOT NULL,
StaffId					CHAR(8)			NOT NULL,
SellingTimestamp		DATE			NOT NULL,
CONSTRAINT MovieTheater_TicketId_pk		PRIMARY KEY (TicketId, TheaterId, ScreenId),
CONSTRAINT MovieTheater_TheaterId_fk	FOREIGN KEY (TheaterId) REFERENCES PlayingInScreen(TheaterId),
CONSTRAINT MovieTheater_ScreenId_fk		FOREIGN KEY (ScreenId)	REFERENCES PlayingInScreen(ScreenId),
CONSTRAINT MovieTheater_StaffId_fk		FOREIGN KEY (StaffId)	REFERENCES Staff(StaffId)
); 

CREATE TABLE Staff					(
StaffId					CHAR(8)			NOT NULL,
StaffName				VARCHAR(40)		
StaffStreetAddress		VARCHAR(100)	
StaffCity				VARCHAR(20)		
StaffState				VARCHAR(2)		
StaffZipcode			VARCHAR(5)		
StaffPhoneNumber		VARCHAR(16)		
StaffEmail				VARCHAR(40)		
Gender					CHAR			NOT NULL,
SSN						VARCHAR(9)		NOT NULL,
DOB						DATE			NOT NULL,
CONSTRAINT MovieTheater_StaffId_pk		PRIMARY KEY(StaffId),
CONSTRAINT Gender CHECK ('M' OR 'F')
);

CREATE TABLE Position				(
PositionId				CHAR(8)			NOT NULL,
PositionName			VARCHAR(20)		NOT NULL,
CONSTRAINT MovieTheater_PositionId_pk	PRIMARY KEY(PositionId)
);

CREATE TABLE StaffPosition			(
StaffId					CHAR(8)			NOT NULL,
PositionId				CHAR(8)			NOT NULL,
TheaterId				CHAR(8)			NOT NULL,
StartingDate			DATE			NOT NULL,
EndingDate				DATE			NOT NULL,
CONSTRAINT MovieTheater_StartingDate_pk	PRIMARY KEY(StartingDate, StaffId, PositionId, TheaterId),
CONSTRAINT MovieTheater_StaffId_fk		FOREIGN KEY(StaffId) REFERENCES Staff(StaffId),
CONSTRAINT MovieTheater_PositionId_fk	FOREIGN KEY(PositionId) REFERENCES Position(PositionId),
CONSTRAINT MovieTheater_TheaterId_fk	FOREIGN KEY(TheaterId) REFERENCES Theater(TheaterId)
);

CREATE TABLE StaffSalary			(
StaffId					CHAR(8)			NOT NULL,
PositionId				CHAR(8)			NOT NULL,
Salary					NUMBER			NOT NULL,
EffectiveDate			DATE			NOT NULL,
CONSTRAINT MovieTheater_EffectiveDate_pk	PRIMARY KEY(EffectiveDate, StaffId, PositionId),
CONSTRAINT MovieTheater_StaffId_fk			FOREIGN KEY(StaffId) REFERENCES Staff(StaffId),
CONSTRAINT MovieTheater_PositionId_fk		FOREIGN KEY(PositionId) REFERENCES Position(PositionId),
CONSTRAINT Salary CHECK (Salary > 0)
);

INSERT INTO Director VALUES('15220814', 'Jordan Peele', 'M', '1979-02-21');
INSERT INTO Director VALUES('15220815', 'David Fincher', 'M', '1962-08-28');
INSERT INTO Directs VALUES('15220814', 'aaaaaaaa');
INSERT INTO Directs VALUES('15220815', 'bbbbbbbb');
INSERT INTO Theater VALUES('ccccccc', 'Millstone', '208 Stone Drive', 'Hope Mills', 'NC', '28348');
INSERT INTO Theater VALUES('dddddddd', 'Big Screens', '148 Pleasant Street', 'Charlotte', 'NC', '28105');
INSERT INTO Screens	VALUES('eeeeeeee', 'ccccccc', 'ScreenName1', '250');
INSERT INTO Screens VALUES('ffffffff', 'dddddddd', 'ScreenName2', '270');
INSERT INTO PlayingInScreen VALUES('eeeeeeee', 'ccccccc', 'aaaaaaaa', '2019-04-26');
INSERT INTO PlayingInScreen VALUES('ffffffff', 'dddddddd', 'bbbbbbbb', '2019-05-03');

INSERT INTO Movie VALUES('aaaaaaaa', 'The Alphabet', 'Story of letters betting.', 'PG-13', '1999-10-02', 90);
INSERT INTO Movie VALUES('bbbbbbbb', 'The BetaAlph', 'Story of betting letters.', 'PG-13', '2000-10-16', 75);
INSERT INTO Actor VALUES('15220815', 'Will Smith', 'M', '1968-09-25');
INSERT INTO Actor VALUES('15220816', 'Jada Pinkett-Smith', 'F', '1971-09-18');
INSERT INTO ActsIn VALUES('15220815', 'aaaaaaaa');
INSERT INTO ActsIn VALUES('15220816', 'bbbbbbbb');

commit;
