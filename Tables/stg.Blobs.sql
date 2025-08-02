CREATE OR REPLACE TABLE stg.Blobs
select 
	RepositoryOwner		RepositoryOwner varchar(50)  PRIMARY KEY,
	RepositoryName		RepositoryName varchar(50)  PRIMARY KEY,
	Blob				Blob varchar(100)  PRIMARY KEY,
	Size,
	LastCommit,
	LastCommitDate,
	LastName,
	LastPath
from Github$Blobs(
	UseMirror=YES,
	[Limit]=8000,
	DATA=(
		select RepositoryName,RepositoryOwner 
		from stg.Repositories
		where repositoryName='CronoETL'
	)
) materialize into stg.tmp_Blobs Blobs

