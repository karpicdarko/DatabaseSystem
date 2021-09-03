/*1. Funkcija koja za prosledjeni naziv masine vraca koliko je dana proslo od poslednjeg servisiranja do danas*/


drop function if exists dbo.Dani_od_servisa;

go
create function Dani_od_servisa
(
	@nazivmasine nvarchar(50)
)
returns int
as
begin
	declare @datumservisa as date
	set @datumservisa = (select Datum_servis from Masina where Naziv_masine = @nazivmasine)

	return datediff(day, @datumservisa, getdate());
end
go

select dbo.Dani_od_servisa('POF1400')as 'Broj dana od poslednjeg servisa'
select dbo.Dani_od_servisa('LT-182')as 'Broj dana od poslednjeg servisa'

/*2. Funkcija koja za prosledjeni naziv Operacije vraca broj koji oznacava koliko puta se ta operacija moze izvrsiti za 8 sati*/


drop function if exists Broj_operacija_u_danu;
go
create function Broj_operacija_u_danu
(
	@nazivoperacije nvarchar(50)
)
returns int 
as
begin
	declare @trajanjeoperacije as int
	set @trajanjeoperacije = (select Trajanje_operacije from Operacija where Naziv_operacije = @nazivoperacije)

	return 60 / @trajanjeoperacije * 8;
end
go

select dbo.Broj_operacija_u_danu('Struganje') as 'Broj operacija u danu'

/*3. Funkicja koja za prosledjen naziv sredstva vraca opremu za rad*/

drop function if exists Oprema_za_masinu
go
go
create function Oprema_za_masinu
(
	@nazivMasine nvarchar(50)
)
returns @tabela table
(
	Nazivopreme nvarchar(50) not null
)
as 
begin
	declare @idMasine as int
	set @idMasine = (Select ID_masine from Masina where Naziv_masine = @nazivMasine)
	
	insert @tabela 
			select Naziv_opreme as 'Oprema'
			from Oprema_za_rad o
				inner join Masina_Oprema mo on mo.ID_opreme = o.ID_opreme
				inner join Masina m on m.ID_masine = mo.ID_masine
			where m.ID_masine = @idMasine
	return
end
go

select Nazivopreme from dbo.Oprema_za_masinu('POF1400');

