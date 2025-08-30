CREATE OR REPLACE VIEW stg.Emails
select 
	Email,
	GithubUser
from crono$csv('/csv/emails.csv')