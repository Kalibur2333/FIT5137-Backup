
WITH QuartileMedianCTE AS (
  SELECT
    saleprice,
    PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY saleprice) OVER() AS Q1,
    MEDIAN(saleprice) OVER () AS Median,
    PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY saleprice) OVER() AS Q3
  FROM
    cashierdetail
)

SELECT
  MAX(Q3) AS Q3,
  MAX(Median) AS Median,
  MAX(Q1) AS Q1
FROM
  QuartileMedianCTE;
  
select avg(discountrupiah/saleprice)
from cashierdetail
where saleprice >= (315000 + (315000-135000)*1.5);

select avg(discountrupiah/saleprice)
from cashierdetail
where saleprice < (315000 + (315000-135000)*1.5)
and saleprice >= 150000;

select avg(discountrupiah/saleprice)
from cashierdetail
where saleprice < 150000
and saleprice >= 135000;

select avg(discountrupiah/saleprice)
from cashierdetail
where saleprice < 135000
and saleprice >= (135000-(315000-135000)*1.5);