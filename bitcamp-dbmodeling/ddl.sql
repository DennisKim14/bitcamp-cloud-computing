-- 수강신청
DROP TABLE IF EXISTS P1_APPL RESTRICT;

-- 학생
DROP TABLE IF EXISTS P1_STUD RESTRICT;

-- 강사
DROP TABLE IF EXISTS P1_TCH RESTRICT;

-- 강의실
DROP TABLE IF EXISTS P1_CLR_ROOM RESTRICT;

-- 매니저
DROP TABLE IF EXISTS P1_MGR RESTRICT;

-- 개설교육과정
DROP TABLE IF EXISTS P1_OPEN_CORS RESTRICT;

-- 프로젝트
DROP TABLE IF EXISTS P1_PRJ RESTRICT;

-- 과목
DROP TABLE IF EXISTS P1_SUB RESTRICT;

-- 강의과목
DROP TABLE IF EXISTS P1_TCH_SUB RESTRICT;

-- 프로젝트참여자
DROP TABLE IF EXISTS P1_PRJ_MEMB RESTRICT;

-- 교육과정과목
DROP TABLE IF EXISTS P1_CORS_SUB RESTRICT;

-- 교육과정수강생
DROP TABLE IF EXISTS P1_CORS_STUD RESTRICT;

-- 강의실사진
DROP TABLE IF EXISTS P1_CLR_PHOTO RESTRICT;

-- 주소
DROP TABLE IF EXISTS P1_ADDR RESTRICT;

-- 교육과정
DROP TABLE IF EXISTS P1_CORS RESTRICT;

-- 회원
DROP TABLE IF EXISTS P1_MEMB RESTRICT;

-- 수강신청
CREATE TABLE P1_APPL (
    ANO  INTEGER NOT NULL COMMENT '수강신청번호', -- 수강신청번호
    OCNO INTEGER NOT NULL COMMENT '개설교육과정번호', -- 개설교육과정번호
    SNO  INTEGER NOT NULL COMMENT '학생번호', -- 학생번호
    RDT  DATE    NOT NULL COMMENT '신청일', -- 신청일
    STAT INTEGER NULL     DEFAULT 0 COMMENT '상태' -- 상태
)
COMMENT '수강신청';

-- 수강신청
ALTER TABLE P1_APPL
    ADD CONSTRAINT PK_P1_APPL -- 수강신청 기본키
        PRIMARY KEY (
            ANO -- 수강신청번호
        );

-- 수강신청 유니크 인덱스
CREATE UNIQUE INDEX UIX_P1_APPL
    ON P1_APPL ( -- 수강신청
        OCNO ASC -- 개설교육과정번호
    );

ALTER TABLE P1_APPL
    MODIFY COLUMN ANO INTEGER NOT NULL AUTO_INCREMENT COMMENT '수강신청번호';

-- 학생
CREATE TABLE P1_STUD (
    SNO      INTEGER      NOT NULL COMMENT '학생번호', -- 학생번호
    WORK     CHAR(1)      NOT NULL COMMENT '재직여부', -- 재직여부
    ADDRNO   INTEGER      NULL     COMMENT '주소번호', -- 주소번호
    DET_ADDR VARCHAR(255) NULL     COMMENT '상세주소', -- 상세주소
    LST_SCHL VARCHAR(50)  NOT NULL COMMENT '최종학력', -- 최종학력
    MAJ      VARCHAR(50)  NOT NULL COMMENT '전공' -- 전공
)
COMMENT '학생';

-- 학생
ALTER TABLE P1_STUD
    ADD CONSTRAINT PK_P1_STUD -- 학생 기본키
        PRIMARY KEY (
            SNO -- 학생번호
        );

-- 강사
CREATE TABLE P1_TCH (
    MNO    INTEGER NOT NULL COMMENT '강사번호', -- 강사번호
    HR_PAY INTEGER NOT NULL COMMENT '강사료' -- 강사료
)
COMMENT '강사';

