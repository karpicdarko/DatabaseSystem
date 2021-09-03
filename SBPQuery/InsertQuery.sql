--Operacija
insert into Operacija (Naziv_operacije, Opis_operacije, Trajanje_operacije)
values ('Secenje', 'Secenje na komade', 1);

insert into Operacija (Naziv_operacije, Opis_operacije, Trajanje_operacije)
values ('Savijanje', 'Savijanje materijala', 2);

insert into Operacija (Naziv_operacije, Opis_operacije, Trajanje_operacije)
values ('Struganje', 'Struganje materijala', 3);

insert into Operacija (Naziv_operacije, Opis_operacije, Trajanje_operacije)
values ('Uvijanje', 'Uvijanje materijala u spiralu', 1);

insert into Operacija (Naziv_operacije, Opis_operacije, Trajanje_operacije)
values ('Poliranje', 'Poliranje materijala', 3);


--Materijal
insert into Materijal (Naziv_materijala, Opis_materijala, Rok_trajanja)
values ('Bakarna sipka', 'Sipka od bakra duzine 1 metar', '2035-11-04')

insert into Materijal (Naziv_materijala, Opis_materijala, Rok_trajanja)
values ('Celicna sipka', 'Sipka od celika duzine 1 metar', '2030-07-15')

insert into Materijal (Naziv_materijala, Opis_materijala, Rok_trajanja)
values ('Cev', 'Cev od celika duzine 1 metar precnika 10 cm', '2031-01-11')

insert into Materijal (Naziv_materijala, Opis_materijala, Rok_trajanja)
values ('Bakarna zica', 'Zica od bakra duzine 50 metar debljine 1 milimetar', '2041-05-04')

insert into Materijal (Naziv_materijala, Opis_materijala, Rok_trajanja)
values ('Celicna zica', 'Zica od celika duzine 50 metar debljine 1 milimetar', '2042-03-03')

insert into Materijal (Naziv_materijala, Opis_materijala, Rok_trajanja)
values ('Titanijumska cev', 'Cev od titanijuma duzine 5 metara', null)


--Sredstva_za_rad
insert into Sredstvo_za_rad (Naziv_sredstva, Tip)
values ('Glodalica','Masina')

insert into Sredstvo_za_rad (Naziv_sredstva, Tip)
values ('Presa','Masina')

insert into Sredstvo_za_rad (Naziv_sredstva, Tip)
values ('Brusilica','Masina')

insert into Sredstvo_za_rad (Naziv_sredstva, Tip)
values ('Masina za uvijanje','Masina')

insert into Sredstvo_za_rad (Naziv_sredstva, Tip)
values ('Masina za poliranje','Masina')

insert into Sredstvo_za_rad (Naziv_sredstva, Tip)
values ('Cekic','Alat')

insert into Sredstvo_za_rad (Naziv_sredstva, Tip)
values ('Srafciger','Alat')

insert into Sredstvo_za_rad (Naziv_sredstva, Tip)
values ('Kljuc','Alat')

insert into Sredstvo_za_rad (Naziv_sredstva, Tip)
values ('Subler','Alat')

insert into Sredstvo_za_rad (Naziv_sredstva, Tip)
values ('Makaze','Alat')


--Oprema_za_rad
insert into Oprema_za_rad (Naziv_opreme, Opis_opreme)
values ('Rukavice','Zastitne rukavice');

insert into Oprema_za_rad (Naziv_opreme, Opis_opreme)
values ('Slem','Zastitni slem');

insert into Oprema_za_rad (Naziv_opreme, Opis_opreme)
values ('Naocare','Zastitne naocare');

insert into Oprema_za_rad (Naziv_opreme, Opis_opreme)
values ('Maska','Maska za zastitu od udisanja stetnih materija');

insert into Oprema_za_rad (Naziv_opreme, Opis_opreme)
values ('Prsluk','Fluorescentni prsluk');


--Alat
insert into Alat (Naziv_alata, Napomena_alata, ID_sredstva)
values ('Krstasti srafciger', '', 7);

insert into Alat (Naziv_alata, Napomena_alata, ID_sredstva)
values ('Ravni srafciger', '', 7);

insert into Alat (Naziv_alata, Napomena_alata, ID_sredstva)
values ('Metalni cekic', '', 6);

insert into Alat (Naziv_alata, Napomena_alata, ID_sredstva)
values ('Gumeni cekic', '', 6);

insert into Alat (Naziv_alata, Napomena_alata, ID_sredstva)
values ('Francuski kljuc', '', 8);

