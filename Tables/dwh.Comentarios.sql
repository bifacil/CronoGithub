
CREATE OR REPLACE PROCEDURE
MERGE UPSERT dwh.Comentarios(IdComentario)
select 
	comments.CommentId								#CodigoComentario,
	Issues.IdIssue									IdIssue NOT NULL NONUNIQUE REFERENCES dwh.Issues ON DELETE CASCADE,
	Usuarios.IdUsuario								IdUsuario NULL NONUNIQUE REFERENCES dwh.Usuarios,
	coalesce(Usuarios.Usuario,comments.Author)		Autor varchar(50),
	comments.[Date]									Fecha date NOT NULL NONUNIQUE REFERENCES dwh.Fechas,
	comments.CreationDate							FechaHoraCreacion,
	comments.UpdatedDate							FechaHoraActualizacion,
	comments.Url
from stg.Comments 
inner join stg.Issues stg using (IssueId Id)
inner join dwh.Issues using stg(RepositoryOwner Propietario,RepositoryName NombreRepositorio,IssueNumber NumeroIssue)
left join dwh.Usuarios using (Author GithubUser)
CHECK SNOWFLAKE


UPDATE dwh.Comentarios NO_ALTER
select #CodigoComentario,Usuarios.IdUsuario
from dwh.Comentarios filter (IdUsuario is null)
inner join dwh.Usuarios using (Autor GithubUser)

