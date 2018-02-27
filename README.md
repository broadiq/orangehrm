# orangehrm

if there are problems with internal errors after the application is running there might be an database issue.  Run the following command.
mysql > SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
