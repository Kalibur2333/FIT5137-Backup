CREATE SCHEMA a5;
drop table authcate;

select * from a5.mlii0076;

WITH avgspeedt AS
(
    SELECT 
        st_distance(t1.wkb_geometry::geography, t2.wkb_geometry::geography) as distance, 
        extract(EPOCH from t2.time-t1.time) as time_betw
    FROM 
        a5.mlii0076 t1 
        JOIN a5.mlii0076 t2 on t1.ogc_fid + 1 = t2.ogc_fid
)
SELECT sum(distance) / sum(time_betw) AS avg_speed 
FROM avgspeedt;



CREATE TABLE a5.visual2 AS
SELECT 
    t1.ogc_fid,
    st_distance(t1.wkb_geometry::geography, t2.wkb_geometry::geography) AS distance_spot,
    extract(EPOCH from t2.time-t1.time) AS time_betw,
    CASE WHEN extract(EPOCH from t2.time-t1.time) = 0 THEN 0 ELSE 
        st_distance(t1.wkb_geometry::geography, t2.wkb_geometry::geography) / extract(EPOCH from t2.time-t1.time) 
    END AS instant_speed, -- instance speed in meters per second
    t1.wkb_geometry,
    t1.time
FROM
    a5.mlii0076 t1
JOIN 
    a5.mlii0076 t2 ON t1.ogc_fid = t2.ogc_fid - 1;
