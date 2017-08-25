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

INSERT INTO Item(item_seq,title,writer,photo,content,regdate) VALUES(item_seq.nextval,'����� 30�� ��','���ڿ�','defaultimg.jpg','����� 30�� �˴ϴ� (���)/�װ����',SYSDATE);
INSERT INTO Item(item_seq,title,writer,photo,content,regdate) VALUES(item_seq.nextval,'���� 1�� ��','���Ŀ�','defaultimg.jpg','���� 1�� �˴ϴ� (���)/�װ����',SYSDATE);
INSERT INTO Item(item_seq,title,writer,photo,content,regdate) VALUES(item_seq.nextval,'���ǽ� 30�� ��','�мǿ�','defaultimg.jpg','���ǽ� 30�� �˴ϴ� (���)/�װ����',SYSDATE);
INSERT INTO Item(item_seq,title,writer,photo,content,regdate) VALUES(item_seq.nextval,'ĹŸ�� 30�� ��','�߿�ŷ','defaultimg.jpg','ĹŸ�� 30�� �˴ϴ� (���)/�װ����',SYSDATE);
INSERT INTO Item(item_seq,title,writer,photo,content,regdate) VALUES(item_seq.nextval,'���� 30�� ��','�Ź�ŷ','defaultimg.jpg','���� 30�� �˴ϴ� (���)/�װ����',SYSDATE);

select t2.*
from (select rownum rnum , t.*
from (select * from item order by item_seq desc)t)t2
where t2.rnum between 1 and 5;