-- 강사
ALTER TABLE P1_TCH
    ADD CONSTRAINT PK_P1_TCH -- 강사 기본키
        PRIMARY KEY (
            MNO -- 강사번호
        );

-- 강의실
CREATE TABLE P1_CLR_ROOM (
    CLRNO  INTEGER     NOT NULL COMMENT '강의실번호', -- 강의실번호
    LOC    VARCHAR(50) NOT NULL COMMENT '센터', -- 센터
    TITL   VARCHAR(50) NOT NULL COMMENT '강의실명', -- 강의실명
    MX_QTY INTEGER     NOT NULL COMMENT '최대수용인원' -- 최대수용인원
)
COMMENT '강의실';

-- 강의실
ALTER TABLE P1_CLR_ROOM
    ADD CONSTRAINT PK_P1_CLR_ROOM -- 강의실 기본키
        PRIMARY KEY (
            CLRNO -- 강의실번호
        );

-- 강의실 유니크 인덱스
CREATE UNIQUE INDEX UIX_P1_CLR_ROOM
    ON P1_CLR_ROOM ( -- 강의실
        TITL ASC, -- 강의실명
        LOC ASC   -- 센터
    );

ALTER TABLE P1_CLR_ROOM
    MODIFY COLUMN CLRNO INTEGER NOT NULL AUTO_INCREMENT COMMENT '강의실번호';

-- 매니저
CREATE TABLE P1_MGR (
    MGNO INTEGER     NOT NULL COMMENT '매니저번호', -- 매니저번호
    POSI VARCHAR(50) NOT NULL COMMENT '직위' -- 직위
)
COMMENT '매니저';

-- 매니저
ALTER TABLE P1_MGR
    ADD CONSTRAINT PK_P1_MGR -- 매니저 기본키
        PRIMARY KEY (
            MGNO -- 매니저번호
        );

-- 개설교육과정
CREATE TABLE P1_OPEN_CORS (
    OCNO   INTEGER     NOT NULL COMMENT '개설교육과정번호', -- 개설교육과정번호
    CNO    VARCHAR(50) NULL     COMMENT '교육기수', -- 교육기수
    SDT    DATE        NOT NULL COMMENT '시작일', -- 시작일
    EDT    DATE        NOT NULL COMMENT '종료일', -- 종료일
    TOT_TM INTEGER     NOT NULL COMMENT '교육시간', -- 교육시간
    DAY_HR INTEGER     NOT NULL COMMENT '일교육시간', -- 일교육시간
    CLRNO  INTEGER     NULL     COMMENT '강의실번호', -- 강의실번호
    CRNO   INTEGER     NOT NULL COMMENT '교육과정번호', -- 교육과정번호
    MGNO   INTEGER     NULL     COMMENT '매니저번호' -- 매니저번호
)
COMMENT '개설교육과정';

-- 개설교육과정
ALTER TABLE P1_OPEN_CORS
    ADD CONSTRAINT PK_P1_OPEN_CORS -- 개설교육과정 기본키
        PRIMARY KEY (
            OCNO -- 개설교육과정번호
        );

ALTER TABLE P1_OPEN_CORS
    MODIFY COLUMN OCNO INTEGER NOT NULL AUTO_INCREMENT COMMENT '개설교육과정번호';

-- 프로젝트
CREATE TABLE P1_PRJ (
    PNO  INTEGER     NOT NULL COMMENT '프로젝트번호', -- 프로젝트번호
    OCNO INTEGER     NOT NULL COMMENT '개설교육과정번호', -- 개설교육과정번호
    TITL VARCHAR(50) NOT NULL COMMENT '프로젝트명', -- 프로젝트명
    CONT TEXT        NOT NULL COMMENT '내용', -- 내용
    SDT  DATE        NULL     COMMENT '시작일', -- 시작일
    EDT  DATE        NULL     COMMENT '종료일' -- 종료일
)
COMMENT '프로젝트';

