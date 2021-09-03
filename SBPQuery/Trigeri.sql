/*1. Triger koji prilikom insert i update operacije u tabelu materijal obezbedjuje da rok trajanja ne moze biti datum pre danasnjeg*/
drop trigger if exists rok_materijala

go
create trigger rok_materijala
on Materijal
after insert, update
as
begin
	set nocount on;
	declare @noviRok as date


	if not exists(select * from deleted)
		begin
			set @noviRok = (select Rok_trajanja from inserted)
			if (@noviRok < getdate())
				begin
					raiserror('Insert! Rok trajanja ne moze da bude pre danasnjeg datuma!', 16, 0);
		            rollback transaction;
				end
		end
	else
		begin
			set @noviRok = (select Rok_trajanja from inserted)
			if (@noviRok < getdate())
				begin
					raiserror('Update! Rok trajanja ne moze da bude pre danasnjeg datuma!', 16, 0);
					rollback transaction;
				end
        end
	
end
go

insert into Materijal (Naziv_materijala, Opis_materijala, Rok_trajanja)
values ('Zlatna cev', 'Cev od zlata duzine 50 cm', '2020-04-04')


update Materijal
set Rok_trajanja = '2019-11-04'
where ID_materijala = 1

select * from Materijal where ID_materijala = 1


/*2. Triger koji  obezbedjuje da se kvalitet izvrsenja masine moze samo smanjivati*/
drop trigger if exists kvalitet_masine

go
create trigger kvalitet_masine
on Masina
after update
as
begin
	set nocount on;
	declare @noviKvalitet as float
	set @noviKvalitet = (select Kvalitet_izvrsenja from inserted)
	declare @stariKvalitet as float
	set @stariKvalitet = (select Kvalitet_izvrsenja from deleted)

	if(@noviKvalitet > @stariKvalitet)
		begin
			raiserror('Kvalitet izvrsenja masine ne moze da se povecava', 16, 0);
			rollback transaction;
		end
end
go

select * from Masina where ID_masine = 1

update Masina 
set Kvalitet_izvrsenja = 10
where ID_masine = 1
