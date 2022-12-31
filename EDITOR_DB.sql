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
	
	select distinct AUTHORNAME, count(STORYID) as NUMOFSTORYs, sum(NUMOFCHAPS)
	from STORY S join AUTHOR A ON S.AUTHORID = A.AUTHORID
	where A.EDITORID = @editorid
	group by AUTHORNAME

end
go
exec selectAuthorList 'ED841430  '





