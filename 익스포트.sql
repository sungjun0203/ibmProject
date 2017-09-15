--------------------------------------------------------
--  파일이 생성됨 - 금요일-9월-15-2017   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table USER_INFORMATION
--------------------------------------------------------

  CREATE TABLE "USER_INFORMATION" 
   (	"USER_EMAIL" VARCHAR2(40), 
	"USER_PASSWORD" VARCHAR2(20), 
	"USER_NAME" VARCHAR2(12), 
	"USER_PHONE" VARCHAR2(15), 
	"USER_GENDER" VARCHAR2(10), 
	"USER_AUTHORITY" VARCHAR2(15)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"
--------------------------------------------------------
--  DDL for Table NOTICE_TABLE
--------------------------------------------------------

  CREATE TABLE "NOTICE_TABLE" 
   (	"NOTICE_NUMBER" NUMBER(*,0), 
	"NOTICE_TITLE" VARCHAR2(100), 
	"NOTICE_CONTENT" VARCHAR2(2000), 
	"NOTICE_WRITER" VARCHAR2(100), 
	"NOTICE_DATE" DATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"
--------------------------------------------------------
--  DDL for Table BOARD_INFORMATION
--------------------------------------------------------

  CREATE TABLE "BOARD_INFORMATION" 
   (	"BOARD_NUMBER" NUMBER(*,0), 
	"BOARD_TITLE" VARCHAR2(50), 
	"BOARD_CONTENT" VARCHAR2(2000), 
	"BOARD_WRITER" VARCHAR2(12), 
	"BOARD_DATE" DATE, 
	"BOARD_EDITOR" VARCHAR2(12), 
	"BOARD_EDIT_DATE" DATE, 
	"BOARD_FILE_NAME" VARCHAR2(150), 
	"BOARD_FILE_PATH" VARCHAR2(150), 
	"BOARD_FILE_SIZE" NUMBER(*,0), 
	"BOARD_FILE_ORIG" VARCHAR2(150)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"
REM INSERTING into USER_INFORMATION
SET DEFINE OFF;
Insert into USER_INFORMATION (USER_EMAIL,USER_PASSWORD,USER_NAME,USER_PHONE,USER_GENDER,USER_AUTHORITY) values ('sungjun0204@naver.com','1q2w3e4r!','박성준','01035660203','male','관리자');
Insert into USER_INFORMATION (USER_EMAIL,USER_PASSWORD,USER_NAME,USER_PHONE,USER_GENDER,USER_AUTHORITY) values ('yui08@naver.com','1q2w3e4r!','이혜인','01043689422','female','일반사용자');
Insert into USER_INFORMATION (USER_EMAIL,USER_PASSWORD,USER_NAME,USER_PHONE,USER_GENDER,USER_AUTHORITY) values ('sori7034@gmail.com','1q2w3e4r!','김진소리','01071927033','female','일반사용자');
Insert into USER_INFORMATION (USER_EMAIL,USER_PASSWORD,USER_NAME,USER_PHONE,USER_GENDER,USER_AUTHORITY) values ('youcanja@naver.com','1q2w3e4r!','손진무','010','male','일반사용자');
REM INSERTING into NOTICE_TABLE
SET DEFINE OFF;
REM INSERTING into BOARD_INFORMATION
SET DEFINE OFF;
--------------------------------------------------------
--  DDL for Index PK_USER_INFORMATION
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_USER_INFORMATION" ON "USER_INFORMATION" ("USER_EMAIL") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"
--------------------------------------------------------
--  DDL for Index SYS_C007071
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C007071" ON "NOTICE_TABLE" ("NOTICE_NUMBER") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"
--------------------------------------------------------
--  DDL for Index SYS_C007078
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C007078" ON "BOARD_INFORMATION" ("BOARD_NUMBER") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"
--------------------------------------------------------
--  Constraints for Table USER_INFORMATION
--------------------------------------------------------

  ALTER TABLE "USER_INFORMATION" ADD CONSTRAINT "PK_USER_INFORMATION" PRIMARY KEY ("USER_EMAIL")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE
  ALTER TABLE "USER_INFORMATION" MODIFY ("USER_AUTHORITY" NOT NULL ENABLE)
  ALTER TABLE "USER_INFORMATION" MODIFY ("USER_GENDER" NOT NULL ENABLE)
  ALTER TABLE "USER_INFORMATION" MODIFY ("USER_PHONE" NOT NULL ENABLE)
  ALTER TABLE "USER_INFORMATION" MODIFY ("USER_NAME" NOT NULL ENABLE)
  ALTER TABLE "USER_INFORMATION" MODIFY ("USER_PASSWORD" NOT NULL ENABLE)
  ALTER TABLE "USER_INFORMATION" MODIFY ("USER_EMAIL" NOT NULL ENABLE)
--------------------------------------------------------
--  Constraints for Table NOTICE_TABLE
--------------------------------------------------------

  ALTER TABLE "NOTICE_TABLE" ADD PRIMARY KEY ("NOTICE_NUMBER")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE
--------------------------------------------------------
--  Constraints for Table BOARD_INFORMATION
--------------------------------------------------------

  ALTER TABLE "BOARD_INFORMATION" ADD PRIMARY KEY ("BOARD_NUMBER")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE
