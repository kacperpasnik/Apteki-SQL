--==============================================================
-- DBMS name:      ALLBASE/SQL G.1 (Not Certified)
-- Created on:     07.01.2019 04:24:58
--==============================================================


drop index Admin_PK;

drop table Admin;

drop index Apteki_PK;

drop table Apteki;

drop index Lekarze_PK;

drop table Lekarze;

drop index Relationship_7_FK;

drop index Relationship_1_FK;

drop index Leki_PK;

drop table Leki;

drop index Pacjenci_PK;

drop table Pacjenci;

drop index Pracownicy_PK;

drop table Pracownicy;

drop index Producenci_PK;

drop table Producenci;

drop index Relationship_8_FK;

drop index Relationship_6_FK;

drop index Relationship_5_FK;

drop index Relationship_4_FK;

drop index Recepty_PK;

drop table Recepty;

drop index Relationship_3_FK;

drop index Relationship_2_FK;

drop index Relationship_2_PK;

drop table Relationship_2;

--==============================================================
-- Table: Admin
--==============================================================
create table Admin
(
   Id_admin INTEGER not null,
   Imie VARCHAR(25) not null,
   Nazwisko VARCHAR(50) not null,
   primary key (Id_admin)
         constraint PK_ADMIN
);

--==============================================================
-- Index: Admin_PK
--==============================================================
create unique  index Admin_PK on Admin
(
   Id_admin ASC
);

--==============================================================
-- Table: Apteki
--==============================================================
create table Apteki
(
   Id_apteki INTEGER not null,
   Adres VARCHAR(50) not null,
   primary key (Id_apteki)
         constraint PK_APTEKI
);

--==============================================================
-- Index: Apteki_PK
--==============================================================
create unique  index Apteki_PK on Apteki
(
   Id_apteki ASC
);

--==============================================================
-- Table: Lekarze
--==============================================================
create table Lekarze
(
   Id_lekarze CHAR(10) not null,
   Imie VARCHAR(25) not null,
   Nazwisko VARCHAR(50) not null,
   Adres VARCHAR(50),
   Miasto VARCHAR(50) not null,
   Pesel INTEGER not null,
   Telefon NUMERIC(9),
   primary key (Id_lekarze)
         constraint PK_LEKARZE
);

--==============================================================
-- Index: Lekarze_PK
--==============================================================
create unique  index Lekarze_PK on Lekarze
(
   Id_lekarze ASC
);

--==============================================================
-- Table: Producenci
--==============================================================
create table Producenci
(
   Id_producenci INTEGER not null,
   Nazwa VARCHAR(50) not null,
   primary key (Id_producenci)
         constraint PK_PRODUCENCI
);

--==============================================================
-- Table: Pacjenci
--==============================================================
create table Pacjenci
(
   Id_pacjenci CHAR(10) not null,
   Imie VARCHAR(25) not null,
   Nazwisko VARCHAR(50) not null,
   Adres VARCHAR(50) not null,
   Miasto VARCHAR(50) not null,
   Pesel INTEGER not null,
   Ubezpieczenie SMALLINT not null,
   Telefon NUMERIC(9),
   primary key (Id_pacjenci)
         constraint PK_PACJENCI
);

--==============================================================
-- Table: Pracownicy
--==============================================================
create table Pracownicy
(
   Id_pracownicy INTEGER not null,
   Imie VARCHAR(25) not null,
   Nazwisko VARCHAR(50) not null,
   Adres VARCHAR(50) not null,
   Pesel INTEGER not null,
   Miasto VARCHAR(50) not null,
   Stanowisko VARCHAR(25),
   Telefon NUMERIC(9),
   primary key (Id_pracownicy)
         constraint PK_PRACOWNICY
);

