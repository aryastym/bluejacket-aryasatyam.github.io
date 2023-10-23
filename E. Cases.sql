
--1
SELECT ms.StaffID,StaffName, [TotalJacketSold] = SUM(SalesQuantity)
FROM MsStaff ms
JOIN SalesHeader sh
ON ms.StaffID = sh.StaffID
JOIN SalesDetail sd
ON sd.SalesID = sh.SalesID
JOIN MsCustomer mc
ON mc.CustomerID = sh.CustomerID
WHERE CustomerGender LIKE 'Male' AND DATENAME(MONTH,SalesDate) = 'February'
GROUP BY ms.StaffID,StaffName

--2
SELECT ms.StaffID, StaffName, VendorName,[Total Transaction] = COUNT(ph.PurchaseID)
FROM MsStaff ms
JOIN PurchaseHeader ph
ON ms.StaffID = ph.StaffID
JOIN MsVendor mv
ON ph.VendorID = mv.VendorID
WHERE StaffGender LIKE 'Female' AND DATENAME(WEEKDAY,PurchaseDate) = 'Monday'
GROUP BY ms.StaffID, VendorName, StaffName

--3
SELECT mv.VendorID, VendorName, VendorEmail, [TotalJacketPurchased] = SUM(PurchaseQuantity)
FROM MsVendor mv
JOIN PurchaseHeader ph
ON mv.VendorID = ph.VendorID
JOIN PurchaseDetail pd
ON pd.PurchaseID = ph.PurchaseID
WHERE DATENAME(WEEKDAY,PurchaseDate) = 'Tuesday' AND DATEDIFF(MONTH,PurchaseDate,GETDATE()) >=3
GROUP BY mv.VendorID, VendorName, VendorEmail

--4
SELECT ms.StaffID, StaffName, [TotalJacketSold] = SUM(SalesQuantity)
FROM MsStaff ms
JOIN SalesHeader sh
ON sh.StaffID = ms.StaffID
JOIN SalesDetail sd
ON sd.SalesID = sh.SalesID
WHERE DATEDIFF(MONTH, SalesDate, GETDATE())>=6
GROUP BY ms.StaffID, StaffName
HAVING COUNT(sh.SalesID)>=3

--5
SELECT [StaffName] = SUBSTRING(ms.StaffName,1,CHARINDEX(' ',ms.StaffName)), StaffSalary, VendorName, [Year] = YEAR(PurchaseDate)
FROM MsStaff ms
JOIN PurchaseHeader ph
ON ms.StaffID = ph.StaffID
JOIN MsVendor mv
ON mv.VendorID = ph.VendorID,
(SELECT [AvgSalary] = AVG(StaffSalary) FROM MsStaff)AS x
WHERE YEAR(PurchaseDate) = 2021 AND StaffSalary > x.AvgSalary

--6
SELECT StaffName, [StaffPhone] = STUFF(StaffPhone,1,1,'+62'), CustomerName, [SalesDate] = CONVERT (VARCHAR, SalesDate, 107)
FROM MsStaff ms
JOIN SalesHeader sh
ON ms.StaffID = sh.StaffID
JOIN MsCustomer mc
ON sh.CustomerID = mc.CustomerID
JOIN SalesDetail sd
ON sh.SalesID = sd.SalesID,
(SELECT [MinSalary] = MIN(StaffSalary) FROM MsStaff) AS x
WHERE DATENAME(MONTH,SalesDate) = 'May' AND StaffSalary = x.MinSalary

--7
SELECT CustomerName, [CustomerGender] = LEFT(CustomerGender,1) , CustomerAddress, [TotalSalesPrice] = CONCAT('Rp. ' , SUM(mj.SalesPrice * sd.SalesQuantity)) 
FROM MsCustomer mc
JOIN SalesHeader sh
ON sh.CustomerID = mc.CustomerID 
JOIN SalesDetail sd
ON sd.SalesID = sh.SalesID
JOIN MsJacket mj
ON mj.JacketID = sd.JacketID,
(SELECT [MaximumTotalJacketPurchase] = MAX(SalesQuantity) FROM SalesDetail)AS x
WHERE DATENAME(MONTH, SalesDate) NOT IN ('March') AND SalesQuantity = x.MaximumTotalJacketPurchase  
GROUP BY CustomerName, CustomerGender, CustomerAddress

--8
SELECT ph.PurchaseID, ph.PurchaseDate, ms.StaffID, [StaffName] = SUBSTRING(ms.StaffName,1,CHARINDEX(' ',ms.StaffName)), StaffEmail
FROM PurchaseHeader ph
JOIN MsStaff ms
ON ms.StaffID = ph.StaffID
JOIN PurchaseDetail pd
ON pd.PurchaseID = ph.PurchaseID,
(SELECT [MinJacketPurchased] = MIN(PurchaseQuantity) FROM PurchaseDetail) AS x
WHERE DATENAME(WEEKDAY,PurchaseDate) = 'Monday' AND PurchaseQuantity=x.MinJacketPurchased

--9
CREATE VIEW [JacketPurchase] AS
SELECT ph.PurchaseID,[PurchaseMonth] = DATENAME(MONTH,PurchaseDate) , [TotalJacketBrand] = COUNT(mjb.JacketBrandID), [TotalPurchasePrice] = SUM(PurchasePrice * PurchaseQuantity)
FROM PurchaseHeader ph
JOIN PurchaseDetail pd
ON ph.PurchaseID = pd.PurchaseID
JOIN MsJacket mj
ON mj.JacketID = pd.JacketID
JOIN MsJacketBrand mjb
ON mjb.JacketBrandID = mj.JacketBrandID
WHERE DATENAME(MONTH,PurchaseDate) = 'June'
GROUP BY ph.PurchaseID, PurchaseDate, mjb.JacketBrandID
HAVING SUM(PurchasePrice * PurchaseQuantity) > 5000000

--10
CREATE VIEW [JacketSales] AS
SELECT sh.SalesID, [SalesDate] = CONVERT (VARCHAR, SalesDate, 107), [TotalJacketType] = COUNT(mjt.JacketTypeID), [TotalSalesPrice] = 'Rp. ' + CONVERT(VARCHAR,SUM(SalesPrice * SalesQuantity))
FROM SalesHeader sh
JOIN SalesDetail sd
ON sh.SalesID = sd.SalesID
JOIN MsJacket mj
ON mj.JacketID = sd.JacketID
JOIN MsJacketType mjt
ON mjt.JacketTypeID = mj.JacketTypeID
WHERE DATENAME(MONTH,SalesDate) = 'July' 
GROUP BY sh.SalesID, SalesDate
EXCEPT
SELECT sh.SalesID, [SalesDate] = CONVERT (VARCHAR, SalesDate, 107), [TotalJacketType] = COUNT(mjt.JacketTypeID), [TotalSalesPrice] = 'Rp. ' + CONVERT(VARCHAR,SUM(SalesPrice * SalesQuantity))
FROM SalesHeader sh
JOIN SalesDetail sd
ON sh.SalesID = sd.SalesID
JOIN MsJacket mj
ON mj.JacketID = sd.JacketID
JOIN MsJacketType mjt
ON mjt.JacketTypeID = mj.JacketTypeID
WHERE DATENAME(DAY,SalesDate) LIKE 'Friday' 
GROUP BY sh.SalesID, SalesDate