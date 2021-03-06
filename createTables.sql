CREATE TYPE userEmail as TABLE OF VARCHAR(254);
/

CREATE TABLE users(
userID INTEGER NOT NULL, --for some reason uid breaks sqlplus
age INTEGER NOT NULL, --  user must be above 12
EMAIL userEmail,         --multivalued attribute, refers to type user email created above
FNAME VARCHAR(35) NOT NULL,
LNAME VARCHAR(35) NOT NULL,
-- uIC1:userID is the primary key - generated by app - no two will be the same
CONSTRAINT uIC111 primary key(userID)
--a constraint user must be above 12 to use app
CONSTRAINT uIC222 CHECK (age > 12)
--constraint that requires '@' to be in the email
CONSTRAINT uIC333 CHECK (userEmail LIKE '@')
--constraint that requres ''.com', '.edu' or '.gov' to be last 4 chars of email
CONSTRAINT uIC333 CHECK (userEmail LIKE '%.com' OR LIKE '%.edu'OR LIKE '%.gov')
)
NESTED TABLE EMAIL STORE AS userEmail_Table;
/
Create table conversation
(
  cid integer not null,
  constraint cIC1 primary key(cid)
);

Create table message --this is a weak entity
(
  messageKey VARCHAR(200) PRIMARY KEY,  -- must have some kind of independent key
  timeSent TIMESTAMP, --not part of key, does not need to be unique
  muid INTEGER NOT NULL, --message user id - part of key
  mcid INTEGER NOT NULL, --part of key - message conversation id
  txt LONG NOT NULL, --contents of the message - contains text and cannot send a null message
  --create constraints - weak entity defined by timesent, user.uid, conversation.cid
  --constraint messagePKey primary key(timeSent),
  constraint messageFKeyUser foreign key(muid) references users(userID) ON DELETE SET NULL,
  constraint messageFKeyConversation foreign key(mcid) references conversation(cid) ON DELETE SET NULL
  --@a constraint that user must be part of conversation to be able to send messages to the conversation
  CONSTRAINT userInConvo CHECK ( takesPartIn(cid) = mcid )

);

Create table media  --can only send one media per message
(
  mKey VARCHAR(200) NOT NULL, --which message is the media a part of? --media must be part of an existing message - therefore there must be a message sent at the same time by the same user in the same conversation for this constraint to be fulfilled
  fileName VARCHAR(260), --260 is max filename length - excludes extension
  fileType VARCHAR(5), --fileType (.gif, .jpg, etc) should not be more than 5 characters long
  --Constraints:
  CONSTRAINT mediaFkeyMessageID foreign key(mKey) references message(messageKey)
--a constraint that requires first character of fileType to be a '.' (if it doesn't start with . then its not a filetype)
  CONSTRAINT mediaFileCheck CHECK (filetype LIKE '.%')
);

Create table takesPartIn
(
  userID INTEGER not null,
  cid INTEGER not null,
--foreign keys from user and conversation
  constraint userForeignKey foreign key(userID) references users(userID),
  constraint convForeignKey foreign key(cid) references conversation(cid)
);

Create Table isFriendsWith
(
  userID INTEGER not null,
  friendID INTEGER,
--both combine to make the key
  CONSTRAINT friendsUserFKey foreign key(userID) references users(userID),
  CONSTRAINT friendsFKey foreign key(friendID) references users(userID)
);

Create Table avatar --has a 1:1 relationship with user - this table contains a list of available profile pictures - user can only pick from this list - no uploading their own pic
( --every avatar can only have 1 user assigned to it - no avatar repeats.
  --a user may or may not have an avatar
  avatarFileName VARCHAR(260) PRIMARY KEY,
  userID INTEGER
);

Create Table iptable
(--The ip address is the key, and users is an attribute.
  --This means that one user can have multiple ip adresses,
  --but each ip address only has one user.
  ipaddress VARCHAR(15) PRIMARY KEY, --In format nnn.nnn.nnn.nnn
  userID INTEGER
);
