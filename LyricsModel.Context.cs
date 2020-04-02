﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace PlayLyrical
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using System.Data.Entity.Core.Objects;
    using System.Linq;
    
    public partial class musicPlayerEntities : DbContext
    {
        public musicPlayerEntities()
            : base("name=musicPlayerEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Album> Album { get; set; }
        public virtual DbSet<MusicArist> MusicArist { get; set; }
    
        public virtual int MusicAristFolder_Delete(string musicID)
        {
            var musicIDParameter = musicID != null ?
                new ObjectParameter("MusicID", musicID) :
                new ObjectParameter("MusicID", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("MusicAristFolder_Delete", musicIDParameter);
        }
    
        public virtual ObjectResult<USP_Album_Select_Result> USP_Album_Select(string songName)
        {
            var songNameParameter = songName != null ?
                new ObjectParameter("SongName", songName) :
                new ObjectParameter("SongName", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<USP_Album_Select_Result>("USP_Album_Select", songNameParameter);
        }
    
        public virtual ObjectResult<string> USP_AlbumFolder_Insert(string songName, Nullable<System.DateTime> dateOfRelease, string coverImage)
        {
            var songNameParameter = songName != null ?
                new ObjectParameter("SongName", songName) :
                new ObjectParameter("SongName", typeof(string));
    
            var dateOfReleaseParameter = dateOfRelease.HasValue ?
                new ObjectParameter("DateOfRelease", dateOfRelease) :
                new ObjectParameter("DateOfRelease", typeof(System.DateTime));
    
            var coverImageParameter = coverImage != null ?
                new ObjectParameter("CoverImage", coverImage) :
                new ObjectParameter("CoverImage", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<string>("USP_AlbumFolder_Insert", songNameParameter, dateOfReleaseParameter, coverImageParameter);
        }
    
        public virtual ObjectResult<USP_AlbumFolder_Select_Result> USP_AlbumFolder_Select(string songName)
        {
            var songNameParameter = songName != null ?
                new ObjectParameter("SongName", songName) :
                new ObjectParameter("SongName", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<USP_AlbumFolder_Select_Result>("USP_AlbumFolder_Select", songNameParameter);
        }
    
        public virtual ObjectResult<string> USP_MusicAristFolder_Insert(string artistname, string songName, string musingFileName, string bio, Nullable<System.DateTime> dateOfBirth)
        {
            var artistnameParameter = artistname != null ?
                new ObjectParameter("Artistname", artistname) :
                new ObjectParameter("Artistname", typeof(string));
    
            var songNameParameter = songName != null ?
                new ObjectParameter("SongName", songName) :
                new ObjectParameter("SongName", typeof(string));
    
            var musingFileNameParameter = musingFileName != null ?
                new ObjectParameter("MusingFileName", musingFileName) :
                new ObjectParameter("MusingFileName", typeof(string));
    
            var bioParameter = bio != null ?
                new ObjectParameter("Bio", bio) :
                new ObjectParameter("Bio", typeof(string));
    
            var dateOfBirthParameter = dateOfBirth.HasValue ?
                new ObjectParameter("DateOfBirth", dateOfBirth) :
                new ObjectParameter("DateOfBirth", typeof(System.DateTime));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<string>("USP_MusicAristFolder_Insert", artistnameParameter, songNameParameter, musingFileNameParameter, bioParameter, dateOfBirthParameter);
        }
    
        public virtual ObjectResult<USP_MusicAristFolder_SelectALL_Result> USP_MusicAristFolder_SelectALL(string songName)
        {
            var songNameParameter = songName != null ?
                new ObjectParameter("SongName", songName) :
                new ObjectParameter("SongName", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<USP_MusicAristFolder_SelectALL_Result>("USP_MusicAristFolder_SelectALL", songNameParameter);
        }
    
        public virtual ObjectResult<string> USP_MusicAristFolder_Update(string musicID, string artistname, string songName, string musingFileName, string bio, Nullable<System.DateTime> dateOfBirth)
        {
            var musicIDParameter = musicID != null ?
                new ObjectParameter("MusicID", musicID) :
                new ObjectParameter("MusicID", typeof(string));
    
            var artistnameParameter = artistname != null ?
                new ObjectParameter("Artistname", artistname) :
                new ObjectParameter("Artistname", typeof(string));
    
            var songNameParameter = songName != null ?
                new ObjectParameter("SongName", songName) :
                new ObjectParameter("SongName", typeof(string));
    
            var musingFileNameParameter = musingFileName != null ?
                new ObjectParameter("MusingFileName", musingFileName) :
                new ObjectParameter("MusingFileName", typeof(string));
    
            var bioParameter = bio != null ?
                new ObjectParameter("Bio", bio) :
                new ObjectParameter("Bio", typeof(string));
    
            var dateOfBirthParameter = dateOfBirth.HasValue ?
                new ObjectParameter("DateOfBirth", dateOfBirth) :
                new ObjectParameter("DateOfBirth", typeof(System.DateTime));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<string>("USP_MusicAristFolder_Update", musicIDParameter, artistnameParameter, songNameParameter, musingFileNameParameter, bioParameter, dateOfBirthParameter);
        }
    }
}