insert into Alat (Naziv_alata, Napomena_alata, ID_sredstva)
values ('Okasti kljuc', 'Velicina: 8', 8);

insert into Alat (Naziv_alata, Napomena_alata, ID_sredstva)
values ('Elektricni subler', '', 9);

insert into Alat (Naziv_alata, Napomena_alata, ID_sredstva)
values ('Makaze za metal', '', 10);


--Masina
insert into Masina (Naziv_masine, Proizvodjac, Datum_servis, Datum_kupovine, Kvalitet_izvrsenja, ID_sredstva)
values ('GWS 11-125', 'Bosch', '2020-01-30', '2015-06-24', 10, 3);

insert into Masina (Naziv_masine, Proizvodjac, Datum_servis, Datum_kupovine, Kvalitet_izvrsenja, ID_sredstva)
values ('GX 225-60', 'Pedinghaus', '2020-02-14', '2017-08-09', 10, 2);

insert into Masina (Naziv_masine, Proizvodjac, Datum_servis, Datum_kupovine, Kvalitet_izvrsenja, ID_sredstva)
values ('POF1400', 'Bosch', '2020-03-01', '2019-04-04', 10, 1);

insert into Masina (Naziv_masine, Proizvodjac, Datum_servis, Datum_kupovine, Kvalitet_izvrsenja, ID_sredstva)
values ('LT-182', 'Lorenz', '2020-01-31', '2018-09-22', 10, 4);

insert into Masina (Naziv_masine, Proizvodjac, Datum_servis, Datum_kupovine, Kvalitet_izvrsenja, ID_sredstva)
values ('GP-WP 820', 'Womax', '2020-04-04', '2020-01-02', 10, 5);

insert into Masina (Naziv_masine, Proizvodjac, Datum_servis, Datum_kupovine, Kvalitet_izvrsenja, ID_sredstva)
values ('GWS 11-115', 'Bosch', '2020-02-10', '2014-07-22', 8, 3);

insert into Masina (Naziv_masine, Proizvodjac, Datum_servis, Datum_kupovine, Kvalitet_izvrsenja, ID_sredstva)
values ('955HNRG', 'Makita', '2020-01-09', '2019-11-30', 9, 3);

insert into Masina (Naziv_masine, Proizvodjac, Datum_servis, Datum_kupovine, Kvalitet_izvrsenja, ID_sredstva)
values ('ZTX-009', 'Brauger', '2020-01-09', '2010-09-11', 6, 3);


--Radna_lista
insert into Radna_lista (Datum_izdavanja, Datum_isteka, ID_operacije)
values ('2019-12-21', '2020-01-01', 1);

insert into Radna_lista (Datum_izdavanja, Datum_isteka, ID_operacije)
values ('2020-01-21', '2020-05-31', 1);

insert into Radna_lista (Datum_izdavanja, Datum_isteka, ID_operacije)
values ('2020-03-01', '2020-03-31', 2);

insert into Radna_lista (Datum_izdavanja, Datum_isteka, ID_operacije)
values ('2020-04-04', '2020-06-14', 2);

insert into Radna_lista (Datum_izdavanja, Datum_isteka, ID_operacije)
values ('2019-11-28', '2019-12-14', 3);

insert into Radna_lista (Datum_izdavanja, Datum_isteka, ID_operacije)
values ('2020-02-28', '2020-06-01', 3);

insert into Radna_lista (Datum_izdavanja, Datum_isteka, ID_operacije)
values ('2019-12-28', '2020-01-10', 4);

insert into Radna_lista (Datum_izdavanja, Datum_isteka, ID_operacije)
values ('2020-05-11', '2020-07-09', 4);

insert into Radna_lista (Datum_izdavanja, Datum_isteka, ID_operacije)
values ('2019-12-31', '2020-01-05', 5);

insert into Radna_lista (Datum_izdavanja, Datum_isteka, ID_operacije)
values ('2020-05-05', '2020-08-03', 5);




--Masina_Oprema
insert into Masina_Oprema (ID_masine, ID_sredstva, ID_opreme)
values (1, 3, 1);

insert into Masina_Oprema (ID_masine, ID_sredstva, ID_opreme)
values (1, 3, 3);

insert into Masina_Oprema (ID_masine, ID_sredstva, ID_opreme)
values (2, 2, 2);

insert into Masina_Oprema (ID_masine, ID_sredstva, ID_opreme)
values (2, 2, 5);

