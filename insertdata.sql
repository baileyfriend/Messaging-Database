-- Insert into users
INSERT INTO users VALUES (1000, 21, 'freundb@gmail.com', 'Bailey', 'Freund');
INSERT INTO users VALUES (1010, 18, 'someguy@gmail.com', 'Fred', 'Digglesbee');
INSERT INTO users VALUES (1020, 39, 'bbbattlestargalactica@gmail.com', 'Dwight', 'Schrute');
INSERT INTO users VALUES (1030, 40, 'westfield@architect.com', 'Ted', 'Mosby');
INSERT INTO users VALUES (1040, 16, 'peter@gmail.com', 'Peter', 'Ventimiglia');


--Insert into conversation
INSERT INTO conversation VALUES (100);
INSERT INTO conversation VALUES (110);
INSERT INTO conversation VALUES (120);
INSERT INTO conversation VALUES (130);

--Insert into message
INSERT INTO message VALUES (1, TO_DATE('2016-NOV-25 17:30','YYYY-MON-DD HH24:MI','NLS_DATE_LANGUAGE=AMERICAN'), 1000, 100, 'Hello world :)');
INSERT INTO message VALUES (2, TO_DATE('2016-NOV-25 17:34','YYYY-MON-DD HH24:MI','NLS_DATE_LANGUAGE=AMERICAN'), 1010, 100, 'It works!!');


--Insert into media
INSERT INTO media VALUES (2, 'congrats', '.gif');


--Insert into takesPartIn
--@TODO figure out how to generate insertion into the takesPartIn convo whenever a new conversation is created - maybe create a constraint in message that a user must be a part of the conversation to send a message to it
INSERT INTO takesPartIn VALUES (1000, 100);
INSERT INTO takesPartIn VALUES (1010, 100);
