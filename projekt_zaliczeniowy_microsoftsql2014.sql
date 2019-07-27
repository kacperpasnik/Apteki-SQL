/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2014                    */
/* Created on:     07.01.2019 04:20:52                          */
/*==============================================================*/


if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Leki') and o.name = 'FK_LEKI_RELATIONS_PRODUCEN')
alter table Leki
   drop constraint FK_LEKI_RELATIONS_PRODUCEN
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Leki') and o.name = 'FK_LEKI_RELATIONS_RECEPTY')
alter table Leki
   drop constraint FK_LEKI_RELATIONS_RECEPTY
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Recepty') and o.name = 'FK_RECEPTY_RELATIONS_LEKARZE')
alter table Recepty
   drop constraint FK_RECEPTY_RELATIONS_LEKARZE
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Recepty') and o.name = 'FK_RECEPTY_RELATIONS_PACJENCI')
alter table Recepty
   drop constraint FK_RECEPTY_RELATIONS_PACJENCI
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Recepty') and o.name = 'FK_RECEPTY_RELATIONS_PRACOWNI')
alter table Recepty
   drop constraint FK_RECEPTY_RELATIONS_PRACOWNI
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Recepty') and o.name = 'FK_RECEPTY_RELATIONS_APTEKI')
alter table Recepty
   drop constraint FK_RECEPTY_RELATIONS_APTEKI
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Relationship_2') and o.name = 'FK_RELATION_RELATIONS_LEKI')
alter table Relationship_2
   drop constraint FK_RELATION_RELATIONS_LEKI
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Relationship_2') and o.name = 'FK_RELATION_RELATIONS_APTEKI')
alter table Relationship_2
   drop constraint FK_RELATION_RELATIONS_APTEKI
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Admin')
            and   type = 'U')
   drop table Admin
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Apteki')
            and   type = 'U')
   drop table Apteki
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Lekarze')
            and   type = 'U')
   drop table Lekarze
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('Leki')
            and   name  = 'Relationship_7_FK'
            and   indid > 0
            and   indid < 255)
   drop index Leki.Relationship_7_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('Leki')
            and   name  = 'Relationship_1_FK'
            and   indid > 0
            and   indid < 255)
   drop index Leki.Relationship_1_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Leki')
            and   type = 'U')
   drop table Leki
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Pacjenci')
            and   type = 'U')
   drop table Pacjenci
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Pracownicy')
            and   type = 'U')
   drop table Pracownicy
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Producenci')
            and   type = 'U')
   drop table Producenci
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('Recepty')
            and   name  = 'Relationship_8_FK'
            and   indid > 0
            and   indid < 255)
   drop index Recepty.Relationship_8_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('Recepty')
            and   name  = 'Relationship_6_FK'
            and   indid > 0
            and   indid < 255)
   drop index Recepty.Relationship_6_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('Recepty')
            and   name  = 'Relationship_5_FK'
            and   indid > 0
            and   indid < 255)
   drop index Recepty.Relationship_5_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('Recepty')
            and   name  = 'Relationship_4_FK'
            and   indid > 0
            and   indid < 255)
   drop index Recepty.Relationship_4_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Recepty')
            and   type = 'U')
   drop table Recepty
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('Relationship_2')
            and   name  = 'Relationship_3_FK'
            and   indid > 0
            and   indid < 255)
   drop index Relationship_2.Relationship_3_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('Relationship_2')
            and   name  = 'Relationship_2_FK'
            and   indid > 0
            and   indid < 255)
   drop index Relationship_2.Relationship_2_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Relationship_2')
            and   type = 'U')
   drop table Relationship_2
go

/*==============================================================*/
/* Table: Admin                                                 */
/*==============================================================*/
create table Admin (
   Id_admin             int                  not null,
   Imie                 varchar(25)          not null,
   Nazwisko             varchar(50)          not null,
   constraint PK_ADMIN primary key (Id_admin)
)
go

/*==============================================================*/
/* Table: Apteki                                                */
/*==============================================================*/
create table Apteki (
   Id_apteki            int                  not null,
   Adres                varchar(50)          not null,
   constraint PK_APTEKI primary key (Id_apteki)
)
go

/*==============================================================*/
/* Table: Lekarze                                               */
/*==============================================================*/
create table Lekarze (
   Id_lekarze           char(10)             not null,
   Imie                 varchar(25)          not null,
   Nazwisko             varchar(50)          not null,
   Adres                varchar(50)          null,
   Miasto               varchar(50)          not null,
   Pesel                int                  not null,
   Telefon              numeric(9)           null,
   constraint PK_LEKARZE primary key (Id_lekarze)
)
go

/*==============================================================*/
/* Table: Leki                                                  */
/*==============================================================*/
create table Leki (
   Id_leki              char(10)             not null,
   Id_producenci        int                  not null,
   Id_recepty           int                  null,
   Nazwa                varchar(50)          not null,
   Recepta              bit                  not null,
   Cena                 float(5)             not null,
   Dawkowanie           varchar(25)          null,
   constraint PK_LEKI primary key (Id_leki)
)
go

