with elves2 as (
    SELECT
        CAST(e.line as INT) as line,
        CAST(e.elf1 as INT) as elf 
    FROM csv.elves1 as e
    order by elf
    ),
elves_range as (
    SELECT
        e1.elf - 1 as elf,
        e1.line - 1 as highline,
        case when e2.line is null then 0 
        else e2.line + 1 
        end as lowline
    FROM
        elves2 as e1
    LEFT OUTER JOIN  elves2 as e2 ON e1.elf = e2.elf+1  
    ),
cals as (
    SELECT
        CAST(c.line AS INT) as line,
        CAST(c.calories AS INT) as calories
    FROM csv.aoc1v3 as c 
    )
SELECT 
    e.elf as elf,
    SUM(cals.calories) as totalcal,
    RANK() OVER (ORDER BY SUM(cals.calories) DESC ) AS rank 
FROM elves_range as e,
    cals
WHERE 
    cals.line >= e.lowline and cals.line <= e.highline
GROUP BY elf   


