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

INSERT INTO Movie VALUES('aaaaaaaa', 'The Alphabet', 'Story of letters betting.', 'PG-13', '1999-10-02', 90);
INSERT INTO Movie VALUES('bbbbbbbb', 'The BetaAlph', 'Story of betting letters.', 'PG-13', '2000-10-16', 75);
INSERT INTO Actor VALUES('15220815', 'Will Smith', 'M', '1968-09-25');
INSERT INTO Actor VALUES('15220816', 'Jada Pinkett-Smith', 'F', '1971-09-18');
INSERT INTO ActsIn VALUES('15220815', 'aaaaaaaa');
INSERT INTO ActsIn VALUES('15220816', 'bbbbbbbb');

INSERT INTO Ticket VALUES('gggggggg', 'cccccccc', 'eeeeeeee', '2019-04-27', '8.75', 'iiiiiiii', '2019-04-27');
INSERT INTO Ticket VALUES('hhhhhhhh', 'dddddddd', 'ffffffff', '2019-05-04', '8.50', 'jjjjjjjj', '2019-05-04');
INSERT INTO Staff VALUES('iiiiiiii', 'Jermaine Dupri', '909 So Def Street', 'Breadwinner', 'NJ', '28354', '148-855-9999', 'jdupri@aol.com', 'M', '999-99-9999', '1970-05-18');
INSERT INTO Staff VALUES('jjjjjjjj', 'Mariah Carey', '704 Butterfly Drive', 'New York City', 'NY', '80051', '555-555-5555', 'thesongbirdsupreme@gmail.com', 'F', '888-88-8888', '1970-01-15');
INSERT INTO Position VALUES('kkkkkkkk', 'Janitor');
INSERT INTO Position VALUES('llllllll', 'Concessions');
INSERT INTO StaffPosition VALUES('iiiiiiii', 'kkkkkkkk', 'cccccccc', '2018-10-01', '2019-01-01');
INSERT INTO StaffPosition VALUES('jjjjjjjj', 'llllllll', 'dddddddd', '2019-02-14', '2019-04-25');
INSERT INTO StaffSalary VALUES('iiiiiiii', 'kkkkkkkk', '7.25', '2018-10-08');
INSERT INTO StaffSalary VALUES('jjjjjjjj', 'llllllll', '7.25', '2019-02-21'); 

commit;
