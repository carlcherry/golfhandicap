CREATE TABLE Account (
	id INTEGER PRIMARY KEY     NOT NULL,
	firstname      TEXT    NOT NULL,
	lastname       TEXT    NOT NULL
);
CREATE TABLE GolfCourse (
	id INTEGER PRIMARY KEY NOT NULL,
	name TEXT NOT NULL,
	rating REAL NOT NULL,
	slope REAL NOT NULL
);
CREATE TABLE Score (
    id INTEGER PRIMARY KEY NOT NULL,
    userId INTEGER NOT NULL,
    golfCourseId INTEGER NOT NULL,
    score INTEGER NOT NULL,
    datePlayed INTEGER NOT NULL,
    FOREIGN KEY(userId) REFERENCES User(id),
    FOREIGN KEY(golfCourseId) REFERENCES GolfCourse(id)
);
CREATE UNIQUE INDEX "user_score" ON Score(id, datePlayed DESC);

