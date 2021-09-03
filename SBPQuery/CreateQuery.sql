drop table if exists Operacija_Sredstvo_Materijal;
drop table if exists Operacija_Sredstvo;
drop table if exists Masina_oprema;
drop table if exists Oprema_za_rad;
drop table if exists Radna_lista;
drop table if exists Materijal;
drop table if exists Alat;
drop table if exists Masina;
drop table if exists Operacija;
drop table if exists Sredstvo_za_rad;

create table Operacija
(
	ID_operacije int not null identity, 
	Naziv_operacije nvarchar(50) not null,
	Opis_operacije nvarchar(100) null,
	Trajanje_operacije int not null
	constraint PK_Operacija primary key (ID_operacije)
);

create table Radna_lista
(
	Br_radne_liste int not null identity,
	Datum_izdavanja date not null,
	Datum_isteka date null,
	ID_operacije int not null,
	constraint PK_Radna_lista primary key (Br_radne_liste),
	constraint FK_Radna_lista_Operacija foreign key (ID_operacije)	
		references Operacija (ID_operacije) on delete cascade
	
);

create table Materijal
(
	ID_materijala int not null identity,
	Naziv_materijala nvarchar(50) not null,
	Opis_materijala nvarchar(100) null,
	Rok_trajanja date null,
	constraint PK_Materijal primary key (ID_materijala)

);

create table Sredstvo_za_rad
(
	ID_sredstva int not null identity,
	Naziv_sredstva nvarchar(50) not null,
	Tip nvarchar(6) not null check(Tip = 'alat' or Tip = 'masina'), 
	constraint PK_Sredstvo_za_rad primary key (ID_sredstva)
);

create table Alat
(
	ID_alata int not null identity,
	Naziv_alata nvarchar(50) not null,
	Napomena_alata nvarchar(100) null,
	ID_sredstva int not null,
	constraint PK_Alat primary key (ID_alata,ID_sredstva),
	constraint FK_Alat_Sredstvo_za_rad foreign key (ID_sredstva) 
		references Sredstvo_za_rad (ID_sredstva) on delete cascade
);


create table Masina
(
	ID_masine int not null identity,
	Naziv_masine nvarchar(50) not null,
	Proizvodjac nvarchar(100) null,
	Datum_servis date not null,
	Datum_kupovine date not null,
	Kvalitet_izvrsenja float not null check(Kvalitet_izvrsenja between 1 and 10),
	ID_sredstva int not null,
	constraint PK_Masina primary key (ID_masine,ID_sredstva),
	constraint FK_Masina_Sredstvo_za_rad foreign key (ID_sredstva) 
		references Sredstvo_za_rad (ID_sredstva) on delete cascade
);


create table Oprema_za_rad
(
	ID_opreme int not null identity,
	Naziv_opreme nvarchar(50) not null,
	Opis_opreme nvarchar(100),
	constraint PK_Oprema_za_rad primary key (ID_opreme)
);


create table Operacija_Sredstvo
(
	ID_operacije int not null,
	ID_sredstva int not null,
	constraint PK_Operacija_Sredstvo primary key(ID_operacije,ID_sredstva),
	constraint FK_Operacija_Sredstvo_Sredstvo_za_rad foreign key (ID_sredstva) 
		references Sredstvo_za_rad (ID_sredstva) on delete cascade,
	constraint FK_Operacija_Sredstvo_Operacija foreign key (ID_operacije) 
		references Operacija (ID_operacije) on delete cascade
		
);

create table Operacija_Sredstvo_Materijal
(
	ID_operacije int not null,
	ID_sredstva int not null,
	ID_materijala int not null,
	constraint PK_Operacija_Sredstvo_Materijal primary key(ID_operacije,ID_sredstva,ID_materijala),
	constraint FK_Operacija_Sredstvo_Materijal_Materijal foreign key (ID_materijala) 
		references Materijal (ID_materijala) on delete cascade,
	constraint FK_Operacija_Sredstvo_Materijal_Operacija_Sredstvo foreign key (ID_operacije, ID_sredstva) 
		references Operacija_Sredstvo (ID_operacije, ID_sredstva) on delete cascade

);

create table Masina_Oprema
(
	ID_masine int not null,
	ID_sredstva int not null,
	ID_opreme int not null,
	constraint PK_Masina_Oprema primary key (ID_masine,ID_sredstva,ID_opreme),
	constraint FK_Masina_Oprema_Masina foreign key (ID_masine,ID_sredstva) 
		references Masina(ID_masine, ID_sredstva) on delete cascade,
	constraint FK_Masina_Oprema_Oprema foreign key (ID_opreme) 
		references Oprema_za_rad (ID_opreme)
		
);

/*

*/