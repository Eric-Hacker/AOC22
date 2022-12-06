nl -b a -s "," -n ln  day2.txt > day2.csv
echo -e "linenum,game\n$(cat day2.csv)" > day2.csv
steampipe query "WITH results AS ( SELECT
    CASE 
        WHEN g.game = 'A X' then 4
        WHEN g.game = 'A Y' then 8
        WHEN g.game = 'A Z' then 3
        WHEN g.game = 'B X' then 1
        WHEN g.game = 'B Y' then 5
        WHEN g.game = 'B Z' then 9
        WHEN g.game = 'C X' then 7
        WHEN g.game = 'C Y' then 2
        WHEN g.game = 'C Z' then 6
    END AS result 
    FROM csv.day2 as g)
SELECT 
    SUM (result)
    FROM results"
steampipe query "WITH results AS ( SELECT
    CASE 
        WHEN g.game = 'A X' then 3
        WHEN g.game = 'A Y' then 4
        WHEN g.game = 'A Z' then 8
        WHEN g.game = 'B X' then 1
        WHEN g.game = 'B Y' then 5
        WHEN g.game = 'B Z' then 9
        WHEN g.game = 'C X' then 2
        WHEN g.game = 'C Y' then 6
        WHEN g.game = 'C Z' then 7
    END AS result 
    FROM csv.day2 as g)
SELECT 
    SUM (result)
    FROM results"

