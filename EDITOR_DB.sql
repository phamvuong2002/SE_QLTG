------------------------- OVERVIEW'S EDITOR ---------------
create 
--alter 
proc editorcountStory
	@editorid char(10)
as
begin
	if not exists (select EDITORID from EDITOR where EDITORID = @editorid)
	begin
		SELECT 'EDITOR NOT EXISTS' AS ERROR
		return 0
	end

	declare @story int = 0, @chap int = 0

	select @story = ISNULL(COUNT(STORYID),0), 
			@chap = ISNULL(sum(NUMOFCHAPS),0) 
	from STORY 
	where EDITORID = @editorid	

	declare @earn float = 0, @unpair float = 0

	select @earn = @earn + sum(GIA), @unpair = @unpair + sum(UNPAIR)  
	from CHAPTER 
	where EDITORID = @editorid

	select @earn = @earn + sum(GIA),@unpair = @unpair + sum(UNPAIR)  
	from DRAFT
	where EDITORID = @editorid
	
	select @earn = @earn + sum(GIA), @unpair = @unpair + sum(UNPAIR) 
	from OUTLINE 
	where EDITORID = @editorid
	
	select @story AS numstory, 
			@chap AS numchap, 
			@earn AS earn, 
			(@earn - @unpair) as 'receive'
end
GO
exec editorcountStory 'ED841430  '


---------------------- OVERVIEW AUTHOR TAB ----------
create 
--alter
proc selectAuthorList
	@editorid char(10)
as
begin
	if not exists (select EDITORID from EDITOR where EDITORID = @editorid)
	begin
		SELECT 'EDITOR NOT EXISTS' AS ERROR
		return 0
	end
	
	select AUTHORNAME as name, 
			A.AUTHORID as authorid, 
			A.AVATAR as avt,
			count(S.STORYID) as story, --SL STORY
			sum(S.NUMOFCHAPS) as chapter --SL CHAPTER
	from AUTHOR A  join STORY S ON S.AUTHORID = A.AUTHORID
	where A.EDITORID = @editorid
	group by AUTHORNAME, A.AUTHORID,A.AVATAR

end
go
exec selectAuthorList 'ED841430  '
select *from EDITOR where EDITORID  = 'ED841430'
------- OVERVIEW STORY DATA LIST (find by AUTHORID) IN AUTHOR TAB -------------------
create 
--alter
proc author_storydatalist
	@authorid char(10)
as
begin
	if not exists (select STORYID from STORY where AUTHORID = @authorid)
	begin
		SELECT 'AUTHOR HAS NO STORY! ' AS ERROR
		return 0
	end

	select STORYID AS storyid, 
			STORYNAME AS name, 
			AVATAR AS avt,
			STATE AS process, 
			NUMOFCHAPS AS approve 
	from STORY
	where AUTHORID = @authorid
	
end
GO
exec author_storydatalist 'AU3639829'
select *from AUTHOR 

------- OVERVIEW STORY DATA LIST (find by Editor ID) IN STORY TAB -------------------
create 
--alter
proc editor_storydatalist
	@editorid char(10)
as
begin
	if not exists (select STORYID from STORY where EDITORID = @editorid)
	begin
		SELECT 'EDITOR NOT MANAGE THIS STORY! ' AS ERROR
		return 0
	end

	select STORYID AS storyid, 
			STORYNAME AS name, 
			S.AVATAR AS avt,
			STATE AS process, 
			NUMOFCHAPS AS approve, 
			AUTHORNAME as authorname,
			A.AUTHORID as authorid
	from STORY S join AUTHOR A on A.AUTHORID = S.AUTHORID
	where S.EDITORID = @editorid
	
end
GO

exec editor_storydatalist 'ED841430  '
select * from CHAPTER
-------------------- DETAIL STORY (SHOW CHAPTER)-----------
CREATE
--alter
proc editor_getAllChaptersofStory
	@storyid char(10)
as
begin
	if (select NUMOFCHAPS from STORY where STORYID = @storyid) = 0
	begin
		select 'STORY HAS NO CHAPTERS' as ERROR
		return 0
	end
	declare @name varchar(30), 
	@paid_stt varchar(10) = 'Paid', 
	@stt varchar(10) = 'unchecked'
	select CHAPTERID AS chapterid ,CHAPTERNAME as name, CONTENT as content, 
			Convert(varchar, Case When UNPAIR > 0 Then 'UnPaid' Else 'Paid' End) As paid_stt, 
			Convert(varchar, Case When UNPAIR = -1 Then 'UnChecked' Else 'Checked' End) As stt 
	from CHAPTER
	where STORYID = @storyid
	
