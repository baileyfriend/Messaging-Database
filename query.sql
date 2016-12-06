--Basic queries that prove that our tables can join to eachother.

--Three table join
select u.userID
from users u, conversation c, takesPartIn t
where c.cid = t.cid and t.userID = u.userID;

--Four Table join - find out who sent a message that takes part in a conversation
select u.userID, u.FNAME, mes.txt
from users u, conversation c, takesPartIn t, message mes
where u.userID = 1010 and c.cid = t.cid and t.userID = u.userID
and mes.muid = u.userID;

--Three table join - find out who sent messages with media attached
select u.userID, u.FNAME, mes.txt, med.fileName, med.fileType
from users u, message mes, media med
where mes.muid = u.userID
and mes.messageKey = med.mKey;

--See which users have ipaddresses
select u.FNAME, i.ipaddress
from users u, iptable i
where u.userID = i.userID;

--See which users have avatars, and what file they used for their avatar
select u.FNAME, a.avatarFileName
from users u, avatar a
where u.userID = a.userID;

--Find all pairs of users that are connected by conversations -- Self-join -- GROUP BY, HAVING, ORDER BY
SELECT u1.userID, u2.userID
FROM users u1, users u2, takesPartIn tp1, takesPartIn tp2
WHERE u1.userID != u2.userID AND
		u1.userID = tp1.userID AND
		u2.userID = tp2.userID AND
		tp1.cid = tp2.cid
GROUP BY u1.userID, u2.userID
HAVING u1.userID < u2.userID
ORDER BY u1.userID;

--number of total users in conversations.
SELECT Count(userID)
FROM takesPartIn;

--All users that take part in conversations, and which conversation they are apart of. 
SELECT u.userID, tpi.cid
FROM users u, takespartin tpi
WHERE u.userID = tpi.userID;

--All user that take part in a conversation -- INTERSECT
SELECT userID FROM users
INTERSECT
SELECT userID FROM takespartin

--Very basic just ranks all users by there userID -- RANK
SELECT userID, RANK () OVER (ORDER BY userID) AS Rank
FROM users;

--More advanced version of the rank query above
--This one Ranks users by how many conversations they are apart of. -- RANK
SELECT u.userID, COUNT(u.userID) AS Num_of_conversations, 
	RANK () OVER (ORDER BY COUNT(u.userID) DESC) AS Rank
FROM users u, takespartin tpi
WHERE u.userID = tpi.userID
GROUP BY u.userID
ORDER BY COUNT(u.userID) DESC;

--This one does the same as the one above but using a NON CORRELATED subquery -- NON CORRELATED
SELECT userID, COUNT(userID) AS Num_of_conversations, 
	RANK () OVER (ORDER BY COUNT(userID) DESC) AS Rank
FROM (SELECT u.userID, tpi.cid
FROM users u, takespartin tpi
WHERE u.userID = tpi.userID)
GROUP BY userID
ORDER BY COUNT(userID) DESC;

--finds all users who are not a part of a conversation. -- CORRELATED subquery
SELECT u.userID
FROM users u
WHERE NOT EXISTS (SELECT * FROM takesPartIn tpi WHERE u.userID = tpi.userID);

--finds all users who are a part of a conversation. -- CORRELATED subquery
SELECT u.userID
FROM users u
WHERE EXISTS (SELECT * FROM takesPartIn tpi WHERE u.userID = tpi.userID);

--shows the min, max, total, and average age of each conversation
SELECT TPI.cid, MIN(U.age) as Minimum Age, MAX(U.age) as Maximum Age, SUM(U.age) as Total Age, AVERAGE(U.age) as Average Age
FROM users U, takespartin TPI
WHERE U.userID = TPI.userID
GROUP BY TPI.cid;

--shows the user who has sent the most messages
SELECT userID, Messages_Sent
FROM (SELECT U.userID, COUNT(M.messageKey) as Messages_Sent
      FROM users U, message M
      WHERE U.userID = M.muid
      GROUP BY U.userID
      ORDER BY Messages_Sent)
WHERE ROWNUM <= 1;

-- shows every user who participates in every conversation Bailey participates in -- DIVISION query
SELECT U.userID, U.lname, U.fname
FROM users U
WHERE NOT EXISTS ((SELECT TPI.cid
                   FROM takespartin TPI, users U2
                   WHERE TPI.userID = U2.userID AND
                         U2.fname = 'Bailey')
                  MINUS
                  (SELECT TPI.cid
                   FROM takespartin TPI
                   WHERE TPI.userID = U.userID));

-- shows each users conversations -- OUTER JOIN query
SELECT U.userID, U.lname, TPI.cid
FROM users U LEFT OUTER JOIN takespartin TPI ON U.userID=TPI.userID;

--
