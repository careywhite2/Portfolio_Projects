-- CTE for team summaries with attendance calculations
WITH TeamSummariesAggregated AS (
    SELECT
        season,
        team,
        attend,
        attend_g,
        AVG(attend) OVER (PARTITION BY season) AS attendance_per_season,
        AVG(attend_g) OVER (PARTITION BY season) AS attendance_per_game
    FROM nba_data_files.`team summaries`
    WHERE season NOT IN (1999, 2012, 2020, 2021) AND season >= 1980
)

-- Advanced
SELECT season, player, ows, dws, obpm, dbpm
FROM nba_data_files.`advanced`
WHERE season NOT IN (1999, 2012, 2020, 2021) AND season >= 1980;

-- All Star Selections
SELECT player, season
FROM nba_data_files.`all star selections`
WHERE season NOT IN (1999, 2012, 2020, 2021) AND season >= 1980;

-- End of Season Teams
SELECT season, player, type, number_tm
FROM nba_data_files.`end of season teams`
WHERE season NOT IN (1999, 2012, 2020, 2021) AND season >= 1980;

-- NBA TV Ratings
SELECT *
FROM nba_data_files.`nba tv ratings`
WHERE season NOT IN (1999, 2012, 2020, 2021) AND season >= 1980;

-- Player Shooting
SELECT season, player, 
       percent_fga_from_x2p_range, percent_fga_from_x3p_range, 
       fg_percent_from_x2p_range, fg_percent_from_x3p_range, 
       percent_dunks_of_fga, num_of_dunks
FROM nba_data_files.`player shooting`
WHERE season NOT IN (1999, 2012, 2020, 2021) AND season >= 1980;

-- Team Stats Per Game
SELECT season, team, fg_per_game, fga_per_game, fg_percent, 
       x3p_per_game, x3pa_per_game, x3p_percent, x2p_per_game, 
       x2p_percent, ft_per_game, fta_per_game, ft_percent, 
       orb_per_game, drb_per_game, trb_per_game, ast_per_game, 
       stl_per_game, blk_per_game, tov_per_game, pf_per_game, pts_per_game
FROM nba_data_files.`team stats per game`
WHERE season NOT IN (1999, 2012, 2020, 2021) AND season >= 1980;

-- Team Summaries with attendance averages
SELECT season, team, attend, attend_g, attendance_per_season, attendance_per_game
FROM TeamSummariesAggregated;

-- Team Totals
SELECT season, team, fg, fga, x3p, x3pa, x2p, x2pa, ft, fta, 
       orb, drb, trb, ast, stl, blk, tov, pf, pts
FROM nba_data_files.`team totals`
WHERE season NOT IN (1999, 2012, 2020, 2021) AND season >= 1980;
