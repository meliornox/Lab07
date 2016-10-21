-- @version Summer, 2015
--

-- Drop previous versions of the tables if they they exist, in reverse order of foreign keys.
DROP TABLE IF EXISTS PGProperty;
DROP TABLE IF EXISTS PlayerGame;
DROP TABLE IF EXISTS Game;
DROP TABLE IF EXISTS Player;
DROP TABLE IF EXISTS Property;

-- Create the schema.
CREATE TABLE Game (
	ID integer PRIMARY KEY, 
	time timestamp
	);

CREATE TABLE Player (
	ID integer PRIMARY KEY, 
	emailAddress varchar(50) NOT NULL,
	name varchar(50)
	);

CREATE TABLE Property (
	ID integer PRIMARY KEY, 
	color varchar(50)
	);
	
CREATE TABLE PlayerGame (
    	ID integer PRIMARY KEY,
	gameID integer REFERENCES Game(ID), 
	playerID integer REFERENCES Player(ID),
	score integer,
	cash integer,
	location integer REFERENCES Property(ID)
	);
	
CREATE TABLE PGProperty(
	playerGameID integer REFERENCES PlayerGame(ID),
	propertyID integer REFERENCES Property(ID), 
	buildings varchar(50),
	number integer
	);
	
-- Allow users to select data from the tables.
GRANT SELECT ON Game TO PUBLIC;
GRANT SELECT ON Player TO PUBLIC;
GRANT SELECT ON PlayerGame TO PUBLIC;
GRANT SELECT ON Property TO PUBLIC;
GRANT SELECT ON PGProperty TO PUBLIC;

-- Add sample records.
INSERT INTO Game VALUES (1, '2006-06-27 08:00:00');
INSERT INTO Game VALUES (2, '2006-06-28 13:20:00');
INSERT INTO Game VALUES (3, '2006-06-29 18:41:00');

INSERT INTO Player(ID, emailAddress) VALUES (1, 'me@calvin.edu');
INSERT INTO Player VALUES (2, 'king@gmail.edu', 'The King');
INSERT INTO Player VALUES (3, 'dog@gmail.edu', 'Dogbreath');

INSERT INTO Property VALUES (1, 'pink');
INSERT INTO Property VALUES (2, 'blue');
INSERT INTO Property VALUES (3, 'green');

INSERT INTO PlayerGame VALUES (1, 1, 1, 0.00, 100, 1);
INSERT INTO PlayerGame VALUES (2, 1, 2, 0.00, 200, 3);
INSERT INTO PlayerGame VALUES (3, 1, 3, 2350.00, 300, 2);
INSERT INTO PlayerGame VALUES (4, 2, 1, 1000.00, 400, 2);
INSERT INTO PlayerGame VALUES (5, 2, 2, 0.00, 500, 3);
INSERT INTO PlayerGame VALUES (6, 2, 3, 500.00, 600, 1);
INSERT INTO PlayerGame VALUES (7, 3, 2, 0.00, 700, 3);
INSERT INTO PlayerGame VALUES (8, 3, 3, 5500.00, 800, 1);

INSERT INTO PGProperty VALUES (1, 1, 'house', 3);
INSERT INTO PGProperty VALUES (1, 2, 'hotel', 1);
INSERT INTO PGProperty VALUES (1, 3, 'house', 2);
INSERT INTO PGProperty VALUES (2, 1, 'hotel', 4);
INSERT INTO PGProperty VALUES (3, 1, 'house', 1);
INSERT INTO PGProperty VALUES (4, 1, 'hotel', 3);
INSERT INTO PGProperty VALUES (5, 1, 'house', 4);
INSERT INTO PGProperty VALUES (6, 1, 'hotel', 2);
