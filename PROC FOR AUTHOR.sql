select *from OUTLINE 
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

	select @earn = @earn + ISNULL(sum(GIA),0), @unpair = @unpair + ISNULL(sum(UNPAIR),0)
	from STORY ST join DRAFT DT on ST.AUTHORID = @authorid and ST.STORYID = DT.STORYID

	select @earn = @earn + ISNULL(sum(GIA),0), @unpair = @unpair + ISNULL(sum(UNPAIR),0)
	from STORY ST join OUTLINE OL on ST.AUTHORID = @authorid and ST.STORYID = OL.STORYID

	select @earn = @earn + ISNULL(sum(GIA),0), @unpair = @unpair + ISNULL(sum(UNPAIR),0)
	from STORY ST join CHAPTER CT on ST.AUTHORID = @authorid and ST.STORYID = CT.STORYID
	select @story numstory, @chap numchap, @earn earn, (@earn - @unpair) as 'receive'
end
exec countStory 'AU7922632'
select *from STORY WHERE STORYNAME = 'Supkililentor'


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

select *from STORY
declare @image varchar(30),@i int = 0
while @i < 50
begin
	set @image = 'avatar_vio_' + CAST(FLOOR(RAND()*(20-1)+1) as varchar) + '.jpg'
	update STORY
	set AVATAR = @image
	where STORYID = ( SELECT TOP 1 STORYID FROM STORY
							ORDER BY NEWID())
	set @i = @i + 1
end

update STORY 
SET STATE = 'DONE'

declare @i int = 0
while @i < 10
begin
	update STORY
	set STATE = 'ON GOING'
	where STORYID = ( SELECT TOP 1 STORYID FROM STORY WHERE NUMOFCHAPS <> 0
							ORDER BY NEWID())
	set @i = @i + 1
end
select *from STORY

---------------------get all chapter of story-----------------
create
--alter
proc getAllChaptersofStory
	@storyid char(10)
as
begin
	if(select NUMOFCHAPS from STORY where STORYID = @storyid) = 0
	begin
		select 'STORY HAS NO CHAPTERS' ERROR
		return 0
	end
	declare @name varchar(30), @unpaid float, @editorid char(10), @paid_stt varchar(10) = 'Paid', @stt varchar(10) = 'unchecked'
	select CHAPTERNAME name, Convert(varchar, Case When UNPAIR > 0 Then 'UnPaid' Else 'Paid' End) As paid_stt, 
			Convert(varchar, Case When EDITORID is null Then 'UnChecked' Else 'Checked' End) As stt,
			CONTENT content, CHAPTERID id
			from CHAPTER where STORYID = @storyid
	
end

exec getAllChaptersofStory 'ST999614'
-----------------------get draft ---------------------------------
create
--alter
proc getDraft
	@storyid char(10)
as
begin
	if not exists(select STORYID from STORY where STORYID = @storyid)
		begin
			select 'STORY is not exists' ERROR
			return 0
		end
	select top 1 Convert(varchar, Case When UNPAIR > 0 Then 'UnPaid' Else 'Paid' End) As paid_stt, 
			Convert(varchar, Case When EDITORID is null Then 'UnChecked' Else 'Checked' End) As stt,
			CONTENT content, DRAFTID id
			from DRAFT where STORYID = @storyid
end
select *from DRAFT where DRAFTID = 'DR10970447'
exec getDraft 'ST10970447'
exec getDraft 'ST27449577'
select *from STORY 
-----------------------get outline--------------------------------
create
--alter
proc getOutline
	@storyid char(10)
as
begin
	if not exists(select STORYID from STORY where STORYID = @storyid)
		begin
			select 'STORY is not exists' ERROR
			return 0
		end
	if not exists(select STORYID from OUTLINE where STORYID = @storyid)
		begin
			select 'STORY has no outline' ERROR
			return 0
		end

	select top 1 Convert(varchar, Case When UNPAIR > 0 Then 'UnPaid' Else 'Paid' End) As paid_stt, 
			Convert(varchar, Case When EDITORID is null Then 'UnChecked' Else 'Checked' End) As stt,
			CONTENT content, OUTLINEID id
			from OUTLINE where STORYID = @storyid
end
exec getOutline 'ST10970447'
select *from OUTLINE where STORYID = 'ST35511901'
select *from STORY
-------------------create story------------------
create
--alter
proc createStory
	@authorid char(10),
	@storyid char(10),
	@storyname nchar(30),
	@content ntext
