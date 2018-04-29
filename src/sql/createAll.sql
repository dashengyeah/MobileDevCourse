CREATE TABLE schools(
    id int NOT NULL AUTO_INCREMENT,
    name varchar(64) NOT NULL,
    
    PRIMARY KEY (id)
);

CREATE TABLE users (
    id  varchar(64) NOT NULL ,
    nickname  varchar(128) NULL ,
    passwd  varchar(64) NOT NULL ,
    avatar  varchar(255) NULL ,
    gender  varchar(16),
    birthday  date NULL ,
    school  int NOT NULL ,
    email  varchar(128) NULL ,
    
    PRIMARY KEY (id),
    CHECK (gender IN ('male', 'female', 'other')) ,
    CONSTRAINT userSchool FOREIGN KEY (school) REFERENCES schools(id)
);

CREATE TABLE userrelation (
    userA varchar(64) NOT NULL ,
    userB varchar(64) NOT NULL ,
    action SMALLINT NOT NULL ,
    
    PRIMARY KEY (userA, userB, action),
    CONSTRAINT relationUserA FOREIGN KEY (userA) REFERENCES users(id),
    CONSTRAINT relationUserB FOREIGN KEY (userB) REFERENCES users(id)
);

CREATE TABLE messages (
    id int NOT NULL AUTO_INCREMENT,
    parentid int,
    userid varchar(64) NOT NULL ,
    ownerid varchar(64) NOT NULL ,
    content text NOT NULL ,
    publishdate datetime NOT NULL ,
    isread SMALLINT ,
    
    PRIMARY KEY (id),
    CONSTRAINT userMessage FOREIGN KEY (userid) REFERENCES users(id),
    CONSTRAINT ownerMessage FOREIGN KEY (ownerid) REFERENCES users(id),
    CONSTRAINT messageParent FOREIGN KEY (parentid) REFERENCES messages(id)
);

CREATE TABLE pulses (
    id int NOT NULL AUTO_INCREMENT,
    userid varchar(64) NOT NULL ,
    content text NOT NULL ,
    publishdate datetime NOT NULL ,
    location text NOT NULL,
    
    PRIMARY KEY (id),
    CONSTRAINT userPulse FOREIGN KEY (userid) REFERENCES users(id)
);

CREATE TABLE comments (
    id int NOT NULL AUTO_INCREMENT,
    parentid int,
    pulseid int NOT NULL ,
    userid varchar(64) NOT NULL ,
    content text NOT NULL ,
    publishdate datetime NOT NULL ,
    isread SMALLINT ,
    
    PRIMARY KEY (id),
    CONSTRAINT commentUser FOREIGN KEY (userid) REFERENCES users(id),
    CONSTRAINT commentPulse FOREIGN KEY (pulseid) REFERENCES pulses(id),
    CONSTRAINT commentParent FOREIGN KEY (parentid) REFERENCES comments(id)
);

CREATE TABLE albums (
    id int NOT NULL AUTO_INCREMENT,
    passwd  varchar(64) NOT NULL ,
    userid varchar(64) NOT NULL ,
    name  varchar(128) NOT NULL ,
    intro text ,
    
    PRIMARY KEY (id),
    CONSTRAINT albumUser FOREIGN KEY (userid) REFERENCES users(id)
);

CREATE TABLE pictures (
    id int NOT NULL AUTO_INCREMENT,
    src text NOT NULL ,
    pulseid int ,
    albumid int ,
    publishdate datetime NOT NULL ,
    
    PRIMARY KEY (id),
    CONSTRAINT picturePulse FOREIGN KEY (pulseid) REFERENCES pulses(id),
    CONSTRAINT pictureAlbum FOREIGN KEY (albumid) REFERENCES albums(id)
);