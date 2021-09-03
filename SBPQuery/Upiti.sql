/*1. Upit koji izbacuje avg vrednost kvaliteta izvrsenja masina koje mogu izvrsiti operaciju secenja bakarnih sipki.*/

select Naziv_sredstva as 'Masina', avg(cast(Kvalitet_izvrsenja as float)) 'Prosecni kvalitet izvrsenja'
from Operacija_Sredstvo_Materijal osm
	inner join Operacija o on o.ID_operacije = osm.ID_operacije
	inner join Sredstvo_za_rad s on s.ID_sredstva = osm.ID_sredstva
	inner join Masina m on m.ID_sredstva = osm.ID_sredstva 
	inner join Materijal ma on ma.ID_materijala = osm.ID_materijala
where Naziv_materijala = 'Bakarna sipka' and Naziv_operacije = 'Secenje'
group by Naziv_sredstva;


/*2. Upit koji za svaku masinu izbacuje opremu za rad neophodnu za tu masinu*/

select Naziv_sredstva 'Sredstvo za rad', Naziv_masine as 'Naziv masine', Naziv_opreme as 'Neophodna oprema'
from Masina_Oprema mo
	right join Masina m on m.ID_masine = mo.ID_masine
	left join Oprema_za_rad o on o.ID_opreme = mo.ID_opreme
	left join Sredstvo_za_rad s on s.ID_sredstva = m.ID_sredstva
order by Naziv_masine;


/*3. Upit koji vraca naziv operacija koje traju najkrace i najduze*/

select Naziv_operacije, Trajanje_operacije
from Operacija
where Trajanje_operacije = (Select max(Trajanje_operacije) from Operacija) or Trajanje_operacije = (Select min(Trajanje_operacije) from Operacija)
order by Trajanje_operacije desc

/*4. Upit koji prikazuje koliko masina ima od svakog proizvodjaca koje su kupljene posle 2014'*/

Select Proizvodjac, count(ID_masine)
from Masina
where datepart(year, Datum_kupovine) > 2014
group by Proizvodjac

/*5. Upit koji ispisuje naziv materijala, njegov rok ukoliko postoji i broj operacija koje se mogu izvrsiti sa njim*/

select Naziv_materijala, isnull(cast(Rok_trajanja as varchar), 'Nema rok trajanja') as 'Rok trajanja', count(o.ID_operacije) as 'Broj operacija'
from Operacija_Sredstvo_Materijal osm
	right join Materijal m on m.ID_materijala = osm.ID_materijala
	left join Operacija o on o.ID_operacije = osm.ID_operacije
group by Naziv_materijala, Rok_trajanja
order by Naziv_materijala

