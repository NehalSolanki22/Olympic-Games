
-- Olympic Games 

--(1) Althletes Result Table

select 
  top 1000 ID, 
  [Name], 
  Sex, 
  Age, 
  Height, 
  [Weight], 
  Games, 
  City, 
  Sport, 
  [Event], 
  Medal, 
  NOC 
from 
  athletes_event_results


--(2) Team Info Table

select * from team_info



--(3) Tranformed Table

select 
  ID, 
  [Name] as [Competitor Name],  --Renamed Column
  case when sex = 'M' then 'Male' else 'Female' end as Sex, --Better name for filters and visualization
  Age, 
  case when Age < 18 then 'Under Age' 
  when Age between 18 and 25 then '18-25' 
  when Age between 25 and 30 then '25-30' 
  when Age > 30 then 'Over 30' end as [Age Grouping], 
  Height, 
  [Weight], 
  NOC as [Nation Code], 
  --Explained Abbreviation
  --CHARINDEX(' ',Games)-1 as [Example 1],
  --CHARINDEX(' ',reverse(Games))-1 as [Example 2],
  LEFT(Games, CHARINDEX(' ', Games)-1) as [Year], 
  --Split Column to isolate Year based on space
  --right(Games,CHARINDEX(' ',reverse(Games))-1)  as [Season], --Split Column to isolate season based on space
  --City, commented out as it is not necessary for the analysis
  --Games,
  Sport, 
  [Event], 
  case when Medal = 'NA' then 'Not Registered' else Medal end as [Medal] --Replaced NA with not registered
from 
  athletes_event_results 
where 
  right(Games, CHARINDEX(' ', reverse(Games))-1) = 'Summer' --Where Clause to isolate summer season