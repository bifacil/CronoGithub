
CREATE OR REPLACE TABLE stg.Repositories
select 
	RepositoryOwner 	RepositoryOwner varchar(50) PRIMARY KEY,
	RepositoryName 		RepositoryName varchar(50) PRIMARY KEY,
	DefaultBranch,
	FullName,
	Private,
	Archived,
	Size,
	HasIssues 			HasIssues bit,
	HasWiki				HasWiki bit,
	HasDiscussions 		HasDiscussions bit,
	HasPages			HasPages bit,
	OpenIssuesCount,
	HtmlUrl,
	Url,
	Language,
	Homepage,
	CreatedAt,
	UpdatedAt
from Github$Repositories