insert into Masina_Oprema (ID_masine, ID_sredstva, ID_opreme)
values (2, 2, 3);

insert into Masina_Oprema (ID_masine, ID_sredstva, ID_opreme)
values (3, 1, 1);

insert into Masina_Oprema (ID_masine, ID_sredstva, ID_opreme)
values (3, 1, 3);

insert into Masina_Oprema (ID_masine, ID_sredstva, ID_opreme)
values (3, 1, 5);

insert into Masina_Oprema (ID_masine, ID_sredstva, ID_opreme)
values (4, 4, 1);

insert into Masina_Oprema (ID_masine, ID_sredstva, ID_opreme)
values (4, 4, 5);

insert into Masina_Oprema (ID_masine, ID_sredstva, ID_opreme)
values (4, 4, 3);

insert into Masina_Oprema (ID_masine, ID_sredstva, ID_opreme)
values (5, 5, 1);

insert into Masina_Oprema (ID_masine, ID_sredstva, ID_opreme)
values (5, 5, 3);

insert into Masina_Oprema (ID_masine, ID_sredstva, ID_opreme)
values (5, 5, 4);


--Operacija_Sredstvo
insert into Operacija_Sredstvo (ID_operacije, ID_sredstva)
values (1, 3);

insert into Operacija_Sredstvo (ID_operacije, ID_sredstva)
values (2, 2);

insert into Operacija_Sredstvo (ID_operacije, ID_sredstva)
values (3, 1);

insert into Operacija_Sredstvo (ID_operacije, ID_sredstva)
values (4, 4);

insert into Operacija_Sredstvo (ID_operacije, ID_sredstva)
values (5, 5);


--Operacija_Sredstvo_Materijal
insert into Operacija_Sredstvo_Materijal (ID_operacije, ID_sredstva, ID_materijala)
values (1, 3, 1)

insert into Operacija_Sredstvo_Materijal (ID_operacije, ID_sredstva, ID_materijala)
values (1, 3, 2)

insert into Operacija_Sredstvo_Materijal (ID_operacije, ID_sredstva, ID_materijala)
values (1, 3, 3)

insert into Operacija_Sredstvo_Materijal (ID_operacije, ID_sredstva, ID_materijala)
values (1, 3, 4)

insert into Operacija_Sredstvo_Materijal (ID_operacije, ID_sredstva, ID_materijala)
values (1, 3, 5)

insert into Operacija_Sredstvo_Materijal (ID_operacije, ID_sredstva, ID_materijala)
values (2, 2, 1)

insert into Operacija_Sredstvo_Materijal (ID_operacije, ID_sredstva, ID_materijala)
values (2, 2, 2)

insert into Operacija_Sredstvo_Materijal (ID_operacije, ID_sredstva, ID_materijala)
values (2, 2, 3)

insert into Operacija_Sredstvo_Materijal (ID_operacije, ID_sredstva, ID_materijala)
values (2, 2, 4)

insert into Operacija_Sredstvo_Materijal (ID_operacije, ID_sredstva, ID_materijala)
values (2, 2, 5)

insert into Operacija_Sredstvo_Materijal (ID_operacije, ID_sredstva, ID_materijala)
values (3, 1, 1)

insert into Operacija_Sredstvo_Materijal (ID_operacije, ID_sredstva, ID_materijala)
values (3, 1, 2)

insert into Operacija_Sredstvo_Materijal (ID_operacije, ID_sredstva, ID_materijala)
values (3, 1, 3)

insert into Operacija_Sredstvo_Materijal (ID_operacije, ID_sredstva, ID_materijala)
values (4, 4, 1)

insert into Operacija_Sredstvo_Materijal (ID_operacije, ID_sredstva, ID_materijala)
values (4, 4, 2)

insert into Operacija_Sredstvo_Materijal (ID_operacije, ID_sredstva, ID_materijala)
values (4, 4, 3)

insert into Operacija_Sredstvo_Materijal (ID_operacije, ID_sredstva, ID_materijala)
values (4, 4, 4)

insert into Operacija_Sredstvo_Materijal (ID_operacije, ID_sredstva, ID_materijala)
values (4, 4, 5)

insert into Operacija_Sredstvo_Materijal (ID_operacije, ID_sredstva, ID_materijala)
values (5, 5, 1)

insert into Operacija_Sredstvo_Materijal (ID_operacije, ID_sredstva, ID_materijala)
values (5, 5, 2)

insert into Operacija_Sredstvo_Materijal (ID_operacije, ID_sredstva, ID_materijala)
values (5, 5, 3)



