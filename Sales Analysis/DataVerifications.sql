Use TimeIntelligenceDB
select * from DimCustomer
Select * from DimGeography
select * from DimProduct
Select * from FactSales

-- sales Related kpi
SELECT YEAR(OrderDate) as 'years', SUM(NetSales) as 'Total Sales' from FactSales
group by YEAR(OrderDate) 
order by years , [Total Sales] desc

-- Cost Related Kpi

SELECT YEAR(OrderDate) as 'years', SUM(TotalCost) as 'Total Cost' from FactSales
group by YEAR(OrderDate) 
order by years , [Total Cost] desc

-- Profit Related Kpi

SELECT YEAR(OrderDate) as 'years', SUM(Profit) as 'Total Profit' from FactSales
group by YEAR(OrderDate) 
order by years , [Total Profit] desc

-- Qunatity Related Kpi

SELECT YEAR(OrderDate) as 'years', SUM(Quantity) as 'Total Quuantity' from FactSales
group by YEAR(OrderDate) 
order by years , [Total Quuantity] desc

-- Sales TY and Sales LY by MonthName

SELECT 
    DATENAME(MONTH, OrderDate) AS MonthName,
    MONTH(OrderDate) AS MonthNumber,
    SUM(NetSales) AS [Total Sales]
FROM FactSales
WHERE YEAR(OrderDate) = 2024
GROUP BY 
    DATENAME(MONTH, OrderDate),
    MONTH(OrderDate)
ORDER BY 
    MonthNumber;

-- Avg sales Line
SELECT AVG(MonthSales) AS AvgSales
FROM
(
    SELECT 
        YEAR(OrderDate) AS SalesYear,
        MONTH(OrderDate) AS SalesMonth,
        SUM(NetSales) AS MonthSales
    FROM FactSales
    WHERE YEAR(OrderDate) = 2024
    GROUP BY YEAR(OrderDate), MONTH(OrderDate)
) A;

-- Sales TY and Sales LY by Quarter

SELECT 
    'Q' + CAST(DATEPART(QUARTER, OrderDate) AS VARCHAR) AS Quarter,
    SUM(NetSales) AS [Total Sales]
FROM FactSales
WHERE YEAR(OrderDate) = 2024
GROUP BY 
    DATEPART(QUARTER, OrderDate)
ORDER BY 
    DATEPART(QUARTER, OrderDate);

-- Total Sales and Total Profit by MonthName

select DATENAME(MONTH, OrderDate),sum(netsales) as 'Total Sales' , 
Sum(Profit) as 'Total Profit' , MONTH(OrderDate) AS MonthNumber
from FactSales
where YEAR(OrderDate)=2024
group by DATENAME(MONTH, OrderDate) ,MONTH(OrderDate)
order by MonthNumber asc

-- Profit By Segment
select DC.Segment,sum(FS.Profit) as 'Total Profit'
from FactSales FS
join DimCustomer DC
ON FS.CustomerID=DC.CustomerID
where YEAR(OrderDate)=2024
group by DC.Segment