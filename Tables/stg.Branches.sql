

CREATE OR REPLACE TABLE stg.Branches
select 
	RepositoryOwner	RepositoryOwner varchar(50) PRIMARY KEY,
	RepositoryName  RepositoryName varchar(50) PRIMARY KEY,
	Name 			BranchName varchar(50) PRIMARY KEY,
	[Commit],
	Protected
from Github$Branches(
	DATA=(
		select RepositoryName,RepositoryOwner
		from stg.Repositories
	)
)

