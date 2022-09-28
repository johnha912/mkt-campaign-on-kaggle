ALTER VIEW mkt_campaign as 

with a as (
SELECT
    *,
    (2022 - Year_Birth) as Age_Range
FROM [dbo].[mkt_campaign]
)

SELECT
    *,
    
-- categorize age group
    CASE
        WHEN Age_Range in (25,26,27,28,29,30,31,32,33,34) THEN '25-34'
        WHEN Age_Range in (35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54) THEN '35-54'
        ELSE '55 and above'
    END AS Age_Define,
    
-- using windows funtion to distributes income into 5 groups
    NTILE(5) OVER(ORDER BY income DESC) as income_range,
    
-- then categorize them, same as age group above
    CASE 
        WHEN Income BETWEEN 0 and 30000 THEN '0 - 30000'
        WHEN Income BETWEEN 30001 and 60000 THEN '30001 - 60000'
        WHEN Income BETWEEN 60001 and 90000 THEN '60001 - 90000'
        WHEN Income BETWEEN 90001 and 120000 THEN '90001 - 120000'
        ELSE 'From 120001 and above'
    END AS income_range2,
    
-- calculate total amount spent each customer 
    ([MntWines]+[MntFruits]+[MntMeatProducts]+[MntFishProducts]+[MntSweetProducts]+[MntGoldProds]) as MntSpent,
    
-- calculate number of purchases
    ([NumWebPurchases]+[NumCatalogPurchases]+[NumStorePurchases]) as NumPurchases,
    
-- calculate dependency/minors home
    ([Kidhome]+[Teenhome]) as MinorsHome,

-- calculate total revenue/ monetary 
    (([NumWebPurchases]+[NumCatalogPurchases]+[NumStorePurchases]) * ([MntWines]+[MntFruits]+[MntMeatProducts]+[MntFishProducts]+[MntSweetProducts]+[MntGoldProds])) as Monetary
FROM a