/*==============================================================*/
/* Index: Relationship_1_FK                                     */
/*==============================================================*/




create nonclustered index Relationship_1_FK on Leki (Id_producenci ASC)
go

/*==============================================================*/
/* Index: Relationship_7_FK                                     */
/*==============================================================*/




create nonclustered index Relationship_7_FK on Leki (Id_recepty ASC)
go

/*==============================================================*/
/* Table: Pacjenci                                              */
/*==============================================================*/
create table Pacjenci (
   Id_pacjenci          char(10)             not null,
   Imie                 varchar(25)          not null,
   Nazwisko             varchar(50)          not null,
   Adres                varchar(50)          not null,
   Miasto               varchar(50)          not null,
   Pesel                int                  not null,
   Ubezpieczenie        bit                  not null,
   Telefon              numeric(9)           null,
   constraint PK_PACJENCI primary key (Id_pacjenci)
)
go

/*==============================================================*/
/* Table: Pracownicy                                            */
/*==============================================================*/
create table Pracownicy (
   Id_pracownicy        int                  not null,
   Imie                 varchar(25)          not null,
   Nazwisko             varchar(50)          not null,
   Adres                varchar(50)          not null,
   Pesel                int                  not null,
   Miasto               varchar(50)          not null,
   Stanowisko           varchar(25)          null,
   Telefon              numeric(9)           null,
   constraint PK_PRACOWNICY primary key (Id_pracownicy)
)
go

/*==============================================================*/
/* Table: Producenci                                            */
/*==============================================================*/
create table Producenci (
   Id_producenci        int                  not null,
   Nazwa                varchar(50)          not null,
   constraint PK_PRODUCENCI primary key (Id_producenci)
)
go

/*==============================================================*/
/* Table: Recepty                                               */
/*==============================================================*/
create table Recepty (
   Id_recepty           int                  not null,
   Id_pacjenci          char(10)             not null,
   Id_lekarze           char(10)             not null,
   Id_pracownicy        int                  not null,
   Id_apteki            int                  not null,
   Data                 datetime             not null,
   Dawkowanie           varchar(25)          not null,
   Nr_recepty           numeric(20)          not null,
   constraint PK_RECEPTY primary key (Id_recepty)
)
go

/*==============================================================*/
/* Index: Relationship_4_FK                                     */
/*==============================================================*/




create nonclustered index Relationship_4_FK on Recepty (Id_lekarze ASC)
go

/*==============================================================*/
/* Index: Relationship_5_FK                                     */
/*==============================================================*/




create nonclustered index Relationship_5_FK on Recepty (Id_pacjenci ASC)
go

/*==============================================================*/
/* Index: Relationship_6_FK                                     */
/*==============================================================*/




create nonclustered index Relationship_6_FK on Recepty (Id_pracownicy ASC)
go

/*==============================================================*/
/* Index: Relationship_8_FK                                     */
/*==============================================================*/




create nonclustered index Relationship_8_FK on Recepty (Id_apteki ASC)
go

/*==============================================================*/
/* Table: Relationship_2                                        */
/*==============================================================*/
create table Relationship_2 (
   Id_leki              char(10)             not null,
   Id_apteki            int                  not null,
   constraint PK_RELATIONSHIP_2 primary key (Id_leki, Id_apteki)
)
go

/*==============================================================*/
/* Index: Relationship_2_FK                                     */
/*==============================================================*/




create nonclustered index Relationship_2_FK on Relationship_2 (Id_leki ASC)
go

/*==============================================================*/
/* Index: Relationship_3_FK                                     */
/*==============================================================*/




create nonclustered index Relationship_3_FK on Relationship_2 (Id_apteki ASC)
go

alter table Leki
   add constraint FK_LEKI_RELATIONS_PRODUCEN foreign key (Id_producenci)
      references Producenci (Id_producenci)
go

alter table Leki
   add constraint FK_LEKI_RELATIONS_RECEPTY foreign key (Id_recepty)
      references Recepty (Id_recepty)
go

alter table Recepty
   add constraint FK_RECEPTY_RELATIONS_LEKARZE foreign key (Id_lekarze)
      references Lekarze (Id_lekarze)
go

alter table Recepty
   add constraint FK_RECEPTY_RELATIONS_PACJENCI foreign key (Id_pacjenci)
      references Pacjenci (Id_pacjenci)
go

alter table Recepty
   add constraint FK_RECEPTY_RELATIONS_PRACOWNI foreign key (Id_pracownicy)
      references Pracownicy (Id_pracownicy)
go

alter table Recepty
   add constraint FK_RECEPTY_RELATIONS_APTEKI foreign key (Id_apteki)
      references Apteki (Id_apteki)
go

alter table Relationship_2
   add constraint FK_RELATION_RELATIONS_LEKI foreign key (Id_leki)
      references Leki (Id_leki)
go

alter table Relationship_2
   add constraint FK_RELATION_RELATIONS_APTEKI foreign key (Id_apteki)
      references Apteki (Id_apteki)
go

