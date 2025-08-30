CREATE OR REPLACE VIEW stg.GithubUsers
select 
	GithubUser,
	Nombre
from crono$csv('/csv/githubUsers.csv')