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
