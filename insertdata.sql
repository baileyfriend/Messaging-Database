-- Insert into users
INSERT INTO users VALUES (1000, 'freundb@gmail.com', 'Bailey', 'Freund');
INSERT INTO users VALUES (1010, 'someguy@gmail.com', 'Fred', 'Digglesbee');
INSERT INTO users VALUES (1020, 'bbbattlestargalactica@gmail.com', 'Dwight', 'Schrute');
INSERT INTO users VALUES (1030, 'wetfield@architect.com', 'Ted', 'Mosby');
INSERT INTO users VALUES (1040, 'peter@gmail.com', 'Peter', 'Ventimiglia');


--Insert into conversation
INSERT INTO conversation VALUES (100);
INSERT INTO conversation VALUES (110);
INSERT INTO conversation VALUES (120);
INSERT INTO conversation VALUES (130);

--Insert into message
INSERT INTO message VALUES (TO_DATE('2016-NOV-25 17:30','YYYY-MON-DD HH24:MI','NLS_DATE_LANGUAGE=AMERICAN'), 1000, 100, 'Hello world :)');
INSERT INTO message VALUES (TO_DATE('2016-NOV-25 17:34','YYYY-MON-DD HH24:MI','NLS_DATE_LANGUAGE=AMERICAN'), 1010, 100, 'It works!!');
