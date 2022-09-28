ALTER VIEW mkt_campaign_D3 as 

with a as (
SELECT
    *,
    (2022 - Year_Birth) as Age_Range
FROM [dbo].[mkt_campaign]
)

SELECT
    *,
-- Dùng case when để nhóm độ tuổi
    CASE
        WHEN Age_Range in (25,26,27,28,29,30,31,32,33,34) THEN '25-34'
        WHEN Age_Range in (35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54) THEN '35-54'
        ELSE '55 and above'
    END AS Age_Define,
-- Dùng windows funtion ntile để chia nhóm thu nhập
    NTILE(5) OVER(ORDER BY income DESC) as income_range,
-- Sau đó dùng case when để chia nhóm thu nhập dễ đọc hơn
    CASE 
        WHEN Income BETWEEN 0 and 30000 THEN '0 - 30000'
        WHEN Income BETWEEN 30001 and 60000 THEN '30001 - 60000'
        WHEN Income BETWEEN 60001 and 90000 THEN '60001 - 90000'
        WHEN Income BETWEEN 90001 and 120000 THEN '90001 - 120000'
        ELSE 'From 120001 and above'
    END AS income_range2,
-- Tạo cột định danh KH chấp nhận mua khi bị tác động bởi campaign thứ mấy (code bị thiếu - cần check lại)    
    CASE 
        WHEN AcceptedCmp1 = 1 THEN '1'
        WHEN AcceptedCmp2 = 1 THEN '2'
        WHEN AcceptedCmp3 = 1 THEN '3'
        WHEN AcceptedCmp4 = 1 THEN '4'
        WHEN AcceptedCmp5 = 1 THEN '5'
        WHEN Response = 1 THEN 'Response'
        ELSE '0'
    END AS PrevCamAccepted,
-- Tính tổng chi (amount spents) từng khách hàng cho tất cả sản phẩm
    ([MntWines]+[MntFruits]+[MntMeatProducts]+[MntFishProducts]+[MntSweetProducts]+[MntGoldProds]) as MntSpent,
-- Tính tổng số lần mua của từng khách hàng qua các kênh mua 
    ([NumWebPurchases]+[NumCatalogPurchases]+[NumStorePurchases]) as NumPurchases,
-- Tính thành viên phụ thuộc trong gia đình, bao gồm kid và teen
    ([Kidhome]+[Teenhome]) as MinorsHome,
    (([NumWebPurchases]+[NumCatalogPurchases]+[NumStorePurchases]) * ([MntWines]+[MntFruits]+[MntMeatProducts]+[MntFishProducts]+[MntSweetProducts]+[MntGoldProds])) as Monetary
FROM a