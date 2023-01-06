----------------LOGIN --------------
create 
--alter 
proc loginFunction
	@username varchar(30),
	@password varchar(30)
as
begin
	declare @name_login nchar(30), @id char(30)
	------------------------Login by ID------------------------
	if(left(@username,2) = 'AU')
	begin
		select @name_login = AUTHORNAME, @id = AUTHORID from AUTHOR where AUTHORID = @username and PASSWORD = @password
	end
	if(left(@username,2) = 'AD')
	begin
		select @name_login = ADMINNAME, @id = ADMINID from ADMIN where ADMINID = @username and PASSWORD = @password
	end
	if(left(@username,2) = 'ED')
	begin
		select @name_login = EDITORNAME, @id = EDITORID from EDITOR where EDITORID = @username and PASSWORD = @password
	end
	---------------------Login by username ---------------------------
	select @name_login = AUTHORNAME, @id = AUTHORID from AUTHOR where USERNAME = @username and PASSWORD = @password
	if(@id is not null and @name_login is not null)
	begin
		select @id id_login, @name_login name_login
		return 0
	end
	select @name_login = EDITORNAME, @id = EDITORID from EDITOR where USERNAME = @username and PASSWORD = @password
	if(@id is not null and @name_login is not null)
	begin
		select @id id_login, @name_login name_login
		return 0
	end
	select @name_login = ADMINNAME, @id = ADMINID from ADMIN where USERNAME = @username and PASSWORD = @password
	if(@id is not null and @name_login is not null)
	begin
		select @id id_login, @name_login name_login
		return 0
	end
	--------------------------Login failed--------------
	if(@id is null or @name_login is null)
	begin
		select 'USERNAME OR PASSWORD IS INCORRECT' ERROR
		return 0
	end
	----------------------------login successfully------------
	select @id id_login, @name_login name_login
	return 0
end

exec loginFunction 'Herman126', '95MRV12O1'
select *from AUTHOR