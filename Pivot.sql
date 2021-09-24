---- Creating Table

CREATE TABLE tblProductSales
    ([SalesAgent] varchar(50), [SalesCountry] varchar(50), [SalesAmount] int);

INSERT INTO tblProductSales ([SalesAgent], [SalesCountry], [SalesAmount])
VALUES    ('Tom', 'UK', '200');
INSERT INTO tblProductSales ([SalesAgent], [SalesCountry], [SalesAmount])
VALUES ('John', 'US', '180');
INSERT INTO tblProductSales ([SalesAgent], [SalesCountry], [SalesAmount])
VALUES ('John', 'UK', '260');
INSERT INTO tblProductSales ([SalesAgent], [SalesCountry], [SalesAmount])
VALUES ('David', 'India', '450');
INSERT INTO tblProductSales ([SalesAgent], [SalesCountry], [SalesAmount])
VALUES ('Tom', 'India', '350');
INSERT INTO tblProductSales ([SalesAgent], [SalesCountry], [SalesAmount])
VALUES ('David', 'US', '200');
INSERT INTO tblProductSales ([SalesAgent], [SalesCountry], [SalesAmount])
VALUES ('Tom', 'US', '130');
INSERT INTO tblProductSales ([SalesAgent], [SalesCountry], [SalesAmount])
VALUES ('John', 'India', '540');
INSERT INTO tblProductSales ([SalesAgent], [SalesCountry], [SalesAmount])
VALUES ('John', 'UK', '120');
INSERT INTO tblProductSales ([SalesAgent], [SalesCountry], [SalesAmount])
VALUES ('David', 'UK', '220');
INSERT INTO tblProductSales ([SalesAgent], [SalesCountry], [SalesAmount])
VALUES ('John', 'UK', '420');
INSERT INTO tblProductSales ([SalesAgent], [SalesCountry], [SalesAmount])
VALUES ('David', 'US', '320');
INSERT INTO tblProductSales ([SalesAgent], [SalesCountry], [SalesAmount])
VALUES ('Tom', 'US', '340');
INSERT INTO tblProductSales ([SalesAgent], [SalesCountry], [SalesAmount])
VALUES ('Tom', 'UK', '660');
INSERT INTO tblProductSales ([SalesAgent], [SalesCountry], [SalesAmount])
VALUES ('John', 'India', '430');
INSERT INTO tblProductSales ([SalesAgent], [SalesCountry], [SalesAmount])
VALUES ('David', 'India', '230');
INSERT INTO tblProductSales ([SalesAgent], [SalesCountry], [SalesAmount])
VALUES ('David', 'India', '280');
INSERT INTO tblProductSales ([SalesAgent], [SalesCountry], [SalesAmount])
VALUES ('Tom', 'UK', '480');
INSERT INTO tblProductSales ([SalesAgent], [SalesCountry], [SalesAmount])
VALUES ('John', 'US', '360');
INSERT INTO tblProductSales ([SalesAgent], [SalesCountry], [SalesAmount])
VALUES ('David', 'UK', '340');






----Group By SalesAgent, SalesCountry

SELECT salesagent, salescountry, sum(salesamount)
FROM  tblProductSales
group by salesagent, salescountry


---- Pivot
SELECT salesagent, India, US, UK FROM  tblProductSales
Pivot (sum(SalesAmount) for SalesCountry in ([India], [US], [UK]))
as PivotTable
