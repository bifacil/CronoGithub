

CREATE OR REPLACE TABLE stg.Comments
select 
	RepositoryOwner	RepositoryOwner	varchar(50) PRIMARY KEY,
	RepositoryName	RepositoryName varchar(50) PRIMARY KEY,
	IssueNumber		IssueNumber	int PRIMARY KEY,
	CommentId		CommentId decimal(10,0) PRIMARY KEY,
	IssueId,
	Author,
	[Date],
	CreationDate,
	UpdatedDate,
	Hashtags,
	Url
from Github$Comments(
	includebody=no,
	Data=(
		select  RepositoryOwner,RepositoryName,IssueNumber, 
		from stg.Issues
		where 
			comments<>0
			and state='open'
			and RepositoryName in ('CronoIncidencias','CronoCRM')
		order by issuenumber desc
	)
)