-- 프로젝트
ALTER TABLE P1_PRJ
    ADD CONSTRAINT PK_P1_PRJ -- 프로젝트 기본키
        PRIMARY KEY (
            PNO -- 프로젝트번호
        );

-- 프로젝트 인덱스
CREATE INDEX IX_P1_PRJ
    ON P1_PRJ( -- 프로젝트
        TITL ASC -- 프로젝트명
    );

ALTER TABLE P1_PRJ
    MODIFY COLUMN PNO INTEGER NOT NULL AUTO_INCREMENT COMMENT '프로젝트번호';

-- 과목
CREATE TABLE P1_SUB (
    SNO  INTEGER      NOT NULL COMMENT '과목번호', -- 과목번호
    TITL VARCHAR(255) NOT NULL COMMENT '과목명', -- 과목명
    CONT TEXT         NOT NULL COMMENT '과목설명' -- 과목설명
)
COMMENT '과목';

-- 과목
ALTER TABLE P1_SUB
    ADD CONSTRAINT PK_P1_SUB -- 과목 기본키
        PRIMARY KEY (
            SNO -- 과목번호
        );

-- 과목 유니크 인덱스
CREATE UNIQUE INDEX UIX_P1_SUB
    ON P1_SUB ( -- 과목
        TITL ASC -- 과목명
    );

ALTER TABLE P1_SUB
    MODIFY COLUMN SNO INTEGER NOT NULL AUTO_INCREMENT COMMENT '과목번호';

-- 강의과목
CREATE TABLE P1_TCH_SUB (
    SNO INTEGER NOT NULL COMMENT '과목번호', -- 과목번호
    MNO INTEGER NOT NULL COMMENT '강사번호' -- 강사번호
)
COMMENT '강의과목';

-- 강의과목
ALTER TABLE P1_TCH_SUB
    ADD CONSTRAINT PK_P1_TCH_SUB -- 강의과목 기본키
        PRIMARY KEY (
            SNO, -- 과목번호
            MNO  -- 강사번호
        );

-- 프로젝트참여자
CREATE TABLE P1_PRJ_MEMB (
    PNO INTEGER NOT NULL COMMENT '프로젝트번호', -- 프로젝트번호
    SNO INTEGER NOT NULL COMMENT '학생번호' -- 학생번호
)
COMMENT '프로젝트참여자';

-- 프로젝트참여자
ALTER TABLE P1_PRJ_MEMB
    ADD CONSTRAINT PK_P1_PRJ_MEMB -- 프로젝트참여자 기본키
        PRIMARY KEY (
            PNO, -- 프로젝트번호
            SNO  -- 학생번호
        );

-- 교육과정과목
CREATE TABLE P1_CORS_SUB (
    OCNO INTEGER NOT NULL COMMENT '개설교육과정번호', -- 개설교육과정번호
    TITL INTEGER NOT NULL COMMENT '과목번호', -- 과목번호
    CONT INTEGER NULL     COMMENT '강사번호' -- 강사번호
)
COMMENT '교육과정과목';

-- 교육과정과목
ALTER TABLE P1_CORS_SUB
    ADD CONSTRAINT PK_P1_CORS_SUB -- 교육과정과목 기본키
        PRIMARY KEY (
            OCNO, -- 개설교육과정번호
            TITL  -- 과목번호
        );

-- 교육과정수강생
CREATE TABLE P1_CORS_STUD (
    OCNO INTEGER NOT NULL COMMENT '개설교육과정번호', -- 개설교육과정번호
    SNO  INTEGER NOT NULL COMMENT '학생번호' -- 학생번호
)
COMMENT '교육과정수강생';

-- 교육과정수강생
ALTER TABLE P1_CORS_STUD
    ADD CONSTRAINT PK_P1_CORS_STUD -- 교육과정수강생 기본키
        PRIMARY KEY (
            OCNO, -- 개설교육과정번호
            SNO   -- 학생번호
        );

