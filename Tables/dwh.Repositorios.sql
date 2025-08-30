
CREATE OR REPLACE PROCEDURE
MERGE CLONE dwh.Repositorios(IdRepositorio)
select 
	repo.RepositoryOwner								#Propietario,
	repo.RepositoryName									#NombreRepositorio,		
	repo.FullName										Repositorio,
	if(Clientes.FullName is not null,'Cliente')			EsCliente,
	repo.DefaultBranch									RamaPrincipal,
	if(repo.Private=1,'Privado','Publico')				EsPrivado,
	repo.Size/1024										Mb,
	repo.HasIssues										TieneIssues,
	repo.HasDiscussions									Tienediscussions,
	repo.HtmlUrl										Url,			
	repo.CreatedAt										FechaCreacion,
	repo.UpdatedAt										FechaActualizacion,
	if(RepositoryCustomProperties.Value='true')     	ReadCommits,
	Calendars.CalendasId								CalendasId
from stg.Repositories repo
left join stg.RepositoryCustomProperties filter (PropertyName='ReadCommits') using (RepositoryOwner, RepositoryName)
left join stg.Clientes using (FullName)
left join DB05.calendas.Calendars using (RepositoryOwner GithubOwner, RepositoryName)
check snowflake