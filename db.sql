CREATE DATABASE NaSeamrogaiGAA;

CREATE TABLE Venues (
    venueID char(3) NOT NULL PRIMARY KEY,
    name VARCHAR(20),
    location VARCHAR(50) NOT NULL,
    capacity INTEGER UNSIGNED,
    size VARCHAR(8)
); 

INSERT INTO Venues VALUES(“101”, “Oakwood Pitch”, “Green Road, Lucan, Co. Dublin”, “50”, “Medium”);
INSERT INTO Venues VALUES(“122”, “Club Pitch 1”, “Na Seamrogai GAA Club, Bothar Glas, Lucan, Co. Dublin”, “110”, “Juvenile”);
INSERT INTO Venues VALUES(“324”, “Club Pitch 2”,  “Na Seamrogai GAA Club, Bothar Glas, Lucan, Co. Dublin”, “200”, “Senior”);
INSERT INTO Venues VALUES(“117”, “Willsbrook Park Pitch”, “Willsbrook Park, Willsbrook Road, Lucan, Co. Dublin”, “Juvenile”);
INSERT INTO Venues VALUES(“278”, “Ryedale Park Pitch”, “Ryedale Park, Lucan, Co. Dublin”, “Medium”);

CREATE TABLE Teams (
    teamID CHAR(4) NOT NULL,
    sport VARCHAR(20) NOT NULL,
    competition VARCHAR(30),
    ageGroup VARCHAR(20),
    noOfPlayers INTEGER UNSIGNED,
    PRIMARY KEY (TeamID),
    CONSTRAINT check_sport CHECK (sport in ‘Gaelic Football’, ‘Hurling’, ‘Ladies Gaelic Football’, ‘Camogie’),
UNIQUE(sport, ageGroup)
);

INSERT INTO Teams VALUES(“0903”, “Hurling”, “Division 2”, “U14”, “22”);
INSERT INTO Teams VALUES(“2307”, “Camogie”, “Division 7”, “U16”, “20”);
INSERT INTO Teams VALUES(“1156”, “Gaelic Football”, “Division 1”, “Senior”, “30”);
INSERT INTO Teams VALUES(“0450”, “Gaelic Football”, “Division 3”, “U18”, NULL);
INSERT INTO Teams VALUES(“2216”, “Ladies Gaelic Football”, “Division 2”, “Senior”, “27”);
INSERT INTO Teams VALUES(“3173”, “Hurling”, “Division 2”, “Senior”, “29”);
INSERT INTO Teams VALUES(“1789”, “Camogie”, “Division 4”, “U18”, “21”);
INSERT INTO Teams VALUES(“3418”, “Ladies Gaelic Football”, “Division 6”, “U16”, “16”);
INSERT INTO Teams VALUES(“4490”, “Gaelic Football”,NULL, “U12”, NULL);
INSERT INTO Teams VALUES(“0882”, “Gaelic Football”, “Division 3”, “U16”, “24”);
INSERT INTO Teams VALUES(“2155”, “Camogie”, “Division 6”, “Senior”, NULL);
INSERT INTO Teams VALUES(“8631”, “Hurling”, “Division 3”, “U18”, “22”);
INSERT INTO Teams VALUES(“0706”, “Hurling”, “Division 2”, “U12”, “30”);
INSERT INTO Teams VALUES(“4564”, “Ladies Gaelic Football”, NULL, “U12”, “19”);

CREATE TABLE Players (
    memberID CHAR(8) NOT NULL,
    firstName VARCHAR(20)NOT NULL,
    lastName VARCHAR(20)NOT NULL,
    team CHAR(4) NOT NULL,
    dob DATE,
    nextOfKin CHAR(10) NOT NULL, 
    PRIMARY KEY (memberID, team),
    FOREIGN KEY (team) REFERENCES Teams(teamID) ON DELETE CASCADE ON DELETE UPDATE
);

INSERT INTO Players VALUES(“12226657”, “Kate”, “Britton”, “4564”, “2010-07-25”, “0899954371”);
INSERT INTO Players VALUES(“31388990”, “Liam”, “Eaton”, “4490”, “2011-06-06”, “0851231245”);
INSERT INTO Players VALUES(“09654321”, “Maddie”, “Ryan”, “1789”, “2004-09-03”, “0876111232”);
INSERT INTO Players VALUES(“27799029”, “Aoife”, “O’Kane”, “3418”, “2005-02-21”, “0832167675”);
INSERT INTO Players VALUES(“44789012”, “Timothy”, “Wright”, “3173”, “1997-11-12”, “0876755122”);
INSERT INTO Players VALUES(“13353780”, “Darragh”, “Spillane”, “1156”, “1996–07-05”, “0875444212”);
INSERT INTO Players VALUES(“00128912”, “Darragh”, “Spillane”, “3173”, “1996-07-05”, “0875444212”);
INSERT INTO Players VALUES(“31177131”, “Mary”, “Murtagh”, “2216”, “1990-03-19”, “”0832647322”);

