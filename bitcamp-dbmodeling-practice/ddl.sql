-- 업주
CREATE TABLE P2_OWN (
	ONO    INTEGER     NOT NULL COMMENT '업주번호', -- 업주번호
	OW_SSN VARCHAR(13) NOT NULL COMMENT '주민번호', -- 주민번호
	OW_BN  INTEGER     NOT NULL COMMENT '사업자번호' -- 사업자번호
)
COMMENT '업주';

-- 업주
ALTER TABLE P2_OWN
	ADD CONSTRAINT PK_P2_OWN -- 업주 기본키
		PRIMARY KEY (
			ONO -- 업주번호
		);

-- 3
CREATE TABLE TABLE2 (
)
COMMENT '3';

-- 고객
CREATE TABLE P2_CUST (
	CNO      INTEGER     NOT NULL COMMENT '고객번호', -- 고객번호
	APP_CUST VARCHAR(50) NULL     COMMENT '어플고객', -- 어플고객
	VIS_CUST VARCHAR(50) NULL     COMMENT '방문고객' -- 방문고객
)
COMMENT '고객';

-- 고객
ALTER TABLE P2_CUST
	ADD CONSTRAINT PK_P2_CUST -- 고객 기본키
		PRIMARY KEY (
			CNO -- 고객번호
		);

-- 종업원
CREATE TABLE P2_EMP (
	ENO    INTEGER NOT NULL COMMENT '종업원번호', -- 종업원번호
	EM_CD  INTEGER NOT NULL COMMENT '직종코드', -- 직종코드
	SNO    INTEGER NOT NULL COMMENT '매장번호', -- 매장번호
	EM_SAL INTEGER NOT NULL COMMENT '월급' -- 월급
)
COMMENT '종업원';

-- 종업원
ALTER TABLE P2_EMP
	ADD CONSTRAINT PK_P2_EMP -- 종업원 기본키
		PRIMARY KEY (
			ENO -- 종업원번호
		);

-- 직종
CREATE TABLE P2_EMCD (
	EM_CD INTEGER     NOT NULL COMMENT '직종코드', -- 직종코드
	NAME  VARCHAR(50) NOT NULL COMMENT '직종명' -- 직종명
)
COMMENT '직종';

-- 직종
ALTER TABLE P2_EMCD
	ADD CONSTRAINT PK_P2_EMCD -- 직종 기본키
		PRIMARY KEY (
			EM_CD -- 직종코드
		);

ALTER TABLE P2_EMCD
	MODIFY COLUMN EM_CD INTEGER NOT NULL AUTO_INCREMENT COMMENT '직종코드';

-- 사람
CREATE TABLE P2_PERS (
	PNO   INTEGER     NOT NULL COMMENT '사람번호', -- 사람번호
	NAME  VARCHAR(50) NOT NULL COMMENT '이름', -- 이름
	EMAIL VARCHAR(40) NOT NULL COMMENT '이메일', -- 이메일
	TEL   VARCHAR(30) NOT NULL COMMENT '전화' -- 전화
)
COMMENT '사람';

-- 사람
ALTER TABLE P2_PERS
	ADD CONSTRAINT PK_P2_PERS -- 사람 기본키
		PRIMARY KEY (
			PNO -- 사람번호
		);

-- 사람 유니크 인덱스
CREATE UNIQUE INDEX UIX_P2_PERS
	ON P2_PERS ( -- 사람
		EMAIL ASC -- 이메일
	);

ALTER TABLE P2_PERS
	MODIFY COLUMN PNO INTEGER NOT NULL AUTO_INCREMENT COMMENT '사람번호';

-- 쿠폰
CREATE TABLE P2_CUP (
	CNO INTEGER  NOT NULL COMMENT '쿠폰번호', -- 쿠폰번호
	CDR INTEGER  NOT NULL COMMENT '할인율', -- 할인율
	CYN CHAR(1)  NOT NULL COMMENT '사용여부', -- 사용여부
	SDT DATETIME NOT NULL COMMENT '발행날짜', -- 발행날짜
	EDT DATETIME NOT NULL COMMENT '만료날짜', -- 만료날짜
	SNO INTEGER  NOT NULL COMMENT '매장번호', -- 매장번호
	MNO INTEGER  NOT NULL COMMENT '메뉴번호' -- 메뉴번호
)
COMMENT '쿠폰';

