/* Add some user records */
INSERT INTO User (firstName,lastName,email,phoneNumber)
VALUES ('Andrew', 'Cherry', 'andrewcherry.v@gmail.com', '(519) 590-2180');
INSERT INTO User (firstName,lastName,email,phoneNumber)
VALUES ('Carl', 'Cherry', 'carlcherry@gmail.com', '(226) 338-7323');

/* Add a golf course */
INSERT INTO GolfCourse (name,rating,slope) VALUES ('Grey Silo', 68.9, 126);
INSERT INTO GolfCourse (name,rating,slope) VALUES ('Conestoga', 67.2, 117);

/* Add a couple of scores */
INSERT INTO Score (idUser,idGolfCourse,datePlayed,rawScore,netScore,handicap)
VALUES(1,1,'2015-05-03',83,83,18.0);
INSERT INTO Score (idUser,idGolfCourse,datePlayed,rawScore,netScore,handicap)
VALUES(1,2,'2015-05-05',83,83,18.0);
