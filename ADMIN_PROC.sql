USE QLTG
GO

----------------------------1----------------------------
DROP PROC IF EXISTS USP_getAdminOverview
GO

CREATE 
--ALTER 
PROC USP_getAdminOverview
	@adminid CHAR(10)
AS
BEGIN
	DECLARE @LIST TABLE (ID CHAR(15))
	INSERT @LIST SELECT AUTHORID FROM AUTHOR WHERE ADMINID = @adminid
	SELECT (SELECT COUNT(*) FROM @LIST) AS 'SLTG', (SELECT COUNT(*) FROM EDITOR  WHERE ADMINID = @adminid) AS 'SLBT',
		(SELECT COUNT(*) FROM STORY WHERE AUTHORID IN (SELECT * FROM @LIST) AND STATE = 'ON GOING') AS 'ONPROGRESS', 
		(SELECT COUNT(*) FROM STORY WHERE AUTHORID IN (SELECT * FROM @LIST) AND STATE = 'DONE') AS 'DONE'
END
GO

--EXEC USP_getAdminOverview @adminid = 'AD342720  '
select *from ADMIN where ADMINID = 'AD342720'
--SELECT * FROM AUTHOR WHERE ADMINID = 'AD808006    '
--SELECT * FROM STORY WHERE AUTHORID = 'AU0886539 '
--SELECT * FROM STORY WHERE AUTHORID = 'AU2024405 ' 
--SELECT * FROM STORY WHERE AUTHORID = 'AU2563038 '
--SELECT * FROM STORY WHERE AUTHORID = 'AU2671764 '
--SELECT * FROM STORY WHERE AUTHORID = 'AU4101314 '
select *from STORY where STORYNAME = 'Adnipedgan'
select *from CHAPTER where STORYID = 'ST711850  '

----------------------------2----------------------------
DROP PROC IF EXISTS USP_getAllAccounts 
GO

CREATE 
--ALTER 
PROC USP_getAllAccounts
	@adminid CHAR(10)
AS
BEGIN
	IF NOT EXISTS (SELECT AUTHORID FROM AUTHOR  WHERE ADMINID = @adminid)
	AND NOT EXISTS (SELECT EDITORID FROM EDITOR  WHERE ADMINID = @adminid)
		BEGIN
			SELECT 'ADMIN HAS NO AUTHOR, ADMIN' ERROR
			RETURN 0
		END
	DECLARE @LIST TABLE(ID CHAR(15), NAME CHAR(50), AVATAR VARCHAR(50), TYPE CHAR(10))
	INSERT @LIST SELECT AUTHORID, AUTHORNAME, AVATAR, 'AUTHOR' AS 'TYPE' FROM AUTHOR  WHERE ADMINID = @adminid
	INSERT @LIST SELECT EDITORID, EDITORNAME, AVATAR, 'EDITOR' AS 'TYPE' FROM EDITOR	WHERE ADMINID = @adminid
	SELECT * FROM @LIST
END
GO

--EXEC USP_getAllAccounts @adminid = 'AD342720  '

----------------------------3----------------------------
DROP PROC IF EXISTS USP_getAllAuthors 
GO

CREATE 
--ALTER 
PROC USP_getAllAuthors
	@adminid CHAR(10)
AS
BEGIN 
	IF NOT EXISTS (SELECT AUTHORID FROM AUTHOR  WHERE ADMINID = @adminid)
	AND NOT EXISTS (SELECT EDITORID FROM EDITOR  WHERE ADMINID = @adminid)
		BEGIN
			SELECT 'ADMIN HAS NO AUTHOR' ERROR
			RETURN 0
		END

	DECLARE @AUTHORS TABLE (AUTHORID CHAR(10), AUTHORNAME NCHAR(50), PENNAME CHAR(20), AVATAR CHAR(50), SLT INT, SLC INT)
	INSERT @AUTHORS SELECT AU.AUTHORID, AU.AUTHORNAME, AU.USERNAME AS 'PENNAME', AVATAR, (SELECT COUNT(*) FROM STORY WHERE AUTHORID = AU.AUTHORID) AS 'SLT', (SELECT SUM(NUMOFCHAPS) FROM STORY WHERE AUTHORID = AU.AUTHORID) AS 'SLC'
					FROM AUTHOR AU WHERE AU.ADMINID = @adminid
	UPDATE @AUTHORS
	SET SLC = 0 WHERE SLC IS NULL
	SELECT * FROM @AUTHORS	
