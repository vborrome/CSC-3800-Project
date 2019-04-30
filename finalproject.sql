DROP DATABASE movieTheater;
CREATE DATABASE movieTheater;
USE movieTheater;

CREATE TABLE Movie					(
MovieId 			Char(8) 		NOT NULL,
MovieName 			VARCHAR(100) 	NOT NULL,
MovieDescription	VARCHAR(1024)	NOT NULL,
MovieRating			VARCHAR(5)		NOT NULL,
MovieReleaseDate	DATE			NOT NULL,
MovieLength			INT(3)			NOT NULL,
CONSTRAINT MovieTheater_MovieId_pk  PRIMARY KEY (MovieId)
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
CONSTRAINT MovieTheater_ActorId_pk	PRIMARY KEY (ActorId, MovieId),
CONSTRAINT MovieTheater_ActorId_fk	FOREIGN KEY (ActorId) REFERENCES Actor(ActorId),
CONSTRAINT MovieTheater_MovieId_fk	FOREIGN KEY (MovieId) REFERENCES Movie(MovieId)
);

CREATE TABLE Director				(
DirectorId				CHAR(8)		NOT NULL,
DirectorName			VARCHAR(40)	NOT NULL,
DirectorGender			CHAR		NOT NULL,
DirectorDOB				DATE,		
CONSTRAINT MovieTheater_DirectorId_pk	PRIMARY KEY (DirectorId),
CONSTRAINT DirectorGender CHECK ('M' OR 'F')
);

CREATE TABLE Directs					(
DirectorId				CHAR(8)		NOT NULL,
MovieId					CHAR(8)		NOT NULL,
CONSTRAINT MovieTheater_DirectorId_pk	PRIMARY KEY (DirectorId, MovieId),
CONSTRAINT MovieTheater_DirectorId_fk	FOREIGN KEY (DirectorId) REFERENCES Director(DirectorId),
CONSTRAINT MovieTheater_DirectsMovieId_fk		FOREIGN KEY (MovieId) REFERENCES Movie(MovieId)
);


CREATE TABLE Theater					(
TheaterId				CHAR(8)			NOT NULL,
TheaterName				VARCHAR(40)		NOT NULL,
StreetAddress			VARCHAR(100)	NOT NULL,
City					VARCHAR(40)		NOT NULL,
State					VARCHAR(2)		NOT NULL,
ZipCode					VARCHAR(5)		NOT NULL,
CONSTRAINT MovieTheater_TheaterId_pk	PRIMARY KEY (TheaterId)
);

CREATE TABLE Screen				(
ScreenId				CHAR(8)			NOT NULL,
TheaterId				CHAR(8)			NOT NULL,
ScreenName				VARCHAR(40)		NOT NULL,
ScreenSeatingCapacity	INT				NOT NULL,
CONSTRAINT MovieTheater_TableScreenId_pk	PRIMARY KEY (ScreenId, TheaterId),
CONSTRAINT MovieTheater_TableTheaterId_fk	FOREIGN KEY (TheaterId) REFERENCES Theater(TheaterId),
CONSTRAINT ScreenSeatingCapacity CHECK (ScreenSeatingCapacity > 0)
);

CREATE TABLE Staff					(
StaffId					CHAR(8)		NOT NULL,
StaffName				VARCHAR(40),		
StaffStreetAddress		VARCHAR(100),	
StaffCity				VARCHAR(20),	
StaffState				VARCHAR(2),		
StaffZipcode			VARCHAR(5),
StaffPhoneNumber		VARCHAR(16),		
StaffEmail				VARCHAR(40),		
Gender					CHAR		NOT NULL,
SSN						VARCHAR(9)	NOT NULL,
DOB						DATE		NOT NULL,
CONSTRAINT MovieTheater_StaffId_pk		PRIMARY KEY(StaffId),
CONSTRAINT Gender CHECK ('M' OR 'F')
);

CREATE TABLE PlayingInScreen		(
ScreenId				CHAR(8),
TheaterId				CHAR(8),
MovieId					CHAR(8),
CONSTRAINT MovieTheater_PlayInScreenId_pk		PRIMARY KEY (ScreenId, TheaterId),
CONSTRAINT MovieTheater_PlayInScreenId_fk		FOREIGN KEY (ScreenId) REFERENCES Screen(ScreenId),
CONSTRAINT MovieTheater_PlayInTheaterId_fk		FOREIGN KEY (TheaterId) REFERENCES Screen(TheaterId),
CONSTRAINT MovieTheater_PlayInMovieId_fk		FOREIGN KEY (MovieId) REFERENCES Movie(MovieId)
);

CREATE TABLE Ticket					(
TicketId				CHAR(8),
TheaterId				CHAR(8),
ScreenId				CHAR(8),
Price					double			NOT NULL,
StaffId					CHAR(8),
SellingTimestamp		DATE,			
CONSTRAINT MovieTheater_TicketId_pk			PRIMARY KEY (TicketId, TheaterId, ScreenId),
CONSTRAINT MovieTheater_TicketTheaterId_fk	FOREIGN KEY (TheaterId) REFERENCES PlayingInScreen(TheaterId),
CONSTRAINT MovieTheater_TicketScreenId_fk	FOREIGN KEY (ScreenId)	REFERENCES PlayingInScreen(ScreenId),
CONSTRAINT MovieTheater_TicketStaffId_fk	FOREIGN KEY (StaffId)	REFERENCES Staff(StaffId)
); 