--==============================================================
-- Table: Recepty
--==============================================================
create table Recepty
(
   Id_recepty INTEGER not null,
   Id_pacjenci CHAR(10) not null,
   Id_lekarze CHAR(10) not null,
   Id_pracownicy INTEGER not null,
   Id_apteki INTEGER not null,
   Data DATE not null,
   Dawkowanie VARCHAR(25) not null,
   Nr_recepty NUMERIC(20) not null,
   primary key (Id_recepty)
         constraint PK_RECEPTY,
   foreign key (Id_lekarze)
         references Lekarze (Id_lekarze)
         constraint FK_RELATIONSHIP_4,
   foreign key (Id_pacjenci)
         references Pacjenci (Id_pacjenci)
         constraint FK_RELATIONSHIP_5,
   foreign key (Id_pracownicy)
         references Pracownicy (Id_pracownicy)
         constraint FK_RELATIONSHIP_6,
   foreign key (Id_apteki)
         references Apteki (Id_apteki)
         constraint FK_RELATIONSHIP_8
);

--==============================================================
-- Table: Leki
--==============================================================
create table Leki
(
   Id_leki CHAR(10) not null,
   Id_producenci INTEGER not null,
   Id_recepty INTEGER,
   Nazwa VARCHAR(50) not null,
   Recepta SMALLINT not null,
   Cena FLOAT(5) not null,
   Dawkowanie VARCHAR(25),
   primary key (Id_leki)
         constraint PK_LEKI,
   foreign key (Id_producenci)
         references Producenci (Id_producenci)
         constraint FK_RELATIONSHIP_1,
   foreign key (Id_recepty)
         references Recepty (Id_recepty)
         constraint FK_RELATIONSHIP_7
);

--==============================================================
-- Index: Leki_PK
--==============================================================
create unique  index Leki_PK on Leki
(
   Id_leki ASC
);

--==============================================================
-- Index: Relationship_1_FK
--==============================================================
create   index Relationship_1_FK on Leki
(
   Id_producenci ASC
);

--==============================================================
-- Index: Relationship_7_FK
--==============================================================
create   index Relationship_7_FK on Leki
(
   Id_recepty ASC
);

--==============================================================
-- Index: Pacjenci_PK
--==============================================================
create unique  index Pacjenci_PK on Pacjenci
(
   Id_pacjenci ASC
);

--==============================================================
-- Index: Pracownicy_PK
--==============================================================
create unique  index Pracownicy_PK on Pracownicy
(
   Id_pracownicy ASC
);

--==============================================================
-- Index: Producenci_PK
--==============================================================
create unique  index Producenci_PK on Producenci
(
   Id_producenci ASC
);

--==============================================================
-- Index: Recepty_PK
--==============================================================
create unique  index Recepty_PK on Recepty
(
   Id_recepty ASC
);

--==============================================================
-- Index: Relationship_4_FK
--==============================================================
create   index Relationship_4_FK on Recepty
(
   Id_lekarze ASC
);

--==============================================================
-- Index: Relationship_5_FK
--==============================================================
create   index Relationship_5_FK on Recepty
(
   Id_pacjenci ASC
);

--==============================================================
-- Index: Relationship_6_FK
--==============================================================
create   index Relationship_6_FK on Recepty
(
   Id_pracownicy ASC
);

--==============================================================
-- Index: Relationship_8_FK
--==============================================================
create   index Relationship_8_FK on Recepty
(
   Id_apteki ASC
);

--==============================================================
-- Table: Relationship_2
--==============================================================
create table Relationship_2
(
   Id_leki CHAR(10) not null,
   Id_apteki INTEGER not null,
   primary key (Id_leki, Id_apteki)
         constraint PK_RELATIONSHIP_2,
   foreign key (Id_leki)
         references Leki (Id_leki)
         constraint FK_RELATIONSHIP_2,
   foreign key (Id_apteki)
         references Apteki (Id_apteki)
         constraint FK_RELATIONSHIP_3
);

--==============================================================
-- Index: Relationship_2_PK
--==============================================================
create unique  index Relationship_2_PK on Relationship_2
(
   Id_leki ASC,
   Id_apteki ASC
);

--==============================================================
-- Index: Relationship_2_FK
--==============================================================
create   index Relationship_2_FK on Relationship_2
(
   Id_leki ASC
);

--==============================================================
-- Index: Relationship_3_FK
--==============================================================
create   index Relationship_3_FK on Relationship_2
(
   Id_apteki ASC
);