-- 강의실사진
CREATE TABLE P1_CLR_PHOTO (
    CPNO  INTEGER      NOT NULL COMMENT '강의실사진번호', -- 강의실사진번호
    CLRNO INTEGER      NOT NULL COMMENT '강의실번호', -- 강의실번호
    PHOTO VARCHAR(255) NOT NULL COMMENT '사진' -- 사진
)
COMMENT '강의실사진';

-- 강의실사진
ALTER TABLE P1_CLR_PHOTO
    ADD CONSTRAINT PK_P1_CLR_PHOTO -- 강의실사진 기본키
        PRIMARY KEY (
            CPNO -- 강의실사진번호
        );

ALTER TABLE P1_CLR_PHOTO
    MODIFY COLUMN CPNO INTEGER NOT NULL AUTO_INCREMENT COMMENT '강의실사진번호';

-- 주소
CREATE TABLE P1_ADDR (
    ADDRNO   INTEGER      NOT NULL COMMENT '주소번호', -- 주소번호
    PSTNO    VARCHAR(10)  NOT NULL COMMENT '우편번호', -- 우편번호
    BAS_ADDR VARCHAR(255) NOT NULL COMMENT '기본주소' -- 기본주소
)
COMMENT '주소';

-- 주소
ALTER TABLE P1_ADDR
    ADD CONSTRAINT PK_P1_ADDR -- 주소 기본키
        PRIMARY KEY (
            ADDRNO -- 주소번호
        );

-- 주소 인덱스
CREATE INDEX IX_P1_ADDR
    ON P1_ADDR( -- 주소
        PSTNO ASC -- 우편번호
    );

ALTER TABLE P1_ADDR
    MODIFY COLUMN ADDRNO INTEGER NOT NULL AUTO_INCREMENT COMMENT '주소번호';

-- 교육과정
CREATE TABLE P1_CORS (
    CRNO INTEGER      NOT NULL COMMENT '교육과정번호', -- 교육과정번호
    TITL VARCHAR(255) NOT NULL COMMENT '과정명', -- 과정명
    CONT TEXT         NOT NULL COMMENT '과정설명' -- 과정설명
)
COMMENT '교육과정';

-- 교육과정
ALTER TABLE P1_CORS
    ADD CONSTRAINT PK_P1_CORS -- 교육과정 기본키
        PRIMARY KEY (
            CRNO -- 교육과정번호
        );

-- 교육과정 인덱스
CREATE INDEX IX_P1_CORS
    ON P1_CORS( -- 교육과정
        TITL ASC -- 과정명
    );

ALTER TABLE P1_CORS
    MODIFY COLUMN CRNO INTEGER NOT NULL AUTO_INCREMENT COMMENT '교육과정번호';

-- 회원
CREATE TABLE P1_MEMB (
    MNO   INTEGER      NOT NULL COMMENT '회원번호', -- 회원번호
    NAME  VARCHAR(50)  NOT NULL COMMENT '이름', -- 이름
    EMAIL VARCHAR(40)  NOT NULL COMMENT '이메일', -- 이메일
    PWD   VARCHAR(255) NOT NULL COMMENT '암호', -- 암호
    TEL   VARCHAR(30)  NOT NULL COMMENT '전화', -- 전화
    PHOTO VARCHAR(255) NULL     COMMENT '사진' -- 사진
)
COMMENT '회원';

-- 회원
ALTER TABLE P1_MEMB
    ADD CONSTRAINT PK_P1_MEMB -- 회원 기본키
        PRIMARY KEY (
            MNO -- 회원번호
        );

-- 회원 유니크 인덱스
CREATE UNIQUE INDEX UIX_P1_MEMB
    ON P1_MEMB ( -- 회원
        EMAIL ASC -- 이메일
    );

