
CREATE OR REPLACE PROCEDURE
MERGE UPSERT dwh.Comentarios(IdComentario)
select 
	comments.CommentId			#CodigoComentario,
	Issues.IdIssue				IdIssue NOT NULL NONUNIQUE REFERENCES dwh.Issues ON DELETE CASCADE,
	comments.Author				Autor,
	comments.[Date]				Fecha date NOT NULL NONUNIQUE REFERENCES dwh.Fechas,
	comments.CreationDate		FechaHoraCreacion,
	comments.UpdatedDate		FechaHoraActualizacion,
	comments.Url
from stg.Comments
inner join stg.Issues stg using (IssueId Id)
inner join dwh.Issues using stg(RepositoryOwner Propietario,RepositoryName NombreRepositorio,IssueNumber NumeroIssue)
CHECK SNOWFLAKE

