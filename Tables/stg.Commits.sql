

CREATE OR REPLACE TABLE stg.Commits
select 
	RepositoryOwner	RepositoryOwner	varchar(50)  PRIMARY KEY,
	RepositoryName	RepositoryName varchar(50)  PRIMARY KEY,
	Sha				Sha varchar(100) PRIMARY KEY,
	Author,
	Email,
	[Date],
	Tree,
	Message,
	Hashtags,
	Parents
from Github$Commits(
	UseMirror=YES,
	DATA=(
		select RepositoryName,RepositoryOwner 
		from stg.Repositories
		semi join (
			select RepositoryName,RepositoryOwner
			from stg.RepositoryTopics
			where Topic='commits'		
		) using (RepositoryName,RepositoryOwner)
	)
) materialize into stg.tmp_Commits Commits



