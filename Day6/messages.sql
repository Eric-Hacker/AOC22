WITH ds AS (SELECT
    b.idx,
    b.d
FROM csv.day6 as c, 
    regexp_split_to_table(c.datastream, '\s*') WITH ORDINALITY AS b(d, idx)
ORDER BY b.idx)
SELECT 
    MIN(ds1.idx) + 13 as message_marker
FROM
    ds as ds1
    JOIN ds as ds2 ON ds1.idx + 1 = ds2.idx
    JOIN ds as ds3 ON ds1.idx + 2 = ds3.idx
    JOIN ds as ds4 ON ds1.idx + 3 = ds4.idx
    JOIN ds as ds5 ON ds1.idx + 4 = ds5.idx
    JOIN ds as ds6 ON ds1.idx + 5 = ds6.idx
    JOIN ds as ds7 ON ds1.idx + 6 = ds7.idx
    JOIN ds as ds8 ON ds1.idx + 7 = ds8.idx
    JOIN ds as ds9 ON ds1.idx + 8 = ds9.idx
    JOIN ds as dsA ON ds1.idx + 9 = dsA.idx
    JOIN ds as dsB ON ds1.idx + 10 = dsB.idx
    JOIN ds as dsC ON ds1.idx + 11 = dsC.idx
    JOIN ds as dsD ON ds1.idx + 12 = dsD.idx
    JOIN ds as dsE ON ds1.idx + 13 = dsE.idx

WHERE
    ds1.d <> ds2.d AND ds1.d <> ds3.d AND ds1.d <> ds4.d AND ds1.d <> ds5.d AND ds1.d <> ds6.d AND ds1.d <> ds7.d AND
        ds1.d <> ds8.d AND ds1.d <> ds9.d AND ds1.d <> dsA.d AND ds1.d <> dsB.d AND ds1.d <> dsC.d AND ds1.d <> dsD.d AND ds1.d <> dsE.d AND
    ds2.d <> ds3.d AND ds2.d <> ds4.d AND ds2.d <> ds5.d AND ds2.d <> ds6.d AND ds2.d <> ds7.d AND
        ds2.d <> ds8.d AND ds2.d <> ds9.d AND ds2.d <> dsA.d AND ds2.d <> dsB.d AND ds2.d <> dsC.d AND ds2.d <> dsD.d AND ds2.d <> dsE.d AND
    ds3.d <> ds4.d AND ds3.d <> ds5.d AND ds3.d <> ds6.d AND ds3.d <> ds7.d AND
        ds3.d <> ds8.d AND ds3.d <> ds9.d AND ds3.d <> dsA.d AND ds3.d <> dsB.d AND ds3.d <> dsC.d AND ds3.d <> dsD.d AND ds3.d <> dsE.d AND
    ds4.d <> ds5.d AND ds4.d <> ds6.d AND ds4.d <> ds7.d AND
        ds4.d <> ds8.d AND ds4.d <> ds9.d AND ds4.d <> dsA.d AND ds4.d <> dsB.d AND ds4.d <> dsC.d AND ds4.d <> dsD.d AND ds4.d <> dsE.d AND
    ds5.d <> ds6.d AND ds5.d <> ds7.d AND
        ds5.d <> ds8.d AND ds5.d <> ds9.d AND ds5.d <> dsA.d AND ds5.d <> dsB.d AND ds5.d <> dsC.d AND ds5.d <> dsD.d AND ds5.d <> dsE.d AND
    ds6.d <> ds7.d AND
        ds6.d <> ds8.d AND ds6.d <> ds9.d AND ds6.d <> dsA.d AND ds6.d <> dsB.d AND ds6.d <> dsC.d AND ds6.d <> dsD.d AND ds6.d <> dsE.d AND
    ds7.d <> ds8.d AND ds7.d <> ds9.d AND ds7.d <> dsA.d AND ds7.d <> dsB.d AND ds7.d <> dsC.d AND ds7.d <> dsD.d AND ds7.d <> dsE.d AND
    ds8.d <> ds9.d AND ds8.d <> dsA.d AND ds8.d <> dsB.d AND ds8.d <> dsC.d AND ds8.d <> dsD.d AND ds8.d <> dsE.d AND
    ds9.d <> dsA.d AND ds9.d <> dsB.d AND ds9.d <> dsC.d AND ds9.d <> dsD.d AND ds9.d <> dsE.d AND
    dsA.d <> dsB.d AND dsA.d <> dsC.d AND dsA.d <> dsD.d AND dsA.d <> dsE.d AND
    dsB.d <> dsC.d AND dsB.d <> dsD.d AND dsB.d <> dsE.d AND
    dsC.d <> dsD.d AND dsC.d <> dsE.d AND
    dsD.d <> dsE.d