as
begin tran
	if not exists(select AUTHORID from AUTHOR where AUTHORID = @authorid)
	begin
		select 'Author is not exists' ERROR
		rollback tran
		return 0
	end
	if exists(select STORYID from STORY where STORYID = @storyid)
	begin
		select 'Story already exists' ERROR
		rollback tran
		return 0
	end
	declare @editor char(10) = (select EDITORID from AUTHOR where AUTHORID = @authorid)
	declare @image varchar(30), @storyid_draft char(10) = @storyid
	set @image = 'avatar_vio_' + CAST(FLOOR(RAND()*(20-1)+1) as varchar) + '.jpg'
	insert STORY values(@storyid, @authorid, @editor, @storyname, 'ON GOING',0,'roman',@image)
	insert DRAFT values(REPLACE(@storyid, 'ST', 'DR'), @authorid, @storyid_draft , @editor, @content, RAND()*(2000), 0)
	select 'Created story successfully' AS 'RESULT'
commit tran
return 1

select *from DRAFT where STORYID = 'ST109704367'
select *from STORY where STORYID = 'ST6974576'
--insert DRAFT values('DR100110', 'AU7922632 ', 'ST100110' , 'ED518373  ', 'xyz', 2000, 1500)
delete DRAFT
where DRAFTID = 'DR100110  '
delete STORY
where STORYID = 'ST100110'
exec createStory 'AU7922632', 'ST100110', N'Tình Đ...ịch..ịch','abcxyz'

update STORY
set AVATAR = 'avatar_vio_5.jpg'
where STORYID = 'ST100110'

select *from STORY
-------------------------update table chapter---------------------
declare @i int = 0
while @i < 30
begin
update CHAPTER
set UNPAIR = (SELECT RAND()*(2000))
where CHAPTERID = ( SELECT TOP 1 CHAPTERID FROM CHAPTER
							ORDER BY NEWID())
	set @i = @i+ 1
end

select *from AUTHOR
---------------------create chapter-------------------------
create
--alter
proc createChapter
	@authorid char(10),
	@storyid char(10),
	@chapterid char(10),
	@chaptername nchar(30),
	@content ntext
as
begin tran
	if not exists(select AUTHORID from AUTHOR where AUTHORID = @authorid)
	begin
		select 'Author is not exists' ERROR
		rollback tran
		return 0
	end
	if not exists(select STORYID from STORY where STORYID = @storyid)
	begin
		select 'Story is not exists' ERROR
		rollback tran
		return 0
	end
	if exists(select CHAPTERID from CHAPTER where CHAPTERID = @chapterid)
	begin
		select 'Chapter already exists' ERROR
		rollback tran
		return 0
	end
	if not exists(select *from OUTLINE where STORYID = @storyid)
	begin
		select 'Chapter has no outline' ERROR
		rollback tran
		return 0
	end
	declare @editor char(10) = (select EDITORID from AUTHOR where AUTHORID = @authorid)
	declare @outline char(10) = (select top 1 OUTLINEID from OUTLINE where STORYID = @storyid)
	declare @numofchap int = (select NUMOFCHAPS from STORY where STORYID = @storyid)
	declare @gia float = (RAND()*(2000))

	insert CHAPTER values(@chapterid, @editor,@outline, @storyid, @authorid,@chaptername,@gia, @content,@gia)
	update STORY
	set NUMOFCHAPS = NUMOFCHAPS + 1
	where STORYID = @storyid
	
	select 'Created chapter successfully' AS 'RESULT'
commit tran
return 1

exec createChapter 'AU7922632', 'ST346311', 'CT346311' ,'CHAP 1', 'abcxyz'
update STORY
set NUMOFCHAPS = NUMOFCHAPS - 1
where STORYID =(SELECT STORYID FROM CHAPTER WHERE CHAPTERID  = 'CT346311' )
delete CHAPTER
where CHAPTERID = 'CT346311' 
select *from STORY


select *from OUTLINE where STORYID = 'ST999614  '
select *from STORY where STORYID = 'ST346311'
select *from CHAPTER where STORYID = 'ST346311  '
---------------------------Create outline-----------------------------------------------
create
--alter
proc createOutline
	@authorid char(10),
	@storyid char(10),
	@outlineid char(10),
	@content ntext
as
begin tran
	if not exists(select AUTHORID from AUTHOR where AUTHORID = @authorid)
	begin
		select 'Author is not exists' ERROR
		rollback tran
		return 0
	end
	if not exists(select STORYID from STORY where STORYID = @storyid)
	begin
		select 'Story is not exists' ERROR
		rollback tran
		return 0
	end
	if exists(select STORYID from OUTLINE where STORYID = @storyid)
	begin
		select 'Story already has an outline' ERROR
		rollback tran
		return 0
	end
	if exists (select *from OUTLINE where OUTLINEID = @outlineid)
	begin
		select 'Outline alredy exists' ERROR
		rollback tran
		return 0
	end
	declare @editor char(10) = (select EDITORID from AUTHOR where AUTHORID = @authorid)
	declare @gia float = (RAND()*(2000))

	insert OUTLINE values(@outlineid, @authorid, @editor, @storyid, @content, @gia, @gia)
	select 'Created outline successfully' AS 'RESULT'
