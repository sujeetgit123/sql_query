create table icc_world_cup
(
Team_1 Varchar(20),
Team_2 Varchar(20),
Winner Varchar(20)
);
INSERT INTO icc_world_cup values('India','SL','India');
INSERT INTO icc_world_cup values('SL','Aus','Aus');
INSERT INTO icc_world_cup values('SA','Eng','Eng');
INSERT INTO icc_world_cup values('Eng','NZ','NZ');
INSERT INTO icc_world_cup values('Aus','India','India');

select * from icc_world_cup;

-- solution

SELECT team_name, COUNT(team_name) as match_played, SUM(winner_flag) as match_won, (COUNT(team_name) - SUM(winner_flag)) as match_losses, SUM(winner_flag) * 2 as total_points
FROM
(SELECT icc_world_cup.Team_1 as team_name, IF(Team_1 = Winner, 1, 0) as winner_flag FROM `icc_world_cup`
UNION ALL
SELECT icc_world_cup.Team_2 as team_name, IF(Team_2 = Winner, 1, 0) as winner_flag FROM `icc_world_cup`) as teams GROUP by team_name ORDER by total_points desc;