


CREATE OR REPLACE PROCEDURE
MERGE CLONE DB05.calendas.Issues NO_AUDIT
select 
	$'id_{Issues.IdIssue}'  								#IssueId,
	$'{Repositorios.Repositorio}#{IssueNumber}'				SourceKey,
	Calendars.CalendasId									CalendasId,
	'github' 												[Source], -- Creo que ya no se usa
	Issues.NumeroIssue										IssueNumber,
	Issues.Issue											Title,
	Issues.Url												Url,
	Issues.FechaCreacionIssue								CreationDate,
	Issues.FechaCierre										ClosedDate
--	coalesce(Usuarios.Usuario,Issues.UsuarioCreador)		Author,
--	Issues.					Description,
from dwh.Issues
inner join dwh.Repositorios using IdRepositorio
inner join DB05.calendas.Calendars using Repositorios(Propietario GithubOwner, NombreRepositorio RepositoryName)
left join dwh.Usuarios using (UsuarioCreador GithubUser)
