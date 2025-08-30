
CREATE OR REPLACE PROCEDURE 
MERGE CLONE dwh.Usuarios(IdUsuario)
select 
	GithubUser		#GithubUser	varchar(20),
	Nombre			Usuario		varchar(20)
from stg.GithubUsers