end
GO
exec editor_getAllChaptersofStory 'ST690542  '
select * from COMMENT
select * from CHAPTER
select *from EDITOR
---------------------------GET ALL COMMENT------------
CREATE
--alter
proc showComment
	@chapterid char(10)
as
begin
	if NOT EXISTS (select * from COMMENT where CHAPTERID = @chapterid)
	begin
		select 'STORY HAS NO CHAPTERS' as ERROR
		return 0
	end
	
	select CONTENT as cmt
	from COMMENT
	where CHAPTERID = @chapterid
	
end
GO
exec showComment 'CH00mcu55'
--CH00mcu55 
--CH59hfs76 
--CH72qwt70 

---------------------------Cal Pair Unpair Story-------------------------
create 
--alter
proc calPairUnpairStory
	@storyid char(10)
as
begin
	declare @gia float = 0, @unpair float = 0

	select @gia = @gia + ISNULL(SUM(GIA), 0 ), 
			@unpair = @unpair + ISNULL(SUM(UNPAIR), 0 ) 
	from CHAPTER 
	where STORYID = @storyid

	select @gia = @gia + ISNULL(SUM(GIA), 0 ), 
			@unpair = @unpair + ISNULL(SUM(UNPAIR), 0 ) 
	from OUTLINE 
	where STORYID = @storyid

	select @gia = @gia + ISNULL(SUM(GIA), 0 ), 
			@unpair = @unpair + ISNULL(SUM(UNPAIR), 0 ) 
	from DRAFT 
	where STORYID = @storyid

	select @unpair AS unpaid, (@gia - @unpair) AS paid
end
GO
SELECT * FROM CHAPTER WHERE STORYID = 'ST690542  '
SELECT * FROM DRAFT WHERE STORYID = 'ST811858  '
SELECT * FROM OUTLINE WHERE STORYID = 'ST811858  '
select * from story where STORYID = 'ST811858  '
exec calPairUnpairStory 'ST711850  '

----------------ADD COMMENT------------

create
--alter
proc addComment
	@cmtid char(10),
	@chapterid char(10),
	@editorid char(10),
	@content ntext
as
begin
	if not exists (select * from COMMENT where COMMENTID = @cmtid)
	begin
		select 'COMMENT HAS ALREADY EXISTS' AS ERROR
		return 0
	end
	
	if not exists (select * from CHAPTER where CHAPTERID = @chapterid)
	begin
		select 'CHAPTER NOT EXISTS' AS ERROR
		return 0
	end

	if exists (select * from COMMENT where CHAPTERID = @chapterid)
	begin
		update COMMENT SET CONTENT = @content WHERE CHAPTERID = @chapterid
		select 'Created CMT successfully' AS 'RESULT'
		--SELECT * FROM COMMENT WHERE CHAPTERID = @chapterid
		return 0
	end

	if not exists(select * from EDITOR where EDITORID = @editorid)
	begin
		select 'EDITOR NOT EXISTS' AS ERROR
		return 0
	end
	
	INSERT COMMENT VALUES(@cmtid ,@chapterid ,@editorid ,@content )
	select 'Created CMT successfully' AS 'RESULT'
end
go
EXEC addComment 'CCCCC', 'CCCCC', 'CCCCC', 'CCCCCCCCCCC'
select * from COMMENT WHERE CONTENT like 'aaa'

DELETE COMMENT WHERE CONTENT like 'aaa'
select * from chapter
select *from AUTHOR where EDITORID = 'ED536554'
select *from CHAPTER where EDITORID = 'ED295770  '
-----------APPROVE BUTTON (to update paid/unpaid)---------
create 
--alter
proc updateUnpaidPaid
	@chapterid char(10)
as
begin

	update CHAPTER set UNPAIR = 0 where @chapterid = CHAPTERID
	SELECT * FROM CHAPTER WHERE @chapterid = CHAPTERID
	
end
GO
EXEC updateUnpaidPaid 'CH00mcu55'
--CH00mcu55 
--CH59hfs76 
--CH72qwt70 

update CHAPTER set UNPAIR = 865.77637338836 where CHAPTERID = 'CH00mcu55 '


select * from EDITOR





