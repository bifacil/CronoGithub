
CREATE OR REPLACE PROCEDURE
MERGE CLONE dwh.Repositorios(IdRepositorio)
select 
	RepositoryOwner							#Propietario,
	RepositoryName							#NombreRepositorio,		
	FullName								Repositorio,
	DefaultBranch							RamaPrincipal,
	if(Private=1,'Privado','Publico')		EsPrivado,
	Size/1024								Mb,
	HasIssues								TieneIssues,
	HasDiscussions							Tienediscussions,
	HtmlUrl									Url,			
	CreatedAt								FechaCreacion,
	UpdatedAt								FechaActualizacion
from stg.Repositories