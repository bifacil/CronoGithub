
CREATE OR REPLACE PROCEDURE
MERGE UPSERT dwh.Issues(IdIssue)
select 
	issues.RepositoryOwner						#Propietario,
	issues.RepositoryName						#NombreRepositorio,
	issues.IssueNumber							#NumeroIssue,
	Repositorios.IdRepositorio					IdRepositorio int NOT NULL NONUNIQUE REFERENCES dwh.Repositorios,
	issues.Title								Issue,
	issues.[User]								UsuarioCreador varchar(50),
	issues.Comments								NumeroComentarios,
	issues.CreatedAt							FechaCreacionIssue,
	issues.UpdatedAt							FechaActualizacionIssue,
	if(EstaAbierto=NO,FechaActualizacionIssue)	FechaCierre,
	if(issues.Locked=1,'Bloqueado')				Bloqueado,
	if(issues.State='open')						EstaAbierto,
	issues.State								Estado,
	issues.Url									Url
from stg.Issues 
inner join stg.Repositories using (RepositoryOwner,RepositoryName)
inner join dwh.Repositorios using Repositories(RepositoryOwner Propietario,RepositoryName NombreRepositorio)
check snowflake