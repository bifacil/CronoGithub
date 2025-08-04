


CREATE OR REPLACE PROCEDURE
MERGE CLONE dwh.Fechas
select 
	[date]						#Fecha PRIMARY KEY,
	[Year]						Año varchar(4),
	Quarter						Trimestre,
	MonthNumber					NumeroMes,
	[Month]						NombreMes,
	concat(NombreMes,' ',Año)	Mes
from Crono$Dates
where Año between 2019 and CURRENT_YEAR()