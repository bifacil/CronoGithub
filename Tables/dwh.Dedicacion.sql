
CREATE OR REPLACE PROCEDURE
MERGE CLONE dwh.Dedicacion(IdDedicacion)
select 
	DedicationType			#TipoDedicacion,
	Id						#CodigoDedicacion,
	IdRepositorio			IdRepositorio NOT NULL nonunique REFERENCES dwh.Repositorios,
	Fecha					Fecha NOT NULL NONUNIQUE REFERENCES dwh.Fechas,
	Url						Url,
	Mensaje					Mensaje
COMBINE 
comments (
	select 
		'Comment'							#DedicationType,
		comentarios.IdComentario			#Id varchar(50),
		Repositorios.IdRepositorio			IdRepositorio,
		Comentarios.Fecha					Fecha,
		Comentarios.Url						Url,
		Issues.Issue						Mensaje
	from dwh.Comentarios
	inner join dwh.Issues using IdIssue
	inner join dwh.Repositorios using Issues(IdRepositorio)
	check snowflake
),
commits (
	select 
		'Commit'						#DedicationType,
		left(Commits.sha,10)			#Id varchar(50),
		Repositorios.IdRepositorio		IdRepositorio,
		Commits.Fecha					Fecha,
		Commits.Url						Url,
		Commits.Mensaje					Mensaje
	from dwh.Commits
	inner join dwh.Repositorios using Commits(IdRepositorio)
	check snowflake
)