END 
GO

--SELECT * FROM AUTHOR WHERE AUTHORID IN (SELECT AUTHORID FROM @T) 
--EXEC USP_getAllAuthors @adminid = 'AD342720'
--SELECT * FROM EDITOR WHERE ADMINID = 'AD342720' 
--select * from story where EDITORID = 'ED779066' or EDITORID = 'ED949502'

----------------------------4----------------------------
DROP PROC IF EXISTS USP_getAllEditors
GO

CREATE 
--ALTER 
PROC USP_getAllEditors
	@adminid CHAR(10)
AS
BEGIN 
	IF NOT EXISTS (SELECT EDITORID FROM EDITOR  WHERE ADMINID = @adminid)
		BEGIN
			SELECT 'ADMIN HAS NO EDITOR' ERROR
			RETURN 0
		END

	SELECT E.EDITORID, E.EDITORNAME, E.USERNAME AS 'PENNAME', AVATAR, (SELECT COUNT(*) FROM AUTHOR AU WHERE EDITORID = E.EDITORID) AS 'SLTG', (SELECT COUNT(*) FROM STORY WHERE EDITORID = E.EDITORID) AS 'SLT'
	FROM EDITOR E WHERE E.ADMINID = @adminid
	--GROUP BY E.EDITORID, E.EDITORNAME
END 
GO

--EXEC USP_getAllEditors @adminid = 'AD342720    '
--SELECT COUNT(*) FROM STORY WHERE EDITORID = 'ED785700      '
--SELECT COUNT(*) FROM AUTHOR WHERE EDITORID = 'ED785700      '

----------------------------5----------------------------
DROP PROC IF EXISTS USP_getAllStories
GO

CREATE 
--ALTER 
PROC USP_getAllStories
	@adminid CHAR(10)
AS
BEGIN
	IF NOT EXISTS (SELECT AUTHORID FROM AUTHOR  WHERE ADMINID = @adminid)
		BEGIN
			SELECT 'ADMIN HAS NO AUTHOR' ERROR
			RETURN 0
		END

	DECLARE @LIST TABLE(ID CHAR(15))
	INSERT @LIST SELECT AUTHORID FROM AUTHOR  WHERE ADMINID = @adminid

	IF NOT EXISTS (SELECT S.STORYID	FROM STORY S WHERE S.AUTHORID IN (SELECT * FROM @LIST))
		BEGIN
			SELECT 'AUTHORS HAS NO STORY ' ERROR
			RETURN 0
		END

	SELECT S.STORYID, S.STORYNAME, S.NUMOFCHAPS, S.AVATAR, 'Chapters' AS 'PROCESS', (SELECT AUTHORNAME FROM AUTHOR WHERE AUTHORID = S.AUTHORID) AS 'AUTHORNAME'
	FROM STORY S WHERE S.AUTHORID IN (SELECT * FROM @LIST)
END 
GO

--EXEC USP_getAllStories @adminid = 'AD342720  '
--SELECT * FROM STORY WHERE STORYID NOT IN (SELECT STORYID FROM CHAPTER)
--SELECT * FROM STORY WHERE STORYID NOT IN (SELECT STORYID FROM OUTLINE)
--SELECT * FROM STORY WHERE STORYID NOT IN (SELECT STORYID FROM DRAFT)

INSERT DRAFT ([DRAFTID], [AUTHORID], [STORYID], [EDITORID], [CONTENT], [GIA], [UNPAIR]) VALUES ('DR07823424', 'AU0886539', 'ST188007', 'ED524729', 'AAAAAAAAAAA',  23.02, 22.06)

SELECT * FROM STORY WHERE STORYNAME = 'Cipjubackex'
SELECT * FROM DRAFT WHERE STORYID = 'ST188007  '
SELECT * FROM STORY WHERE STORYID NOT IN (SELECT DISTINCT STORYID FROM DRAFT)
----------------------------6----------------------------
DROP PROC IF EXISTS USP_createAdmin
GO

CREATE 
--ALTER 
PROC USP_createAdmin
	@adminid CHAR(10),
	@username CHAR(20),
	@password CHAR(15)
