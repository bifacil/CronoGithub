
CREATE OR REPLACE TABLE stg.Issues
select 
	RepositoryOwner	RepositoryOwner	varchar(50) PRIMARY KEY,
	RepositoryName	RepositoryName varchar(50) PRIMARY KEY,
	IssueNumber		IssueNumber	int PRIMARY KEY,
	Id,
	Title,
	[User],
	Comments,
	Labels,
	CreatedAt,
	UpdatedAt,
	Locked,
	State,
	Url
from Github$Issues(
--	[Limit]=50,
	DATA=(
		select RepositoryName,RepositoryOwner
		from stg.Repositories
		where HasIssues=YES 
	)
)