-- 회원 인덱스
CREATE INDEX IX_P1_MEMB
    ON P1_MEMB( -- 회원
        NAME ASC -- 이름
    );

ALTER TABLE P1_MEMB
    MODIFY COLUMN MNO INTEGER NOT NULL AUTO_INCREMENT COMMENT '회원번호';

-- 수강신청
ALTER TABLE P1_APPL
    ADD CONSTRAINT FK_P1_STUD_TO_P1_APPL -- 학생 -> 수강신청
        FOREIGN KEY (
            SNO -- 학생번호
        )
        REFERENCES P1_STUD ( -- 학생
            SNO -- 학생번호
        );

-- 수강신청
ALTER TABLE P1_APPL
    ADD CONSTRAINT FK_P1_OPEN_CORS_TO_P1_APPL -- 개설교육과정 -> 수강신청
        FOREIGN KEY (
            OCNO -- 개설교육과정번호
        )
        REFERENCES P1_OPEN_CORS ( -- 개설교육과정
            OCNO -- 개설교육과정번호
        );

-- 학생
ALTER TABLE P1_STUD
    ADD CONSTRAINT FK_P1_ADDR_TO_P1_STUD -- 주소 -> 학생
        FOREIGN KEY (
            ADDRNO -- 주소번호
        )
        REFERENCES P1_ADDR ( -- 주소
            ADDRNO -- 주소번호
        );

-- 학생
ALTER TABLE P1_STUD
    ADD CONSTRAINT FK_P1_MEMB_TO_P1_STUD -- 회원 -> 학생
        FOREIGN KEY (
            SNO -- 학생번호
        )
        REFERENCES P1_MEMB ( -- 회원
            MNO -- 회원번호
        );

-- 강사
ALTER TABLE P1_TCH
    ADD CONSTRAINT FK_P1_MEMB_TO_P1_TCH -- 회원 -> 강사
        FOREIGN KEY (
            MNO -- 강사번호
        )
        REFERENCES P1_MEMB ( -- 회원
            MNO -- 회원번호
        );

-- 매니저
ALTER TABLE P1_MGR
    ADD CONSTRAINT FK_P1_MEMB_TO_P1_MGR -- 회원 -> 매니저
        FOREIGN KEY (
            MGNO -- 매니저번호
        )
        REFERENCES P1_MEMB ( -- 회원
            MNO -- 회원번호
        );

-- 개설교육과정
ALTER TABLE P1_OPEN_CORS
    ADD CONSTRAINT FK_P1_CLR_ROOM_TO_P1_OPEN_CORS -- 강의실 -> 개설교육과정
        FOREIGN KEY (
            CLRNO -- 강의실번호
        )
        REFERENCES P1_CLR_ROOM ( -- 강의실
            CLRNO -- 강의실번호
        );

-- 개설교육과정
ALTER TABLE P1_OPEN_CORS
    ADD CONSTRAINT FK_P1_MGR_TO_P1_OPEN_CORS -- 매니저 -> 개설교육과정
        FOREIGN KEY (
            MGNO -- 매니저번호
        )
        REFERENCES P1_MGR ( -- 매니저
            MGNO -- 매니저번호
        );

-- 개설교육과정
ALTER TABLE P1_OPEN_CORS
    ADD CONSTRAINT FK_P1_CORS_TO_P1_OPEN_CORS -- 교육과정 -> 개설교육과정
        FOREIGN KEY (
            CRNO -- 교육과정번호
        )
        REFERENCES P1_CORS ( -- 교육과정
            CRNO -- 교육과정번호
        );

-- 프로젝트
ALTER TABLE P1_PRJ
    ADD CONSTRAINT FK_P1_OPEN_CORS_TO_P1_PRJ -- 개설교육과정 -> 프로젝트
        FOREIGN KEY (
            OCNO -- 개설교육과정번호
        )
        REFERENCES P1_OPEN_CORS ( -- 개설교육과정
            OCNO -- 개설교육과정번호
        );