-- 쿠폰
ALTER TABLE P2_CUP
	ADD CONSTRAINT PK_P2_CUP -- 쿠폰 기본키
		PRIMARY KEY (
			CNO -- 쿠폰번호
		);

-- 예약주문
CREATE TABLE P2_RESV (
	ORNO    INTEGER  NOT NULL COMMENT '주문번호', -- 주문번호
	RS_DT   DATETIME NOT NULL COMMENT '예약날짜', -- 예약날짜
	RS_PCNT INTEGER  NOT NULL COMMENT '예약인원' -- 예약인원
)
COMMENT '예약주문';

-- 예약주문
ALTER TABLE P2_RESV
	ADD CONSTRAINT PK_P2_RESV -- 예약주문 기본키
		PRIMARY KEY (
			ORNO -- 주문번호
		);

-- 주문
CREATE TABLE P2_ORD (
	ORNO   INTEGER     NOT NULL COMMENT '주문번호', -- 주문번호
	ODT    DATETIME    NOT NULL COMMENT '주문날짜', -- 주문날짜
	OMEN   VARCHAR(50) NOT NULL COMMENT '주문메뉴', -- 주문메뉴
	OR_STR VARCHAR(50) NOT NULL COMMENT '주문매장', -- 주문매장
	CPYN   CHAR(1)     NOT NULL COMMENT '쿠폰여부', -- 쿠폰여부
	OR_CO  INTEGER     NOT NULL COMMENT '결제금액', -- 결제금액
	TNO    INTEGER     NOT NULL COMMENT '테이블번호', -- 테이블번호
	OR_YN  CHAR(1)     NOT NULL COMMENT '결제완료여부', -- 결제완료여부
	OR_MT  VARCHAR(50) NOT NULL COMMENT '주문방식', -- 주문방식
	CNO2   INTEGER     NULL     COMMENT '쿠폰번호', -- 쿠폰번호
	SNO    INTEGER     NOT NULL COMMENT '매장번호', -- 매장번호
	CNO    INTEGER     NOT NULL COMMENT '고객번호', -- 고객번호
	MNO    INTEGER     NOT NULL COMMENT '메뉴번호' -- 메뉴번호
)
COMMENT '주문';

-- 주문
ALTER TABLE P2_ORD
	ADD CONSTRAINT PK_P2_ORD -- 주문 기본키
		PRIMARY KEY (
			ORNO -- 주문번호
		);

-- 매장매뉴
CREATE TABLE P2_STMN (
	SNO INTEGER NOT NULL COMMENT '매장번호', -- 매장번호
	MNO INTEGER NOT NULL COMMENT '메뉴번호' -- 메뉴번호
)
COMMENT '매장매뉴';

-- 테이블매뉴
CREATE TABLE TABLE10 (
	MNO INTEGER NULL COMMENT '메뉴번호', -- 메뉴번호
	TNO INTEGER NULL COMMENT '테이블번호' -- 테이블번호
)
COMMENT '테이블매뉴';

-- 매뉴
CREATE TABLE P2_MENU (
	MNO   INTEGER     NOT NULL COMMENT '메뉴번호', -- 메뉴번호
	NAME  VARCHAR(50) NOT NULL COMMENT '메뉴명', -- 메뉴명
	PRICE INTEGER     NOT NULL COMMENT '메뉴가격' -- 메뉴가격
)
COMMENT '매뉴';

-- 매뉴
ALTER TABLE P2_MENU
	ADD CONSTRAINT PK_P2_MENU -- 매뉴 기본키
		PRIMARY KEY (
			MNO -- 메뉴번호
		);

