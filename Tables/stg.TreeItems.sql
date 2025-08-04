
CREATE OR REPLACE TABLE stg.TreeItems
select 
	RepositoryOwner	RepositoryOwner varchar(50) PRIMARY KEY,
	RepositoryName	RepositoryName varchar(50) PRIMARY KEY,
	Sha				Sha varchar(100) PRIMARY KEY,
	Path			Path varchar(500) PRIMARY KEY,
	Blob			Blob varchar(100),
	Name,
	Size,
	Mode
from Github$TreeItems(
	UseMirror=YES,
	[Limit]=20000,
	DATA=(
		select top 1 over (partition by RepositoryOwner,RepositoryName order by date desc) RepositoryName,RepositoryOwner ,Sha,[date]
		from stg.Commits
		where repositoryName='CronoETL'
	)
) materialize into stg.tmp_TreeItems TreeItems



