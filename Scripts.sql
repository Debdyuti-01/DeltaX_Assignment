USE [musicPlayer]
GO
/****** Object:  Table [dbo].[Album]    Script Date: 02-04-2020 20:51:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Album](
	[AlbumID] [int] IDENTITY(1,1) NOT NULL,
	[SongName] [varchar](200) NOT NULL,
	[DateOfRelease] [date] NOT NULL,
	[CoverImage] [varchar](500) NOT NULL,
 CONSTRAINT [PK_Album] PRIMARY KEY CLUSTERED 
(
	[AlbumID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MusicArist]    Script Date: 02-04-2020 20:51:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MusicArist](
	[MusicID] [int] IDENTITY(1,1) NOT NULL,
	[Artistname] [varchar](100) NOT NULL,
	[SongName] [varchar](200) NOT NULL,
	[MusingFileName] [varchar](500) NOT NULL,
	[Bio] [varchar](100) NOT NULL,
	[DateOfBirth] [date] NOT NULL,
 CONSTRAINT [PK_MusicArtist] PRIMARY KEY CLUSTERED 
(
	[MusicID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[MusicAristFolder_Delete]    Script Date: 02-04-2020 20:51:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
create procedure [dbo].[MusicAristFolder_Delete]
(
@MusicID varchar(20)=''
)
as
begin
delete from MusicArist where MusicID=@MusicID
end
GO
/****** Object:  StoredProcedure [dbo].[USP_Album_Select]    Script Date: 02-04-2020 20:51:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
create PROCEDURE [dbo].[USP_Album_Select]
(
@SongName varchar(100)=''
)
as
BEGIN
select AlbumID , SongName,CoverImage from Album
where
SongName like @SongName +'%'
order by SongName
END
GO
/****** Object:  StoredProcedure [dbo].[USP_AlbumFolder_Insert]    Script Date: 02-04-2020 20:51:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
create procedure [dbo].[USP_AlbumFolder_Insert]
(
@SongName varchar(200)='',
@DateOfRelease date='',
@CoverImage varchar(500)=''
)
as
begin
if not exists (select * from Album where SongName=@SongName)
begin
insert into [dbo].Album (SongName,DateOfRelease,CoverImage)
values (@SongName,@DateOfRelease,@CoverImage)
select 'Inserted' as results
end
else
begin
select 'Exists' as results
end
end
GO
/****** Object:  StoredProcedure [dbo].[USP_AlbumFolder_Select]    Script Date: 02-04-2020 20:51:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
create PROCEDURE [dbo].[USP_AlbumFolder_Select]
(
@SongName varchar(100)=''
)
as
BEGIN
select AlbumID , SongName,DateOfRelease , CoverImage from Album
where
SongName like @SongName +'%'
order by SongName
end
GO
/****** Object:  StoredProcedure [dbo].[USP_MusicAristFolder_Insert]    Script Date: 02-04-2020 20:51:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
create procedure [dbo].[USP_MusicAristFolder_Insert]
(
@Artistname varchar(100)='',
@SongName varchar(200)='',
@MusingFileName varchar(500)='',
@Bio varchar(100)='',
@DateOfBirth date=''
)
as
begin
if not exists (select *from MusicArist where MusingFileName=@MusingFileName)
begin
insert into [dbo].[MusicArist]
(Artistname,SongName,MusingFileName,Bio,DateOfBirth)
values
(@Artistname,@SongName,@MusingFileName,@Bio,@DateOfBirth)
select 'Inserted' as results
end
else
begin
select 'Exists' as results
end
end
GO
/****** Object:  StoredProcedure [dbo].[USP_MusicAristFolder_SelectALL]    Script Date: 02-04-2020 20:51:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
create procedure [dbo].[USP_MusicAristFolder_SelectALL]
(
@SongName varchar(100)=''
)
as
begin
select MusicID,Artistname,SongName,MusingFileName,Bio,DateOfBirth from MusicArist where SongName like @SongName +'%'
end
GO
/****** Object:  StoredProcedure [dbo].[USP_MusicAristFolder_Update]    Script Date: 02-04-2020 20:51:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
create procedure [dbo].[USP_MusicAristFolder_Update]
(
@MusicID varchar(20)='',
@Artistname varchar(100)='',
@SongName varchar(200)='',
@MusingFileName varchar(500)='',
@Bio varchar(100)='',
@DateOfBirth date=''
)
as
begin
update [dbo].[MusicArist]
set [Artistname]=@Artistname,
[SongName]=@SongName,
[MusingFileName]=@MusingFileName,
[Bio]=@Bio,
[DateOfBirth]=@DateOfBirth
where
MusicID=@MusicID
select 'Updated' as results
end
GO