CREATE TABLE Coaches (
    firstName VARCHAR(20) NOT NULL,
    lastName VARCHAR(20) NOT NULL,
    memberID CHAR(8) NOT NULL,
    team CHAR(4) NOT NULL, 
    phone CHAR(10),
    email VARCHAR(50),
    PRIMARY KEY (memberID, team),
    FOREIGN KEY (team) REFERENCES Teams(teamID) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO Coaches VALUES(“John”, “Dooley”, “67689000”, “2216”, “0874478901”, “johndooley5@yahoo.com”);
INSERT INTO Coaches VALUES(“Anne”, “Whelan”, “00543201”, “3418”, “0873232001”, “whelana33@gmail.com”);
INSERT INTO Coaches VALUES(“Rita”, “Gogarty”, “90911232”, “4564”, “0853320987”, NULL);
INSERT INTO Coaches VALUES(“Tracey”, “Walsh”, “55640010”, “4490”, “0891102034”, “trwalsh80@hotmail.com”);
INSERT INTO Coaches VALUES(“Ian”, “Quirke”, “40013179”, “2216”, “0830049569”, “quirkeian9@gmail.com”);
INSERT INTO Coaches VALUES(“Tracey”, “Walsh”, “55640010”, “2155”, “0891102034”, “trwalsh80@hotmail.com”);
INSERT INTO Coaches VALUES(“Bernard”, “Brogan”, “67891994”, “0882”, NULL, “bbroganb@dubs.ie”);
INSERT INTO Coaches VALUES(“Liam”, “Preston”, “22182391”, “3172”, “089939212”, NULL);
INSERT INTO Coaches VALUES(“Una”, “George”, “34675480”, “2307”, “0851005008”, “unageorge15@gmail.com”);
INSERT INTO Coaches VALUES(“Will”, “Connolly”, “09022367”, “0706”, “0873457341”, “willc09@hotmail.com”);
INSERT INTO Coaches VALUES(“Will”, “Connolly”, “09022367”, “3172”, “0873457341”, “willc09@hotmail.com”);


CREATE TABLE Sponsors (
    sponsorshipID CHAR(3) NOT NULL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    address VARCHAR(100),
    phone CHAR(10),
    amount INTEGER UNSIGNED,
    team CHAR(4) NOT NULL,
    FOREIGN KEY (team) REFERENCES Teams(teamID) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO Sponsors VALUES(“001”, “Ursula Eaton”, NULL, “0895544345”, 4000, “2155”);
INSERT INTO Sponsors VALUES(“003”, “Richard O’Mahoney”, “12 Elmbrook Valley, Lucan, Co. Dublin”, “0871242567”, 1000, “1789”);
INSERT INTO Sponsors VALUES (“004”, “Richard O’Mahoney”, “12 Elmbrook Valley, Lucan, Co. Dublin”, “0871242567”, 1000, “4564”);
INSERT INTO Sponsors VALUES(“005”, “Richard O’Mahoney”, “12 Elmbrook Valley, Lucan, Co. Dublin”, “0871242567”, 1000, “3418”);
INSERT INTO Sponsors VALUES(“002”, “Doyle Windows”, “18 Main Street, Lucan, Co. Dublin”, “6243352”, 2000, “4490”);
INSERT INTO Sponsors VALUES(“007”, “Centra Lucan”, “5 Main Street, Lucan, Co. Dublin”, NULL, 1200, “8631”);
INSERT INTO Sponsors VALUES(“010”, “Nails by Jenny”, “9 Ryedale Lawn, Lucan, Co. Dublin”, “0865125318”, 800, “2216”);


CREATE TABLE Matches (
    matchID CHAR(6) NOT NULL PRIMARY KEY,
    team CHAR(4) NOT NULL,
    date DATE,
    opposition VARCHAR(40),
    referee VARCHAR(40),
    venue CHAR(3),
    FOREIGN KEY (team) REFERENCES Teams(teamID) ON DELETE CASCADE,
    FOREIGN KEY (venue) REFERENCES Venues(venueID) ON DELETE CASCADE 
);

INSERT INTO Matches VALUES(“220781”, “4565”, 2022-04-04, “Na Fianna”, “John Kennedy”, “122”);
INSERT INTO Matches VALUES(“121890”, “3173”, 2022-03-29, “Round Towers Lusk”, NULL, NULL);
INSERT INTO Matches VALUES(“300478”, “1156”, 2022-05-12, “Ballyboden St Enda’s GAA”, “Orla Hughes”, “324”);
INSERT INTO Matches VALUES(“100609”, “2216”, 2022-04-01, “St Mary’s Tallaght”, “Billy Durkin”, NULL);
INSERT INTO Matches VALUES(“313908”, “2216”, 2022-04-08”, “Templeogue Synge Street GAA”, NULL, “101”);
INSERT INTO Matches VALUES(“245656”, “3418”, 2022-03-31, “St Pat’s Donabate”, “Rick Lovett”, “117”);
INSERT INTO Matches VALUES(“119902”, “0903”, 2022-05-21, “Na Gaeil Oga CLG”, NULL, NULL);
INSERT INTO Matches VALUES(“755234”, “8613”, 2022-04-12, “Bray Wanderers”, “Cuala GAA”, “Sandra Tierney”, “101”); 

ALTER TABLE Venues ADD CONSTRAINT check_size CHECK (size in (‘Juvenile’, ‘Medium’, ‘Senior’);

ALTER TABLE Matches ADD CONSTRAINT check_matchID CHECK (matchID >= 100000 AND matchID <= 999999);

ALTER TABLE Teams ADD CONSTRAINT check_age CHECK (ageGroup IN (‘U12’, ‘U14’, ‘U16’, ‘U18’, ‘Senior’);

ALTER TABLE Sponsors ADD CONSTRAINT check_sponsorID CHECK (sponsorshipID <= 999);

ALTER TABLE Venues ADD CONSTRAINT check_venueID CHECK (venueID <= 999);

ALTER TABLE Players ADD CONSTRAINT check_playerID CHECK (memberID <= 999999);

ALTER TABLE Coaches ADD CONSTRAINT check_coachID CHECK (memberID <= 999999);

ALTER TABLE Sponsors ADD CONSTRAINT unique_sponsor UNIQUE(name, team); 
 

DELIMITER $$
CREATE TRIGGER insert_player
BEFORE INSERT ON Players
FOR EACH ROW
BEGIN
UPDATE Teams SET Size = Size + 1 WHERE memberID= NEW.memberID;
END $$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER 
BEFORE DELETE ON Players
FOR EACH ROW
BEGIN 
UPDATE Teams SET noOfPlayers = noOfplayers - 1 WHERE memberID = OLD.memberID;
END $$
DELIMITER; 

CREATE VIEW coaches_and_teams AS
    SELECT 
        Coaches.firstName,
        Coaches.lastName,
        Teams.teamID,
        Teams.ageGroup,
        Teams.competition
    FROM 
        Coaches JOIN Teams ON Coaches.team = Teams.teamID;

CREATE VIEW players_of_team AS
    SELECT
        Players.firstName,
        Players.lastName,
        Players.dob,
        Players.teamID,
        Teams.sport,
        Teams.ageGroup
    FROM
        Players JOIN Teams ON Players.team = Teams.teamID;

CREATE VIEW emergency_contacts AS
    SELECT
        Players.nextOfKin AS phone,
        Players.firstName AS playerName,
        Players.team
    FROM 
        Players
GROUP BY Players.team;

CREATE ROLE Admin;
CREATE ROLE Coach;
CREATE ROLE Member;
GRANT SELECT, INSERT, DELETE ON Matches TO Admin WITH GRANT OPTION;
GRANT SELECT, INSERT, DELETE ON Players TO Admin WITH GRANT OPTION;
GRANT SELECT, INSERT, DELETE ON Coaches TO Admin WITH GRANT OPTION; 
GRANT SELECT, INSERT, DELETE ON Teams TO Admin WITH GRANT OPTION;
GRANT SELECT, INSERT, DELETE ON Venues TO Admin WITH GRANT OPTION;
GRANT SELECT, INSERT, DELETE ON Sponsors TO Admin WITH GRANT OPTION;

GRANT SELECT, INSERT, DELETE ON Players TO Coach;
GRANT SELECT, INSERT, DELETE ON Sponsors TO Coach;
GRANT SELECT, INSERT, DELETE ON Teams TO Coach;

GRANT SELECT ON Matches TO Member;
GRANT SELECT ON Coaches TO Member;
GRANT SELECT ON Venues TO Member;
GRANT SELECT ON Teams TO Member;


