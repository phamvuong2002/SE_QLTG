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
	select @story = COUNT(STORYID), @chap = sum(NUMOFCHAPS) from STORY where AUTHORID = @authorid	
	declare @earn float = 0, @unpair float = 0
	select @earn = @earn + sum(GIA), @unpair = @unpair + sum(UNPAIR)  from CHAPTER where AUTHORID = @authorid 
	select @earn = @earn + sum(GIA), @unpair = @unpair + sum(UNPAIR)  from DRAFT where AUTHORID = @authorid 
	select @earn = @earn + sum(GIA), @unpair = @unpair + sum(UNPAIR)  from OUTLINE where AUTHORID = @authorid 
	select @story numstory, @chap numchap, @earn earn, (@earn - @unpair) as 'receive'
end
exec countStory 'AU7947660'
-----------------------COUNT CHAPTER------------------
create 
--alter 
proc countChapter
	@authorid char(10)
as
begin
	select COUNT(CHAPTERID) NUM from CHAPTER where AUTHORID = @authorid	
end
exec countChapter 'AU7947660 '
------------------CAL EARN-----------------------
create 
--alter 
proc calEarn
	@authorid char(10)
as
begin
	declare @earn float = 0, @unpair float = 0
	select @earn = @earn + sum(GIA), @unpair = @unpair + sum(UNPAIR)  from CHAPTER where AUTHORID = @authorid
	select @earn = @earn + sum(GIA), @unpair = @unpair + sum(UNPAIR)  from DRAFT where AUTHORID = @authorid
	select @earn = @earn + sum(GIA), @unpair = @unpair + sum(UNPAIR)  from OUTLINE where AUTHORID = @authorid
	select @earn EARN
end
exec calEarn 'AU7947660 '
------------------CAL RECEIVE-----------------------
create 
--alter 
proc calReceive
	@authorid char(10)
as
begin
	declare @receive float = 0
	select @receive = @receive + sum(GIA - UNPAIR)  from CHAPTER where AUTHORID = @authorid
	select @receive = @receive + sum(GIA - UNPAIR)  from DRAFT where AUTHORID = @authorid
	select @receive = @receive + sum(GIA - UNPAIR)  from OUTLINE where AUTHORID = @authorid
	select @receive RECEIVE

	select *from CHAPTER where AUTHORID = 'AU7947660'
	select *from OUTLINE where AUTHORID = 'AU7947660'
	select *from DRAFT where AUTHORID = 'AU7947660'
end
exec calReceive 'AU7947660 '
select *from SALARYSTATUS

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