commit tran
return 1

exec createOutline 'AU7947660', 'ST001775', '001775' , 'abcxyz'
select *from OUTLINE
select *from AUTHOR 
select *from STORY
select *from STORY where STORYID = 'ST118376'
delete OUTLINE
where OUTLINEID = '118376  '

select *from OUTLINE where STORYID = 'ST001775'
select *from DRAFT where STORYID = 'ST5653906 '
select *from CHAPTER where STORYID = 'ST5653906 '
select *from STORY where STORYNAME = 'Rezapicistor'

-------------------------------UPDATE DRAFT-------------------
create
--alter
proc updateDraft
  @id char(10),
  @name nchar(30),
  @content ntext
as
begin tran
	if(left(@id,2) = 'DR')
	begin 
		-- check
		if not exists (select *from DRAFT where DRAFTID = @id)
		begin
			select 'Draft is not exists' ERROR
			rollback tran
			return 0
		end
		--update name
		if(@name is not null and len(@name) <> 0)
		begin
			update STORY
			set STORYNAME  = @name
			where STORYID = (select STORYID from DRAFT where DRAFTID = @id)
		end
		--update draft
		if(@content is not null )
		begin
			update DRAFT
			set CONTENT =  @content
			where DRAFTID = @id
		end
	end
	else
	begin
	--check
		if not exists (select *from OUTLINE where OUTLINEID = @id)
		begin
			select 'Outline is not exists' ERROR
			rollback tran
			return 0
		end
		---update name
		if(@name is not null and len(@name) <> 0)
		begin
			update STORY
			set STORYNAME  = @name
			where STORYID = (select STORYID from OUTLINE where OUTLINEID = @id)
		end
		--update outline
		if(@content is not null )
		begin
			update OUTLINE
			set CONTENT =  @content
			where OUTLINEID = @id
		end
	end
	select 'Update Story Successfully' RESULT
commit tran
return 1
exec updateDraft 'DR10970447', N'Công Chúa Ngủ Ban Ngày', N'update truyện Công Chúa Ngủ Ban Ngày '
select *from DRAFT where STORYID = 'ST10970447'
select *from STORY where STORYID = 'ST5653906 '
----------------Update Chapter-------------
create 
--alter
proc updateChapter
	@id char(10),
	@name nchar(30),
	@content ntext
as
begin tran
	-- check
	if not exists (select *from CHAPTER where CHAPTERID = @id)
	begin
		select 'Chapter is not exists' ERROR
		rollback tran
		return 0
	end
	--update name
	if(@name is not null and len(@name) <> 0)
	begin
		update CHAPTER
		set CHAPTERNAME  = @name
		where CHAPTERID = @id
	end
	--update draft
	if(@content is not null )
	begin
		update CHAPTER
		set CONTENT =  @content
		where CHAPTERID = @id
	end
	select 'Update Chapter Successfully' RESULT
commit tran
return 1
exec updateChapter 'CT72513578',N'Đêm Thứ 1', null
select *from CHAPTER


--------------------------update add draft------------------
select *from DRAFT where STORYID
select *from DRAFT
declare @i int = 0
while @i < 16
begin 
	declare @storyid char(10) = 
	(select top 1 STORYID from STORY where STORYID not in (select STORYID from DRAFT ))
	declare @authorid char(10) = 
	(select AUTHORID from STORY where STORYID = @storyid )
	declare @editorid char(10) = 
	(select EDITORID from AUTHOR where AUTHORID = @authorid)
	declare @draftid char(10) = REPLACE(@storyid, 'ST', 'DR')
	insert DRAFT values(@draftid,@authorid,@storyid,@editorid,
	REPLACE(CONVERT(varchar(255), NEWID()),'-', ' '),RAND()*2000,0)
	set @i = @i + 1
end
SELECT REPLACE(CONVERT(varchar(255), NEWID()),'-', ' ')
print(RAND()*2000)

--------------------------Get comment-------------------
create 
--alter 
proc getCmtChapter
	 @chapterid char(10)
as
begin
	select TOP 1 EDITORID, CONTENT from COMMENT where CHAPTERID = @chapterid
end
exec getCmtChapter 'CT23692353'
select *from COMMENT
select *from EDITOR WHERE EDITORID = 'ED478628  '
insert COMMENT values ( 'CM000256','CT23692353','ED478628','Good')