AS
BEGIN 
	IF EXISTS (SELECT ADMINID FROM ADMIN WHERE TRIM(ADMINID) = TRIM(@adminid))
		BEGIN
			SELECT 'ID IS EXISTED' AS 'ERROR'
			ROLLBACK TRAN
			RETURN 0
		END

	INSERT ADMIN (ADMINID, PASSWORD, USERNAME, AVATAR) 
	VALUES (@adminid, @password, @username, 'empty.png')
	SELECT 'ADDING ADMIN SUCCESSFULLY' AS '1'
END
GO
select *from ADMIN
select *from EDITOR
----------------------------7----------------------------
DROP PROC IF EXISTS USP_createAuthor
GO

CREATE 
--ALTER 
PROC USP_createAuthor
	@authorid CHAR(10),
	@adminid CHAR(10),
	@username CHAR(20),
	@password CHAR(15),
	@authorname nchar(50),
	@email char(30),
	@phonenumber char(15)
AS
BEGIN Tran
	if not exists( select ADMINID from ADMIN where ADMINID = @adminid )
	BEGIN
		SELECT 'ADMIN IS NOT EXISTED' AS 'ERROR'
		ROLLBACK TRAN
		RETURN 0
	END
	if exists (select *from AUTHOR where USERNAME = @username)
	BEGIN
		SELECT 'Username already exists' AS 'ERROR'
		ROLLBACK TRAN
		RETURN 0
	END
	IF EXISTS (SELECT AUTHORID FROM AUTHOR WHERE TRIM(AUTHORID) = TRIM(@authorid))
	BEGIN
		SELECT 'AUTHORID IS EXISTED' AS 'ERROR'
		ROLLBACK TRAN
		RETURN 0
	END
	declare @editorid char(10) = (SELECT TOP 1 EDITORID FROM EDITOR  ORDER BY NEWID())
	declare @image varchar(50) = ('avatar_vio_' + Cast(FLOOR(RAND()*(20 - 1) + 1) as varchar) + '.jpg')
	
	INSERT AUTHOR VALUES (@authorid, @adminid, @editorid, @password, @authorname, @email,
	'address', @phonenumber, @username, 0, @image)
	SELECT 'ADDING AUTHOR SUCCESSFULLY' AS 'RESULT'
COMMIT TRAN
GO
exec USP_createAuthor 'AU20022002','AD808006','vuong1001','123456789',N'Phạm Vương',
'pvuong@gmail.com','0948908485'
select *from AUTHOR where AUTHORID = 'AU20022002'
delete AUTHOR where AUTHORID = 'AU20022002'
select *from ADMIN
----------------------------8----------------------------
DROP PROC IF EXISTS USP_createEditor
GO

CREATE 
--ALTER 
PROC USP_createEditor
	@editorid CHAR(10),
	@adminid CHAR(10),
	@username CHAR(20),
	@password CHAR(15),
	@editorname nchar(50),
	@email char(30),
	@phonenumber char(15)
AS
BEGIN TRAN
	if not exists( select ADMINID from ADMIN where ADMINID = @adminid )
		BEGIN
			SELECT 'ADMIN IS NOT EXISTED' AS 'ERROR'
			ROLLBACK TRAN
			RETURN 0
		END
	if exists (select *from EDITOR where USERNAME = @username)
	BEGIN
		SELECT 'Username already exists' AS 'ERROR'
		ROLLBACK TRAN
		RETURN 0
	END
	IF EXISTS (SELECT EDITORID FROM EDITOR WHERE TRIM(EDITORID) = TRIM(@editorid))
		BEGIN
			SELECT 'EDITORID IS EXISTED' AS 'ERROR'
			ROLLBACK TRAN
			RETURN 0
		END
	declare @image varchar(50) = ('avatar_vio_' + Cast(FLOOR(RAND()*(20 - 1) + 1) as varchar) + '.jpg')

	INSERT EDITOR VALUES (@editorid, @adminid, @editorname, @email,
	 @phonenumber, @username, 0, @password, @image)
	SELECT 'ADDING EDITOR SUCCESSFULLY' AS 'RESULT'
