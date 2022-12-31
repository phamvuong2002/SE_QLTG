select *from STORY
----------------COUNT STORY---------------------
create 
--alter 
proc countStory
	@authorid char(10)
as
begin
	if not exists (select AUTHORID from AUTHOR where AUTHORID = @authorid)
	begin
		SELECT 'AUTHOR NOT EXISTS' ERROR
		return 0
	end
	declare @story int = 0, @chap int = 0
	select @story = ISNULL(COUNT(STORYID),0), @chap = ISNULL(sum(NUMOFCHAPS),0) from STORY where AUTHORID = @authorid	
	declare @earn float = 0, @unpair float = 0
	select @earn = @earn + sum(GIA), @unpair = @unpair + sum(UNPAIR)  from CHAPTER where AUTHORID = @authorid 
	select @earn = @earn + sum(GIA), @unpair = @unpair + sum(UNPAIR)  from DRAFT where AUTHORID = @authorid 
	select @earn = @earn + sum(GIA), @unpair = @unpair + sum(UNPAIR)  from OUTLINE where AUTHORID = @authorid 
	select @story numstory, @chap numchap, @earn earn, (@earn - @unpair) as 'receive'
end
go
exec countStory 'AU7947660'


---------------update draft table-----
DECLARE @Counter INT 
SET @Counter=1
WHILE ( @Counter <= 100)
BEGIN
    update DRAFT 
	set GIA = (SELECT RAND()*(2000-50)+50)
	where DRAFTID = (SELECT TOP 1 DRAFTID FROM DRAFT
							ORDER BY NEWID())
    SET @Counter  = @Counter  + 1
END

ALTER TABLE DRAFT
    ADD CONSTRAINT CHECK_UNPAIR CHECK ( GIA >= UNPAIR)
alter table DRAFT
add UNPAIR float

DECLARE @Counter INT 
SET @Counter=1
WHILE ( @Counter <= 100)
BEGIN
    update DRAFT 
	set UNPAIR = (SELECT RAND()*(1900-50)+50)
	where DRAFTID = (SELECT TOP 1 DRAFTID FROM DRAFT
							ORDER BY NEWID())
    SET @Counter  = @Counter  + 1
END

update DRAFT 
set UNPAIR = 88.11
where DRAFTID = 'DR45977627'
select *from DRAFT
-------------------update outline----------------
ALTER TABLE OUTLINE
    ADD CONSTRAINT CHECK_OUTLINEUNPAIR CHECK ( GIA >= UNPAIR)


alter table OUTLINE
add UNPAIR float

DECLARE @Counter INT 
SET @Counter=1
WHILE ( @Counter <= 100)
BEGIN
    update OUTLINE 
	set UNPAIR = (SELECT RAND()*(2000-50)+50)
	where OUTLINEID = (SELECT TOP 1 OUTLINEID FROM OUTLINE
							ORDER BY NEWID())
    SET @Counter  = @Counter  + 1
END

select *from OUTLINE
-------------------------update chapter-------------------------
alter table CHAPTER
add UNPAIR float

ALTER TABLE CHAPTER
    ADD CONSTRAINT CHECK_ChapterUNPAIR CHECK ( GIA >= UNPAIR)

DECLARE @Counter INT 
SET @Counter=1
WHILE ( @Counter <= 100)
BEGIN
    update CHAPTER 
	set UNPAIR = (SELECT RAND()*(2000-50)+50)
	where CHAPTERID = (SELECT TOP 1 CHAPTERID FROM CHAPTER
							ORDER BY NEWID())
    SET @Counter  = @Counter  + 1
END

update CHAPTER
set UNPAIR = 57.17
where CHAPTERID = 'CH13jgy42 '

select *from STORY
----------------------update story------------------------



select *from CHAPTER where STORYID = 'ST966654  '


DECLARE @Counter INT 
SET @Counter=1
WHILE ( @Counter <= 40)
BEGIN
    declare @num int = 0, @storyid char(10) =(SELECT TOP 1 STORYID FROM CHAPTER
							ORDER BY NEWID())
		select @num = count (CHAPTERID)
		FROM
			STORY ST
		INNER JOIN
			CHAPTER CT
		ON 
			ST.STORYID = CT.STORYID and ST.STORYID = @storyid;
		update STORY
		set NUMOFCHAPS = @num
		where STORYID = @storyid
END

-----------------------------storydatalist-------------------
create 
--alter
proc storydatalist
	@authorid char(10)
as
begin
	if not exists (select STORYID from STORY where AUTHORID = @authorid)
	begin
		SELECT 'AUTHOR HAS NO STORY ' ERROR
		return 0
	end

	select STORYID storyid, STORYNAME name, AVATAR avt,
	STATE process, NUMOFCHAPS approve from STORY
	where AUTHORID = @authorid
	
end

select *from DRAFT where STORYID = 'ST001775  '
select *from STORY where AUTHORID = 'AU7922632 '
exec storydatalist 'AU7922632  '


---------------------------Cal Pair Unpair Story-------------------------
create 
--alter
proc calPairUnpairStory
	@storyid char(10)
as
begin
	declare @gia float = 0, @unpair float = 0
	select @gia = @gia + ISNULL(SUM(GIA), 0 ), @unpair = @unpair + ISNULL(SUM(UNPAIR), 0 ) from CHAPTER where STORYID = @storyid
	select @gia = @gia + ISNULL(SUM(GIA), 0 ), @unpair = @unpair + ISNULL(SUM(UNPAIR), 0 ) from OUTLINE where STORYID = @storyid
	select @gia = @gia + ISNULL(SUM(GIA), 0 ), @unpair = @unpair + ISNULL(SUM(UNPAIR), 0 ) from DRAFT where STORYID = @storyid
	select @unpair unpaid, (@gia - @unpair) paid
end

exec calPairUnpairStory 'ST999614  '
select *from DRAFT WHERE STORYID = 'ST999614  '
select *from OUTLINE WHERE STORYID = 'ST999614  '
select *from CHAPTER WHERE STORYID = 'ST999614  '