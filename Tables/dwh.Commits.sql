
CREATE OR REPLACE PROCEDURE
MERGE CLONE dwh.Commits(IdCommit)
select 
	Commits.Sha																#Sha,
	Repositorios.IdRepositorio												IdRepositorio int NOT NULL NONUNIQUE REFERENCES dwh.Repositorios,
	date(Commits.[Date])													Fecha date NOT NULL NONUNIQUE REFERENCES dwh.Fechas,
	Commits.Author															Autor,	
	Commits.Email															Email,
	$'https://github.com/{Repositorios.Repositorio}/commit/{Commits.Sha}' 	Url,
--	Commits.Tree,
	Commits.Message															Mensaje,
	Commits.Hashtags														Hashtags
from stg.Commits filter (year(date)>=2024)
inner join stg.Repositories using (RepositoryOwner,RepositoryName)
inner join dwh.Repositorios using Repositories(RepositoryOwner Propietario,RepositoryName NombreRepositorio)


