
CREATE TABLE User (
	id				INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL,
	firstname	VARCHAR(20)	NOT NULL,
	lastname	VARCHAR(25)	NOT NULL,
	email			VARCHAR(64) NOT NULL,
	phonenumber VARCHAR(15),
	streetnumber VARCHAR(10),
	streetname	VARCHAR(15),
	city        VARCHAR(32),
	postal      VARCHAR(15)
);

CREATE TABLE GolfCourse (
	id INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL,
	name VARCHAR(256) NOT NULL,
	phonenumber VARCHAR(15),
	streetnumber VARCHAR(10),
	streetname	VARCHAR(15),
	city        VARCHAR(32),
	postal      VARCHAR(15)
);

CREATE TABLE GolfCourseRating (
	id INTEGER AUTO_INCREMENT NOT NULL,
	golfCourseId INTEGER NOT NULL,
	name VARCHAR(64) NOT NULL,
	slope SMALLINT,
	rating DECIMAL(3,1),
	PRIMARY KEY(golfCourseId, name),
	FOREIGN KEY(golfCourseId) REFERENCES GolfCourse(id)
	   ON DELETE CASCADE
);

CREATE TABLE Score (
    id INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL,
    userId INTEGER NOT NULL,
    golfCourseRatingId INTEGER NOT NULL,
    score INTEGER NOT NULL,
    datePlayed INTEGER NOT NULL,
    FOREIGN KEY(userId) REFERENCES User(id)
		   ON DELETE CASCADE,
    FOREIGN KEY(golfCourseRatingId) REFERENCES GolfCourseRating(id)
		   ON DELETE CASCADE
);
CREATE UNIQUE INDEX "user_score" ON Score(id, datePlayed DESC);
