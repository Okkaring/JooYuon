--******************************
--[0]	CREATE ITEM_SEQ NUM
--*************DDL**************
CREATE SEQUENCE item_seq
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;

<!-- drop sequence item_seq; -->
--******************************
--[1]	ITEM_TAB
--*************DDL**************

CREATE TABLE Item(
	item_seq NUMBER,
	title VARCHAR2(20),
	writer VARCHAR2(20),
	regdate DATE,
	photo VARCHAR2(20),
	content VARCHAR2(100)
);

<!-- DROP TABLE Item; -->

--*************DML**************
SELECT * FROM Item;
delete from item where item_seq=NULL;

INSERT INTO Item(item_seq,title,writer,photo,content,regdate) VALUES(item_seq.nextval,'냉장고 30만 팜','전자왕','defaultimg.jpg','냉장고 30만 팝니다 (당산)/네고없음',SYSDATE);
INSERT INTO Item(item_seq,title,writer,photo,content,regdate) VALUES(item_seq.nextval,'뮤즐리 1만 팜','음식왕','defaultimg.jpg','뮤즐리 1만 팝니다 (당산)/네고없음',SYSDATE);
INSERT INTO Item(item_seq,title,writer,photo,content,regdate) VALUES(item_seq.nextval,'원피스 30만 팜','패션왕','defaultimg.jpg','원피스 30만 팝니다 (당산)/네고없음',SYSDATE);
INSERT INTO Item(item_seq,title,writer,photo,content,regdate) VALUES(item_seq.nextval,'캣타워 30만 팜','야옹킹','defaultimg.jpg','캣타워 30만 팝니다 (당산)/네고없음',SYSDATE);
INSERT INTO Item(item_seq,title,writer,photo,content,regdate) VALUES(item_seq.nextval,'조던 30만 팜','신발킹','defaultimg.jpg','조던 30만 팝니다 (당산)/네고없음',SYSDATE);

select t2.*
from (select rownum rnum , t.*
from (select * from item order by item_seq desc)t)t2
where t2.rnum between 1 and 5;

