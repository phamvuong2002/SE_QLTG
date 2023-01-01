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
	select @story = ISNULL(COUNT(STORYID),0), @chap = ISNULL(sum(NUMOFCHAPS),0) from STORY where EDITORID = @editorid	
	declare @earn float = 0, @unpair float = 0
	select @earn = @earn + sum(GIA), @unpair = @unpair + sum(UNPAIR)  from CHAPTER where EDITORID = @editorid
	select @earn = @earn + sum(GIA), @unpair = @unpair + sum(UNPAIR)  from DRAFT where EDITORID = @editorid
	select @earn = @earn + sum(GIA), @unpair = @unpair + sum(UNPAIR)  from OUTLINE where EDITORID = @editorid
	select @story AS numstory, @chap AS numchap, @earn AS earn, (@earn - @unpair) as 'receive'
end
GO
exec editorcountStory 'ED841430  '



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
	
	select distinct AUTHORNAME as name, A.AVATAR as avt,count(STORYID) as story, sum(NUMOFCHAPS) as chapter
	from STORY S join AUTHOR A ON S.AUTHORID = A.AUTHORID
	where A.EDITORID = @editorid
	group by AUTHORNAME, A.AVATAR

end
go
exec selectAuthorList 'ED841430  '


select * from STORY
-----------------------------storydatalist-------------------
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

	select STORYID AS storyid, STORYNAME AS name, AVATAR AS avt,
	STATE AS process, NUMOFCHAPS AS approve from STORY
	where EDITORID = @editorid
	
end
GO

exec editor_storydatalist 'ED841430  '


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
	select @unpair AS unpaid, (@gia - @unpair) AS paid
end
GO
SELECT * FROM CHAPTER WHERE STORYID = 'ST690542  '
SELECT * FROM DRAFT WHERE STORYID = 'ST811858  '
SELECT * FROM OUTLINE WHERE STORYID = 'ST811858  '
select * from story where STORYID = 'ST811858  '
exec calPairUnpairStory 'ST044251  '


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
	select CHAPTERNAME name, 
			Convert(varchar, Case When UNPAIR > 0 Then 'UnPaid' Else 'Paid' End) As paid_stt, 
			Convert(varchar, Case When EDITORID is null Then 'UnChecked' Else 'Checked' End) As stt 
	from CHAPTER 
	where STORYID = @storyid
	
end
GO
exec getAllChaptersofStory 'ST690542  '


