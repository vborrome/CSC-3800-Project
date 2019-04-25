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

commit;