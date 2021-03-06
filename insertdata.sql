-- Insert into users
INSERT INTO users VALUES (1000, 21, userEmail('freundb@gmail.com', 'freundb2@yahoo.com'), 'Bailey', 'Freund');
INSERT INTO users VALUES (1010, 18, userEmail('someguy@gmail.com', 'mrfred@charter.net'), 'Fred', 'Digglesbee');
INSERT INTO users VALUES (1020, 39, userEmail('bbbattlestargalactica@gmail.com', 'dwight@schrutefarms.com'), 'Dwight', 'Schrute');
INSERT INTO users VALUES (1030, 40, userEmail('westfield@architect.com'), 'Ted', 'Mosby');
INSERT INTO users VALUES (1040, 16, userEmail('peter@gmail.com', 'spam@spammer.edu', 'thisperson@pizza.com'), 'Peter', 'Ventimiglia');

--Insert into email_table
INSERT INTO email_table VALUES (1000, VARRAY('schoolemail@school.edu'));
INSERT INTO email_table VALUES (1000, 'schoolemail@school.edu');



--Insert into conversation
INSERT INTO conversation VALUES (100);
INSERT INTO conversation VALUES (110);
INSERT INTO conversation VALUES (120);
INSERT INTO conversation VALUES (130);

--Insert into message
INSERT INTO message VALUES (1, TO_DATE('2016-NOV-25 17:30','YYYY-MON-DD HH24:MI','NLS_DATE_LANGUAGE=AMERICAN'), 1000, 100, 'Hello world :)');
INSERT INTO message VALUES (2, TO_DATE('2016-NOV-25 17:34','YYYY-MON-DD HH24:MI','NLS_DATE_LANGUAGE=AMERICAN'), 1010, 100, 'It works!!');
INSERT INTO message VALUES (3, TO_DATE('2016-NOV-25 17:37','YYYY-MON-DD HH24:MI','NLS_DATE_LANGUAGE=AMERICAN'), 1030, 100, 'Guys, this is awesome!');
INSERT INTO message VALUES (4, TO_DATE('2016-NOV-25 17:41','YYYY-MON-DD HH24:MI','NLS_DATE_LANGUAGE=AMERICAN'), 1000, 100, 'Thanks!');

--Insert into media
INSERT INTO media VALUES (2, 'congrats', '.gif');


--Insert into takesPartIn
INSERT INTO takesPartIn VALUES (1000, 100);
INSERT INTO takesPartIn VALUES (1010, 100);
INSERT INTO takesPartIn VALUES (1030, 100);

--Insert into isFriendsWith
INSERT INTO isFriendsWith VALUES (1000, 1010);
INSERT INTO isFriendsWith VALUES (1010, 1000);

--Insert into avatar
INSERT INTO avatar VALUES ('sillyMale.jpg', 1000);
INSERT INTO avatar VALUES ('battlestargalactica.jpg', 1020);

--Insert into ipaddresses
INSERT INTO iptable VALUES ('10.0.1.1', 1000);
INSERT INTO iptable VALUES ('10.0.1.2', 1000);
INSERT INTO iptable VALUES ('98.24.96.12', 1010);
