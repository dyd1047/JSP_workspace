CREATE TABLE topcategory(
	topcategory_id  int  primary key auto_increment
	, name varchar(25)
) default character set utf8;
CREATE TABLE subcategory(
	subcategory_id int  primary key auto_increment
	, topcategory_id int
	, name varchar(25)
) default character set utf8;

INSERT INTO TOPCATEGORY (NAME) values('����');
INSERT INTO TOPCATEGORY (NAME) values('����');
INSERT INTO TOpCATEGORY (NAME) values('�׼�����');
INSERT INTO TOPCATEGORY (NAME) values('�Ź�');

INSERT INTO subcategory(topcategory_id,name) values(1,'�����');
INSERT INTO subcategory(topcategory_id,name) values(1,'����');
INSERT INTO subcategory(topcategory_id,name) values(1,'Ƽ����');
INSERT INTO subcategory(topcategory_id,name) values(1,'��Ʈ');

INSERT INTO subcategory(topcategory_id,name) values(2,'û����');
INSERT INTO subcategory(topcategory_id,name) values(2,'ġ��');
INSERT INTO subcategory(topcategory_id,name) values(2,'������');
INSERT INTO subcategory(topcategory_id,name) values(2,'�����');

INSERT INTO subcategory(topcategory_id,name) values(3,'�Ͱ���');
INSERT INTO subcategory(topcategory_id,name) values(3,'����');
INSERT INTO subcategory(topcategory_id,name) values(3,'�����');
INSERT INTO subcategory(topcategory_id,name) values(3,'����');

INSERT INTO subcategory(topcategory_id,name) values(4,'����');
INSERT INTO subcategory(topcategory_id,name) values(4,'����');
INSERT INTO subcategory(topcategory_id,name) values(4,'������');
INSERT INTO subcategory(topcategory_id,name) values(4,'�ȭ');