-- 매장
CREATE TABLE P2_STOR (
	SNO   INTEGER      NOT NULL COMMENT '매장번호', -- 매장번호
	NAME  VARCHAR(50)  NOT NULL COMMENT '매장명', -- 매장명
	LOC   VARCHAR(255) NOT NULL COMMENT '위치', -- 위치
	SDT   DATETIME     NOT NULL COMMENT '개점시간', -- 개점시간
	EDT   DATETIME     NOT NULL COMMENT '페점시간', -- 페점시간
	CONT  TEXT         NOT NULL COMMENT '설명', -- 설명
	PHOTO VARCHAR(255) NULL     COMMENT '사진', -- 사진
	TEL   VARCHAR(30)  NOT NULL COMMENT '전화', -- 전화
	ONO   INTEGER      NOT NULL COMMENT '업주번호' -- 업주번호
)
COMMENT '매장';

-- 매장
ALTER TABLE P2_STOR
	ADD CONSTRAINT PK_P2_STOR -- 매장 기본키
		PRIMARY KEY (
			SNO -- 매장번호
		);

-- 테이블
CREATE TABLE P2_TB (
	TNO   INTEGER NOT NULL COMMENT '테이블번호', -- 테이블번호
	T_MAX INTEGER NOT NULL COMMENT '수용인원', -- 수용인원
	SNO   INTEGER NOT NULL COMMENT '매장번호' -- 매장번호
)
COMMENT '테이블';

-- 테이블
ALTER TABLE P2_TB
	ADD CONSTRAINT PK_P2_TB -- 테이블 기본키
		PRIMARY KEY (
			TNO -- 테이블번호
		);

-- 비용
CREATE TABLE P2_COST (
	CNO INTEGER NOT NULL COMMENT '비용번호', -- 비용번호
	TLC INTEGER NOT NULL COMMENT '인건비총계', -- 인건비총계
	TFC INTEGER NOT NULL COMMENT '재료비총계', -- 재료비총계
	MC  INTEGER NOT NULL COMMENT '월세', -- 월세
	GC  INTEGER NOT NULL COMMENT '가스', -- 가스
	EC  INTEGER NOT NULL COMMENT '전기', -- 전기
	WC  INTEGER NOT NULL COMMENT '수도', -- 수도
	SNO INTEGER NOT NULL COMMENT '매장번호' -- 매장번호
)
COMMENT '비용';

-- 비용
ALTER TABLE P2_COST
	ADD CONSTRAINT PK_P2_COST -- 비용 기본키
		PRIMARY KEY (
			CNO -- 비용번호
		);

-- 인건비
CREATE TABLE P2_LC (
	ENO    INTEGER NOT NULL COMMENT '종업원번호', -- 종업원번호
	LC_SAL INTEGER NOT NULL COMMENT '급여' -- 급여
)
COMMENT '인건비';

-- 인건비
ALTER TABLE P2_LC
	ADD CONSTRAINT PK_P2_LC -- 인건비 기본키
		PRIMARY KEY (
			ENO -- 종업원번호
		);

-- 총계
CREATE TABLE TABLE15 (
)
COMMENT '총계';

-- 재료
CREATE TABLE P2_MAT (
	MNO   INTEGER     NOT NULL COMMENT '재료번호', -- 재료번호
	NAME  VARCHAR(50) NOT NULL COMMENT '재료명', -- 재료명
	PRICE INTEGER     NOT NULL COMMENT '재료가격' -- 재료가격
)
COMMENT '재료';

-- 재료
ALTER TABLE P2_MAT
	ADD CONSTRAINT PK_P2_MAT -- 재료 기본키
		PRIMARY KEY (
			MNO -- 재료번호
		);

-- 메뉴재료
CREATE TABLE P2_MTMN (
	MNO2 INTEGER NOT NULL COMMENT '재료번호', -- 재료번호
	MNO  INTEGER NOT NULL COMMENT '메뉴번호' -- 메뉴번호
)
COMMENT '메뉴재료';

-- 메뉴재료
ALTER TABLE P2_MTMN
	ADD CONSTRAINT PK_P2_MTMN -- 메뉴재료 기본키
		PRIMARY KEY (
			MNO2, -- 재료번호
			MNO   -- 메뉴번호
		);

-- 매출
CREATE TABLE P2_RVN (
	RNO INTEGER NOT NULL COMMENT '매출번호', -- 매출번호
	SNO INTEGER NOT NULL COMMENT '매장번호', -- 매장번호
	RC  INTEGER NOT NULL COMMENT '매출액' -- 매출액
)
COMMENT '매출';

