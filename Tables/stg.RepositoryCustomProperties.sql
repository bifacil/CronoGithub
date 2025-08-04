
CREATE OR REPLACE TABLE stg.RepositoryCustomProperties
select 
	RepositoryOwner 		RepositoryOwner varchar(50) PRIMARY KEY,
	RepositoryName			RepositoryName varchar(50) PRIMARY KEY,
	PropertyName			PropertyName varchar(50) PRIMARY KEY,
	[Value]
from Github$RepositoryCustomProperties
