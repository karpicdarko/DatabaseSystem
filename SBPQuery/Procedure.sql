/*1. Procedura koja za prosledjeni id radne liste prikazuje podatke o operaciji, materijalu i sredstvu za rad koje se koristi u formi 
  Radna lista sa brojem <Br_radne_liste> i datumom isteka <Datum_isteka> odnosi se na operaciju <Naziv_operacije> sa IDem <ID_operacije> za koju se koristi Masina: <Naziv_sredstva> 
  i Materijal: <Naziv_materijala>.*/

drop proc if exists RadnaLista_Operacija;

go 
create proc RadnaLista_Operacija
	@brListe as int
as
begin
	declare @rbr as int
	declare @rbr2 as int
	declare @datumIsteka as date
	set @datumIsteka = (select Datum_isteka from Radna_lista where Br_radne_liste = @brListe)
	declare @operacija as nvarchar(50)
	set @operacija = (select Naziv_operacije from Radna_lista
							left join Operacija o on o.ID_operacije = Radna_lista.ID_operacije
					  where Br_radne_liste = @brListe)
	declare @operacijaID as int
	set @operacijaID = (select ID_operacije from Radna_lista
						where Br_radne_liste = @brListe)
	declare @istekla as nvarchar(10)
	declare @ddiff as int
	set @ddiff = datediff(day, @datumIsteka, getdate())
	if @ddiff <= 0
		set @istekla = 'VAZECA'
	else
		set @istekla = 'ISTEKLA'
	declare @nazivSredstva as nvarchar(50)
	declare @nazivMaterijala as nvarchar(50)
	declare @rokTrajanja as date


	print 'Radna lista ' + cast(@brListe as nvarchar(50)) + ' sa datumom isteka: ' + cast(@datumIsteka as nvarchar(20)) + '(' + @istekla + ')' + ' odnosi se na operaciju ' + @operacija + ' ciji je ID: ' + cast(@operacijaID as nvarchar(50)) + ' i u kojoj se koriste sledeca sredstva:'

	set @rbr = 1
	declare sredstvo_cursor cursor fast_forward for
		select Naziv_sredstva
		from Operacija_Sredstvo os
			left join Operacija o on o.ID_operacije = os.ID_operacije
			left join Sredstvo_za_rad s on s.ID_sredstva = os.ID_sredstva
		where os.ID_operacije = @operacijaID;
	open sredstvo_cursor;
	fetch next from sredstvo_cursor into @nazivSredstva
	while @@FETCH_STATUS = 0 
		begin
			print cast(@rbr as nvarchar(10)) + '. ' + @nazivSredstva + ' za materijal:';
			set @rbr2 = 1;
			declare materijal_cursor cursor fast_forward for 
				select Naziv_materijala, Rok_trajanja
				from Operacija_Sredstvo_Materijal osm
					left join Materijal m on m.ID_materijala = osm.ID_materijala
					left join Sredstvo_za_rad s on s.ID_sredstva = osm.ID_sredstva
				where osm.ID_operacije = @operacijaID
			open materijal_cursor;
			fetch next from materijal_cursor into @nazivMaterijala, @rokTrajanja;
			while @@FETCH_STATUS = 0 
				begin
					print '	' +  cast(@rbr as nvarchar(10)) + '.' + cast(@rbr2 as nvarchar(10)) + ' ' + @nazivMaterijala + ' rok trajanja: ' + cast(@rokTrajanja as nvarchar(20))
					fetch next from materijal_cursor into  @nazivMaterijala, @rokTrajanja;
					set @rbr2 = @rbr2 + 1;
				end
			close materijal_cursor;
			deallocate materijal_cursor;
			fetch next from sredstvo_cursor into @nazivSredstva;
			set @rbr = @rbr + 1;
		end
		close sredstvo_cursor;
		deallocate sredstvo_cursor;
	end
go

execute RadnaLista_Operacija 10



/*2. Procedura koja proverava kvalitet izvrsenja masine i zatim za svakih godinu dana od datuma kupovine umanjuje kvalitet za 0.01*/
drop proc if exists KvalitetMasine;

go
create proc KvalitetMasine
	@masinaID as nvarchar(50)
as 
begin
	declare @nazivSredstva as nvarchar(50)
	set @nazivSredstva = (select Naziv_sredstva from Sredstvo_za_rad s
						  left join Masina m on m.ID_sredstva = s.ID_sredstva
						  where ID_masine = @masinaID)
	declare @nazivMasine as nvarchar(50)
	set @nazivMasine = (select Naziv_masine from Masina 
						where ID_masine = @masinaID)
	declare @datumKupovine as date
	set @datumKupovine = (select Datum_kupovine from Masina
						  where ID_masine = @masinaID)
	declare @kvalitetIzvrsenja as int
	set @kvalitetIzvrsenja = (select Kvalitet_izvrsenja from Masina
							  where ID_masine = @masinaID)
	declare @brojGodinaRazlike as int 
	set @brojGodinaRazlike = datediff(year,@datumKupovine,getdate())
	declare @umanjenaVrednost as float
	set @umanjenaVrednost = @kvalitetIzvrsenja - @brojGodinaRazlike*0.01

	print @nazivSredstva + ' ' + @nazivMasine + ' ciji je kvalitet izvrsenja ' + cast(@kvalitetIzvrsenja as nvarchar(2)) + ' kupljena je ' + cast(@datumKupovine as nvarchar(20)) + ' i kvalitet izvrsenja je promenjen na ' + cast(@umanjenaVrednost as nvarchar(10))

	update Masina
	set Kvalitet_izvrsenja = @umanjenaVrednost
	where ID_masine = @masinaID;
end
go

execute KvalitetMasine 3

select * from Masina
where ID_masine = 3
