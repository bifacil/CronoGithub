

CREATE OR REPLACE TABLE stg.RepositoryTopics
select 
	RepositoryOwner 		#RepositoryOwner varchar(50) PRIMARY KEY,
	RepositoryName			#RepositoryName varchar(50) PRIMARY KEY,
	Topic					#Topic varchar(50) PRIMARY KEY
from github$RepositoryTopics