-- 강의과목
ALTER TABLE P1_TCH_SUB
    ADD CONSTRAINT FK_P1_TCH_TO_P1_TCH_SUB -- 강사 -> 강의과목
        FOREIGN KEY (
            MNO -- 강사번호
        )
        REFERENCES P1_TCH ( -- 강사
            MNO -- 강사번호
        );

-- 강의과목
ALTER TABLE P1_TCH_SUB
    ADD CONSTRAINT FK_P1_SUB_TO_P1_TCH_SUB -- 과목 -> 강의과목
        FOREIGN KEY (
            SNO -- 과목번호
        )
        REFERENCES P1_SUB ( -- 과목
            SNO -- 과목번호
        );

-- 프로젝트참여자
ALTER TABLE P1_PRJ_MEMB
    ADD CONSTRAINT FK_P1_PRJ_TO_P1_PRJ_MEMB -- 프로젝트 -> 프로젝트참여자
        FOREIGN KEY (
            PNO -- 프로젝트번호
        )
        REFERENCES P1_PRJ ( -- 프로젝트
            PNO -- 프로젝트번호
        );

-- 프로젝트참여자
ALTER TABLE P1_PRJ_MEMB
    ADD CONSTRAINT FK_P1_STUD_TO_P1_PRJ_MEMB -- 학생 -> 프로젝트참여자
        FOREIGN KEY (
            SNO -- 학생번호
        )
        REFERENCES P1_STUD ( -- 학생
            SNO -- 학생번호
        );

-- 교육과정과목
ALTER TABLE P1_CORS_SUB
    ADD CONSTRAINT FK_P1_OPEN_CORS_TO_P1_CORS_SUB -- 개설교육과정 -> 교육과정과목
        FOREIGN KEY (
            OCNO -- 개설교육과정번호
        )
        REFERENCES P1_OPEN_CORS ( -- 개설교육과정
            OCNO -- 개설교육과정번호
        );

-- 교육과정과목
ALTER TABLE P1_CORS_SUB
    ADD CONSTRAINT FK_P1_SUB_TO_P1_CORS_SUB -- 과목 -> 교육과정과목
        FOREIGN KEY (
            TITL -- 과목번호
        )
        REFERENCES P1_SUB ( -- 과목
            SNO -- 과목번호
        );

-- 교육과정과목
ALTER TABLE P1_CORS_SUB
    ADD CONSTRAINT FK_P1_TCH_TO_P1_CORS_SUB -- 강사 -> 교육과정과목
        FOREIGN KEY (
            CONT -- 강사번호
        )
        REFERENCES P1_TCH ( -- 강사
            MNO -- 강사번호
        );

-- 교육과정수강생
ALTER TABLE P1_CORS_STUD
    ADD CONSTRAINT FK_P1_OPEN_CORS_TO_P1_CORS_STUD -- 개설교육과정 -> 교육과정수강생
        FOREIGN KEY (
            OCNO -- 개설교육과정번호
        )
        REFERENCES P1_OPEN_CORS ( -- 개설교육과정
            OCNO -- 개설교육과정번호
        );

-- 교육과정수강생
ALTER TABLE P1_CORS_STUD
    ADD CONSTRAINT FK_P1_STUD_TO_P1_CORS_STUD -- 학생 -> 교육과정수강생
        FOREIGN KEY (
            SNO -- 학생번호
        )
        REFERENCES P1_STUD ( -- 학생
            SNO -- 학생번호
        );

-- 강의실사진
ALTER TABLE P1_CLR_PHOTO
    ADD CONSTRAINT FK_P1_CLR_ROOM_TO_P1_CLR_PHOTO -- 강의실 -> 강의실사진
        FOREIGN KEY (
            CLRNO -- 강의실번호
        )
        REFERENCES P1_CLR_ROOM ( -- 강의실
            CLRNO -- 강의실번호
        );