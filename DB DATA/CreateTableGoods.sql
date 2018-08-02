CREATE TABLE Goods
(goods_id     CHAR(4)      NOT NULL,
 goods_name    VARCHAR(100) NOT NULL,
 goods_classify VARCHAR(32)  NOT NULL,
 sell_price  INTEGER ,
 buy_price  INTEGER ,
 register_date      DATE ,
 PRIMARY KEY (goods_id)); //(..)안의 값은 중복될 수 없다.

INSERT INTO Goods VALUES ('0001', '티셔츠' ,'의류', 1000, 500, '2009-09-20');
INSERT INTO Goods VALUES ('0002', '펀칭기', '사무용품', 500, 320, '2009-09-11');
INSERT INTO Goods VALUES ('0003', '와이셔츠', '의류', 4000, 2800, NULL);
INSERT INTO Goods VALUES ('0004', '식칼', '주방용품', 3000, 2800, '2009-09-20');
INSERT INTO Goods VALUES ('0005', '압력솥', '주방용품', 6800, 5000, '2009-01-15');
INSERT INTO Goods VALUES ('0006', '포크', '주방용품', 500, NULL, '2009-09-20');
INSERT INTO Goods VALUES ('0007', '도마', '주방용품', 880, 790, '2008-04-28');
INSERT INTO Goods VALUES ('0008', '볼펜', '사무용품', 100, NULL, '2009-11-11');

COMMIT;