-- 매출
ALTER TABLE P2_RVN
	ADD CONSTRAINT PK_P2_RVN -- 매출 기본키
		PRIMARY KEY (
			RNO -- 매출번호
		);

-- 업주
ALTER TABLE P2_OWN
	ADD CONSTRAINT FK_P2_PERS_TO_P2_OWN -- 사람 -> 업주
		FOREIGN KEY (
			ONO -- 업주번호
		)
		REFERENCES P2_PERS ( -- 사람
			PNO -- 사람번호
		);

-- 고객
ALTER TABLE P2_CUST
	ADD CONSTRAINT FK_P2_PERS_TO_P2_CUST -- 사람 -> 고객
		FOREIGN KEY (
			CNO -- 고객번호
		)
		REFERENCES P2_PERS ( -- 사람
			PNO -- 사람번호
		);

-- 종업원
ALTER TABLE P2_EMP
	ADD CONSTRAINT FK_P2_PERS_TO_P2_EMP -- 사람 -> 종업원
		FOREIGN KEY (
			ENO -- 종업원번호
		)
		REFERENCES P2_PERS ( -- 사람
			PNO -- 사람번호
		);

-- 종업원
ALTER TABLE P2_EMP
	ADD CONSTRAINT FK_P2_EMCD_TO_P2_EMP -- 직종 -> 종업원
		FOREIGN KEY (
			EM_CD -- 직종코드
		)
		REFERENCES P2_EMCD ( -- 직종
			EM_CD -- 직종코드
		);

-- 종업원
ALTER TABLE P2_EMP
	ADD CONSTRAINT FK_P2_STOR_TO_P2_EMP -- 매장 -> 종업원
		FOREIGN KEY (
			SNO -- 매장번호
		)
		REFERENCES P2_STOR ( -- 매장
			SNO -- 매장번호
		);

-- 쿠폰
ALTER TABLE P2_CUP
	ADD CONSTRAINT FK_P2_STOR_TO_P2_CUP -- 매장 -> 쿠폰
		FOREIGN KEY (
			SNO -- 매장번호
		)
		REFERENCES P2_STOR ( -- 매장
			SNO -- 매장번호
		);

-- 쿠폰
ALTER TABLE P2_CUP
	ADD CONSTRAINT FK_P2_MENU_TO_P2_CUP -- 매뉴 -> 쿠폰
		FOREIGN KEY (
			MNO -- 메뉴번호
		)
		REFERENCES P2_MENU ( -- 매뉴
			MNO -- 메뉴번호
		);

-- 예약주문
ALTER TABLE P2_RESV
	ADD CONSTRAINT FK_P2_ORD_TO_P2_RESV -- 주문 -> 예약주문
		FOREIGN KEY (
			ORNO -- 주문번호
		)
		REFERENCES P2_ORD ( -- 주문
			ORNO -- 주문번호
		);

-- 주문
ALTER TABLE P2_ORD
	ADD CONSTRAINT FK_P2_CUP_TO_P2_ORD -- 쿠폰 -> 주문
		FOREIGN KEY (
			CNO2 -- 쿠폰번호
		)
		REFERENCES P2_CUP ( -- 쿠폰
			CNO -- 쿠폰번호
		);

-- 주문
ALTER TABLE P2_ORD
	ADD CONSTRAINT FK_P2_STOR_TO_P2_ORD -- 매장 -> 주문
		FOREIGN KEY (
			SNO -- 매장번호
		)
		REFERENCES P2_STOR ( -- 매장
			SNO -- 매장번호
		);

-- 주문
ALTER TABLE P2_ORD
	ADD CONSTRAINT FK_P2_CUST_TO_P2_ORD -- 고객 -> 주문
		FOREIGN KEY (
			CNO -- 고객번호
		)
		REFERENCES P2_CUST ( -- 고객
			CNO -- 고객번호
		);

-- 주문
ALTER TABLE P2_ORD
	ADD CONSTRAINT FK_P2_MENU_TO_P2_ORD -- 매뉴 -> 주문
		FOREIGN KEY (
			MNO -- 메뉴번호
		)
		REFERENCES P2_MENU ( -- 매뉴
			MNO -- 메뉴번호
		);

