
CREATE OR REPLACE TABLE stg.Issues
select 
	RepositoryOwner	RepositoryOwner	varchar(50) PRIMARY KEY,
	RepositoryName	RepositoryName varchar(50) PRIMARY KEY,
	IssueNumber		IssueNumber	int PRIMARY KEY,
	Id,
	Title,
	[User],
	Comments,
	Labels,
	CreatedAt,
	UpdatedAt,
	Locked,
	State,
	Url
from Github$Issues(
	DATA=(
		/* Se descargan los issues que se han modificado desde la última extracción*/
		select r.RepositoryName,r.RepositoryOwner,Since
		from stg.Repositories filter (HasIssues=YES) r
		left join (
			select Propietario RepositoryOwner, NombreRepositorio RepositoryName,date(max(FechaActualizacionIssue)) Since
			from dwh.Issues
		) using (RepositoryName,RepositoryOwner)
	)
)


