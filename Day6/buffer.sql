WITH ds AS (SELECT
    b.idx,
    b.d
FROM csv.day6 as c, 
    regexp_split_to_table(c.datastream, '\s*') WITH ORDINALITY AS b(d, idx)
ORDER BY b.idx)
SELECT 
    MIN(ds1.idx) + 3 as marker
FROM
    ds as ds1
    JOIN ds as ds2 ON ds1.idx + 1 = ds2.idx
    JOIN ds as ds3 ON ds1.idx + 2 = ds3.idx
    JOIN ds as ds4 ON ds1.idx + 3 = ds4.idx
WHERE
    ds1.d <> ds2.d AND ds1.d <> ds3.d AND ds1.d <> ds4.d AND ds2.d <> ds3.d AND ds2.d <> ds4.d AND ds3.d <> ds4.d

