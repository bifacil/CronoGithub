

-- Esta consulta tiene la misma estructura que la de Calendas.Dedication (WIP)

select 
	Comentarios.CodigoComentario 		DedicationId,
	Comentarios.Fecha					Date,
	'Comment'							DedicationType,
	Comentarios.Url						Url,
	Repositorios.Repositorio			RepositoryFullname,
	Issues.Issue						Message
from dwh.Comentarios
inner join dwh.Issues using IdIssue
inner join dwh.Repositorios using Issues(IdRepositorio)
check snowflake