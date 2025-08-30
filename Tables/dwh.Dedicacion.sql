
CREATE OR REPLACE PROCEDURE
MERGE CLONE dwh.Dedicacion(IdDedicacion)
select 
	DedicationType			#TipoDedicacion,
	Id						#CodigoDedicacion,
	IdRepositorio			IdRepositorio NOT NULL nonunique REFERENCES dwh.Repositorios,
	Fecha					Fecha NOT NULL NONUNIQUE REFERENCES dwh.Fechas,
	IdUsuario				IdUsuario NULL NONUNIQUE REFERENCES dwh.Usuarios,
	Autor					Autor varchar(50) NOT NULL,
	Email 					Email varchar(50),
	Url						Url,
	Mensaje					Mensaje
COMBINE 
comments (
	select 
		'Comment'							#DedicationType,
		comentarios.IdComentario			#Id varchar(50),
		Repositorios.IdRepositorio			IdRepositorio,
		Comentarios.IdUsuario				IdUsuario,
		Comentarios.Fecha					Fecha,
		Comentarios.Url						Url,
		Comentarios.Autor,
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
		commits.IdUsuario				IdUsuario,
		Commits.Fecha					Fecha,
		Commits.Email 					Email,
		Commits.Url						Url,
		Commits.Autor					Autor,
		Commits.Mensaje					Mensaje
	from dwh.Commits
	inner join dwh.Repositorios using Commits(IdRepositorio)
	check snowflake
)