-- 주문
ALTER TABLE P2_ORD
	ADD CONSTRAINT FK_P2_TB_TO_P2_ORD -- 테이블 -> 주문
		FOREIGN KEY (
			TNO -- 테이블번호
		)
		REFERENCES P2_TB ( -- 테이블
			TNO -- 테이블번호
		);

-- 매장매뉴
ALTER TABLE P2_STMN
	ADD CONSTRAINT FK_P2_STOR_TO_P2_STMN -- 매장 -> 매장매뉴
		FOREIGN KEY (
			SNO -- 매장번호
		)
		REFERENCES P2_STOR ( -- 매장
			SNO -- 매장번호
		);

-- 매장매뉴
ALTER TABLE P2_STMN
	ADD CONSTRAINT FK_P2_MENU_TO_P2_STMN -- 매뉴 -> 매장매뉴
		FOREIGN KEY (
			MNO -- 메뉴번호
		)
		REFERENCES P2_MENU ( -- 매뉴
			MNO -- 메뉴번호
		);

-- 테이블매뉴
ALTER TABLE TABLE10
	ADD CONSTRAINT FK_P2_MENU_TO_TABLE10 -- 매뉴 -> 테이블매뉴
		FOREIGN KEY (
			MNO -- 메뉴번호
		)
		REFERENCES P2_MENU ( -- 매뉴
			MNO -- 메뉴번호
		);

-- 테이블매뉴
ALTER TABLE TABLE10
	ADD CONSTRAINT FK_P2_TB_TO_TABLE10 -- 테이블 -> 테이블매뉴
		FOREIGN KEY (
			TNO -- 테이블번호
		)
		REFERENCES P2_TB ( -- 테이블
			TNO -- 테이블번호
		);

-- 매장
ALTER TABLE P2_STOR
	ADD CONSTRAINT FK_P2_OWN_TO_P2_STOR -- 업주 -> 매장
		FOREIGN KEY (
			ONO -- 업주번호
		)
		REFERENCES P2_OWN ( -- 업주
			ONO -- 업주번호
		);

-- 테이블
ALTER TABLE P2_TB
	ADD CONSTRAINT FK_P2_STOR_TO_P2_TB -- 매장 -> 테이블
		FOREIGN KEY (
			SNO -- 매장번호
		)
		REFERENCES P2_STOR ( -- 매장
			SNO -- 매장번호
		);

-- 비용
ALTER TABLE P2_COST
	ADD CONSTRAINT FK_P2_STOR_TO_P2_COST -- 매장 -> 비용
		FOREIGN KEY (
			SNO -- 매장번호
		)
		REFERENCES P2_STOR ( -- 매장
			SNO -- 매장번호
		);

-- 인건비
ALTER TABLE P2_LC
	ADD CONSTRAINT FK_P2_EMP_TO_P2_LC -- 종업원 -> 인건비
		FOREIGN KEY (
			ENO -- 종업원번호
		)
		REFERENCES P2_EMP ( -- 종업원
			ENO -- 종업원번호
		);

-- 메뉴재료
ALTER TABLE P2_MTMN
	ADD CONSTRAINT FK_P2_MAT_TO_P2_MTMN -- 재료 -> 메뉴재료
		FOREIGN KEY (
			MNO2 -- 재료번호
		)
		REFERENCES P2_MAT ( -- 재료
			MNO -- 재료번호
		);

-- 메뉴재료
ALTER TABLE P2_MTMN
	ADD CONSTRAINT FK_P2_MENU_TO_P2_MTMN -- 매뉴 -> 메뉴재료
		FOREIGN KEY (
			MNO -- 메뉴번호
		)
		REFERENCES P2_MENU ( -- 매뉴
			MNO -- 메뉴번호
		);

-- 매출
ALTER TABLE P2_RVN
	ADD CONSTRAINT FK_P2_STOR_TO_P2_RVN -- 매장 -> 매출
		FOREIGN KEY (
			SNO -- 매장번호
		)
		REFERENCES P2_STOR ( -- 매장
			SNO -- 매장번호
		);