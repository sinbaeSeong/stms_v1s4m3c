




CREATE TABLE trash(
    tno INT NOT NULL IDENTITY PRIMARY KEY,
    tname VARCHAR(10) NOT NULL,
    maxcapa FLOAT NOT NULL,
    nowcapa FLOAT NOT NULL,
    location VARCHAR(20) NOT NULL,
    uno INT,
  FOREIGN KEY (uno) REFERENCES user (uno)
);