COMMIT TRAN
select *from EDITOR
exec USP_createEditor 'ED2000001','AD936223','luong123', '123456789', N'Lương Hán', 
					'lh@gmail.com','093748463'
delete EDITOR
where EDITORID = 'ED2000001'

----------------------------9----------------------------
DROP PROC IF EXISTS USP_getAuthorFromEditor 
GO

CREATE 
--ALTER 
PROC USP_getAuthorFromEditor
	@editorid CHAR(10)
AS
BEGIN
	IF NOT EXISTS (SELECT AUTHORID FROM AUTHOR WHERE EDITORID = @editorid)
		BEGIN
			SELECT 'EDITOR HAS NO AUTHOR' AS 'ERROR'
			RETURN 0
		END

	DECLARE @AUTHORS TABLE (AUTHORID CHAR(10), AUTHORNAME NCHAR(50), PENNAME CHAR(20), AVATAR CHAR(50), SLT INT, SLC INT)
	INSERT @AUTHORS SELECT AU.AUTHORID, AU.AUTHORNAME, AU.USERNAME AS 'PENNAME', AVATAR, (SELECT COUNT(*) FROM STORY WHERE AUTHORID = AU.AUTHORID) AS 'SLT', 
					(SELECT SUM(NUMOFCHAPS) FROM STORY WHERE AUTHORID = AU.AUTHORID) AS 'SLC'
					FROM AUTHOR AU WHERE AU.EDITORID = @editorid
	UPDATE @AUTHORS
	SET SLC = 0 WHERE SLC IS NULL
	SELECT * FROM @AUTHORS	
END
GO

--EXEC USP_getAllEditors @adminid = 'AD342720'
--EXEC USP_getAuthorFromEditor @editorid = 'ED949502'

----------------------------10----------------------------
DROP PROC IF EXISTS USP_calPaidUnpaidStory
GO

create 
--alter
proc USP_calPaidUnpaidStory
	@storyid char(10)
as
begin
	declare @gia float = 0, @unpair float = 0
	select @gia = @gia + ISNULL(SUM(GIA), 0 ), @unpair = @unpair + ISNULL(SUM(UNPAIR), 0 ) from CHAPTER where STORYID = @storyid
	select @gia = @gia + ISNULL(SUM(GIA), 0 ), @unpair = @unpair + ISNULL(SUM(UNPAIR), 0 ) from OUTLINE where STORYID = @storyid
	select @gia = @gia + ISNULL(SUM(GIA), 0 ), @unpair = @unpair + ISNULL(SUM(UNPAIR), 0 ) from DRAFT where STORYID = @storyid
	select @unpair unpaid, (@gia - @unpair) paid
end
go

--EXEC USP_getAuthorFromEditor @editorid = 'ED779066  '
--EXEC countStory 'AU6873987      '
--EXEC storydatalist 'AU0886539  '
--EXEC USP_calPaidUnpaidStory 'ST188007    '

----------------------------11----------------------------
DROP PROC IF EXISTS USP_storyDataList
GO

create 
--alter
proc USP_storyDataList
	@authorid char(10)
as
begin
	if not exists (select STORYID from STORY where AUTHORID = @authorid)
	begin
		SELECT 'AUTHOR HAS NO STORY ' ERROR
		return 0
	end

	select STORYID storyid, STORYNAME name, AVATAR avt, NUMOFCHAPS numofchaps,
	STATE process, NUMOFCHAPS approve from STORY
	where AUTHORID = @authorid
end
go

----------------------------12----------------------------


CREATE
--alter
proc getAllChaptersofStory
	@storyid char(10)
as
begin
	if(select NUMOFCHAPS from STORY where STORYID = @storyid) = 0
	begin
		select 'STORY HAS NO CHAPTERS' as ERROR
		return 0
	end
	declare @name varchar(30), 
	@paid_stt varchar(10) = 'Paid', 
	@stt varchar(10) = 'unchecked'
	select CHAPTERNAME as name, CONTENT as content,
			Convert(varchar, Case When UNPAIR > 0 Then 'UnPaid' Else 'Paid' End) As paid_stt, 
			Convert(varchar, Case When UNPAIR = -1 Then 'UnChecked' Else 'Checked' End) As stt 
	from CHAPTER 
	where STORYID = @storyid
	
end
GO

exec getAllChaptersofStory 'ST497513'


