
CREATE OR REPLACE PROCEDURE
MERGE CLONE DB05.calendas.Dedication NO_AUDIT
select 
	TipoDedicacion				#DedicationType,
	CodigoDedicacion			#DedicationId,
	Calendars.CalendasID		CalendasID,
	Repositorios.Repositorio	RepositoryFullname,
	Fecha						Date,
	Autor						UserName,
	Dedicacion.Url				Url,
	Mensaje						Message
from dwh.Dedicacion
inner join dwh.Repositorios using IdRepositorio
inner join DB05.calendas.Calendars using Repositorios(Propietario GithubOwner,NombreRepositorio RepositoryName)
where
	Dedicacion.Mensaje not starts with '(Calendas)'
	
