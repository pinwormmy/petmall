CREATE TABLE Member (	
	id varchar(30) NOT NULL primary key, /* ID */
	pw varchar(50) NOT NULL, /* 비밀번호 */
	name varchar(20) NOT NULL, /* 이름 */
	phone varchar(20), /* 전화번호 */
	address varchar(200), /* 주소 */
	email varchar(100) NOT NULL, /* 이메일 */
	lv int DEFAULT 1 /* 회원등급 */
);

CREATE TABLE PRODUCT (
    PRODUCT_NUM int PRIMARY KEY auto_increment,
    SEARCH_TAG varchar(300),
    NAME varchar(150) NOT NULL,
    PRICE int NOT NULL,
    THUMBNAIL varchar(300),    
    FREE_SHIPPING int(1) DEFAULT 0,
    ON_DISCOUNT int(1) DEFAULT 0,
    REG_DATE DATETIME DEFAULT current_timestamp,
    content varchar(3000),
    review_count int default 0
);

CREATE TABLE PRODUCT_ORDER (
    ORDER_NUM int PRIMARY KEY auto_increment,
    PRODUCT_NUM int,
    QUANTITY int,
    ID varchar(30) NOT NULL,
    ORDER_DATE datetime DEFAULT current_timestamp,
    TOTAL_PRICE int NOT NULL,
    STATUS int(1) DEFAULT 0
);    

CREATE TABLE CART (
    CART_NUM int PRIMARY KEY auto_increment,
    PRODUCT_NUM int NOT NULL,
    QUANTITY int DEFAULT 1,
    ID varchar(30) NOT NULL
);

CREATE TABLE LIKEIT (
    ID varchar(30) NOT NULL,
    PRODUCT_NUM int NOT NULL
);

CREATE TABLE REVIEW (
    REVIEW_NUM int PRIMARY KEY auto_increment,
    PRODUCT_NUM int NOT NULL,
    ID varchar(30) NOT NULL,
    CONTENT varchar(2000),
    REG_DATE datetime DEFAULT current_timestamp
);

insert into member
	values('admin', '1111', '관리자', '010-1234-1234', '서울시 관리구 관리자', 'ozozoz@naver.com', 2);
insert into member
	values('midori', '1111', '미도리', '010-0000-1111', '김포시 야옹구 냥냥', 'midori@cat.com', 1);
    
select * from product;

SELECT A.*, B.price, B.name, B.THUMBNAIL
	FROM CART A
	INNER JOIN PRODUCT B
	ON A.PRODUCT_NUM = B.PRODUCT_NUM
	WHERE A.ID='midori'
	ORDER BY A.CART_NUM DESC;
    
SELECT A.*, B.NAME, B.PRICE, B.THUMBNAIL
	FROM LIKEIT A
    INNER JOIN PRODUCT B
	ON A.PRODUCT_NUM=B.PRODUCT_NUM 
    WHERE ID='midori';
    

commit;