CREATE TABLE Position1				(
PositionId				CHAR(8)			NOT NULL,
PositionName			VARCHAR(20)		NOT NULL,
CONSTRAINT MovieTheater_PositionId_pk	PRIMARY KEY(PositionId)
);

CREATE TABLE StaffPosition			(
StaffId					CHAR(8)			NOT NULL,
PositionId				CHAR(8)			NOT NULL,
TheaterId				CHAR(8)			NOT NULL,
StartingDate			DATE			NOT NULL,
EndingDate				DATE,			
CONSTRAINT MovieTheater_StaffPosStartingDate_pk	PRIMARY KEY(StartingDate, StaffId, PositionId, TheaterId),
CONSTRAINT MovieTheater_StaffPosId_fk		FOREIGN KEY(StaffId) REFERENCES Staff(StaffId),
CONSTRAINT MovieTheater_StaffPosPositionId_fk	FOREIGN KEY(PositionId) REFERENCES Position1(PositionId),
CONSTRAINT MovieTheater_StaffPosTheaterId_fk	FOREIGN KEY(TheaterId) REFERENCES Theater(TheaterId)
);

CREATE TABLE StaffSalary			(
StaffId					CHAR(8)			NOT NULL,
PositionId				CHAR(8)			NOT NULL,
Salary					double			NOT NULL,
EffectiveDate			DATE			NOT NULL,
CONSTRAINT MovieTheater_EffectiveDate_pk	PRIMARY KEY(EffectiveDate, StaffId, PositionId),
CONSTRAINT MovieTheater_StaffSalId_fk			FOREIGN KEY(StaffId) REFERENCES Staff(StaffId),
CONSTRAINT MovieTheater_StaffSalPositionId_fk		FOREIGN KEY(PositionId) REFERENCES Position1(PositionId),
CONSTRAINT Salary CHECK (Salary > 0)
);

INSERT INTO Movie VALUES('aaaaaaaa', 'The Alphabet', 'Story of letters betting.', 'PG-13', '1999-10-02', 90);
INSERT INTO Movie VALUES('bbbbbbbb', 'The BetaAlph', 'Story of betting letters.', 'PG-13', '2000-10-16', 75);

INSERT INTO Actor VALUES('15220815', 'Will Smith', 'M', '1968-09-25');
INSERT INTO Actor VALUES('15220816', 'Jada Pinkett-Smith', 'F', '1971-09-18');

INSERT INTO ActsIn VALUES('15220815', 'aaaaaaaa');
INSERT INTO ActsIn VALUES('15220816', 'bbbbbbbb');

INSERT INTO Director VALUES('15220814', 'Jordan Peele', 'M', '1979-02-21');
INSERT INTO Director VALUES('15220815', 'David Fincher', 'M', '1962-08-28');

INSERT INTO Directs VALUES('15220814', 'aaaaaaaa');
INSERT INTO Directs VALUES('15220815', 'bbbbbbbb');

INSERT INTO Theater VALUES('cccccccc', 'Millstone', '208 Stone Drive', 'Hope Mills', 'NC', '28348');
INSERT INTO Theater VALUES('dddddddd', 'Big Screens', '148 Pleasant Street', 'Charlotte', 'NC', '28105');

INSERT INTO Screen	VALUES('eeeeeeee', 'cccccccc', 'ScreenName1', '250');
INSERT INTO Screen VALUES('ffffffff', 'dddddddd', 'ScreenName2', '270');

INSERT INTO PlayingInScreen VALUES('eeeeeeee', 'cccccccc', 'aaaaaaaa', '2019-04-26');
INSERT INTO PlayingInScreen VALUES('ffffffff', 'dddddddd', 'bbbbbbbb', '2019-05-03');

INSERT INTO Staff VALUES('iiiiiiii', 'Jermaine Dupri', '909 So Def Street', 'Breadwinner', 'NJ', '28354', '148-855-9999', 'jdupri@aol.com', 'M', '999999999', '1970-05-18');
INSERT INTO Staff VALUES('jjjjjjjj', 'Mariah Carey', '704 Butterfly Drive', 'New York City', 'NY', '80051', '555-555-5555', 'thesongbirdsupreme@gmail.com', 'F', '888888888', '1970-01-15');

INSERT INTO Position1 VALUES('kkkkkkkk', 'Janitor');
INSERT INTO Position1 VALUES('llllllll', 'Concessions');

INSERT INTO StaffPosition VALUES('iiiiiiii', 'kkkkkkkk', 'cccccccc', '2018-10-01', '2019-01-01');
INSERT INTO StaffPosition VALUES('jjjjjjjj', 'llllllll', 'dddddddd', '2019-02-14', '2019-04-25');

INSERT INTO StaffSalary VALUES('iiiiiiii', 'kkkkkkkk', '7.25', '2018-10-08');
INSERT INTO StaffSalary VALUES('jjjjjjjj', 'llllllll', '7.25', '2019-02-21');

INSERT INTO Ticket VALUES('gggggggg', 'cccccccc', 'eeeeeeee', '8.75', 'iiiiiiii', '2019-04-27');
INSERT INTO Ticket VALUES('hhhhhhhh', 'dddddddd', 'ffffffff', '8.50', 'jjjjjjjj', '2019-05-04');

commit;
