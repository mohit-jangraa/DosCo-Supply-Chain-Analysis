
-- ============================================================
-- Supply Chain Analytics Project
-- PostgreSQL Business Analysis Queries
-- ============================================================

-- Q1. Top 10 Revenue-Generating Customers
SELECT
    "Customer Id",
    ROUND(SUM("Sales")::numeric,2) AS Total_Revenue
FROM supply_chain
GROUP BY "Customer Id"
ORDER BY Total_Revenue DESC
LIMIT 10;

-- Q2. Most Profitable Product Categories
SELECT
    "Category Name",
    ROUND(SUM("Order Profit Per Order")::numeric,2) AS Total_Profit
FROM supply_chain
GROUP BY "Category Name"
ORDER BY Total_Profit DESC;

-- Q3. Monthly Revenue Trend
SELECT
    "Order Year",
    "Order Month",
    ROUND(SUM("Sales")::numeric,2) AS Revenue
FROM supply_chain
GROUP BY "Order Year","Order Month"
ORDER BY "Order Year","Order Month";

-- Q4. Average Shipping Time by Shipping Mode
SELECT
    "Shipping Mode",
    ROUND(AVG("Days for shipping (real)")::numeric,2) AS Avg_Shipping_Time
FROM supply_chain
GROUP BY "Shipping Mode"
ORDER BY Avg_Shipping_Time;

-- Q5. Overall Late Delivery Percentage
SELECT
ROUND(
(
SUM(CASE WHEN "Late_delivery_risk"=1 THEN 1 ELSE 0 END)::numeric
/
COUNT(*)
)*100,2
) AS Late_Delivery_Percentage
FROM supply_chain;

-- Q6. Profit by Market
SELECT
    "Market",
    ROUND(SUM("Order Profit Per Order")::numeric,2) AS Profit
FROM supply_chain
GROUP BY "Market"
ORDER BY Profit DESC;

-- Q7. Top 10 Selling Products
SELECT
    "Product Name",
    ROUND(SUM("Sales")::numeric,2) AS Revenue
FROM supply_chain
GROUP BY "Product Name"
ORDER BY Revenue DESC
LIMIT 10;

-- Q8. Average Discount by Category
SELECT
    "Category Name",
    ROUND(AVG("Order Item Discount")::numeric,2) AS Avg_Discount
FROM supply_chain
GROUP BY "Category Name"
ORDER BY Avg_Discount DESC;

-- Q9. Profit Margin by Market
SELECT
    "Market",
    ROUND(
        AVG(("Order Profit Per Order"/NULLIF("Sales",0))*100)::numeric,
        2
    ) AS Profit_Margin
FROM supply_chain
GROUP BY "Market"
ORDER BY Profit_Margin DESC;

-- Q10. Top Countries by Revenue
SELECT
    "Order Country",
    ROUND(SUM("Sales")::numeric,2) AS Revenue
FROM supply_chain
GROUP BY "Order Country"
ORDER BY Revenue DESC
LIMIT 10;

-- Q11. Shipping Delay by Shipping Mode
SELECT
    "Shipping Mode",
    ROUND(AVG("Shipping Delay")::numeric,2) AS Avg_Delay
FROM supply_chain
GROUP BY "Shipping Mode"
ORDER BY Avg_Delay;

-- Q12. Top Customers by Profit
SELECT
    "Customer Id",
    ROUND(SUM("Order Profit Per Order")::numeric,2) AS Profit
FROM supply_chain
GROUP BY "Customer Id"
ORDER BY Profit DESC
LIMIT 10;

-- Q13. Revenue by Customer Segment
SELECT
    "Customer Segment",
    ROUND(SUM("Sales")::numeric,2) AS Revenue
FROM supply_chain
GROUP BY "Customer Segment"
ORDER BY Revenue DESC;

-- Q14. Average Order Value
SELECT
    ROUND(AVG("Sales")::numeric,2) AS Average_Order_Value
FROM supply_chain;

-- Q15. Shipping Delay by Market
SELECT
    "Market",
    ROUND(AVG("Shipping Delay")::numeric,2) AS Avg_Delay
FROM supply_chain
GROUP BY "Market"
ORDER BY Avg_Delay DESC;

-- TODO (Advanced)
-- Q16. Rank products by revenue (DENSE_RANK)
SELECT
    "Product Name",
    ROUND(SUM("Sales")::numeric,2) AS Revenue,
    DENSE_RANK() OVER (
        ORDER BY SUM("Sales") DESC
    ) AS Revenue_Rank
FROM supply_chain
GROUP BY "Product Name"
ORDER BY Revenue_Rank;

-- Q17. Top 3 products in every category
WITH ProductSales AS
(
    SELECT
        "Category Name",
        "Product Name",
        ROUND(SUM("Sales")::numeric,2) AS Revenue,
        DENSE_RANK() OVER
        (
            PARTITION BY "Category Name"
            ORDER BY SUM("Sales") DESC
        ) AS Rank_No
    FROM supply_chain
    GROUP BY "Category Name","Product Name"
)

SELECT *
FROM ProductSales
WHERE Rank_No <= 3
ORDER BY "Category Name", Rank_No;

-- Q18. Running monthly revenue
WITH MonthlySales AS
(
    SELECT
        "Order Year",
        "Order Month",
        SUM("Sales") AS Revenue
    FROM supply_chain
    GROUP BY "Order Year","Order Month"
)

SELECT
    "Order Year",
    "Order Month",
    Revenue,
    SUM(Revenue) OVER
    (
        ORDER BY "Order Year","Order Month"
    ) AS Running_Revenue
FROM MonthlySales;

-- Q19. Pareto Analysis (80/20)
WITH CustomerRevenue AS
(
SELECT
    "Customer Id",
    SUM("Sales") AS Revenue
FROM supply_chain
GROUP BY "Customer Id"
),

Pareto AS
(
SELECT *,
SUM(Revenue) OVER(ORDER BY Revenue DESC) AS Running_Revenue,
SUM(Revenue) OVER() AS Total_Revenue
FROM CustomerRevenue
)

SELECT
    "Customer Id",
    Revenue,
    ROUND((Running_Revenue/Total_Revenue*100)::numeric,2) AS Revenue_Percentage
FROM Pareto
ORDER BY Revenue DESC;

-- Q20. Customer Lifetime Value (CLV)
SELECT
    "Customer Id",
    COUNT(DISTINCT "Order Id") AS Total_Orders,
    ROUND(SUM("Sales")::numeric,2) AS Lifetime_Revenue,
    ROUND(SUM("Order Profit Per Order")::numeric,2) AS Lifetime_Profit
FROM supply_chain
GROUP BY "Customer Id"
ORDER BY Lifetime_Revenue DESC;

-- Q21. ABC Inventory Analysis
WITH ProductRevenue AS
(
SELECT
    "Product Name",
    SUM("Sales") AS Revenue
FROM supply_chain
GROUP BY "Product Name"
),

ABC AS
(
SELECT *,
SUM(Revenue) OVER(ORDER BY Revenue DESC) AS RunningRevenue,
SUM(Revenue) OVER() AS TotalRevenue
FROM ProductRevenue
)

SELECT
    "Product Name",
    Revenue,
    ROUND((RunningRevenue/TotalRevenue*100)::numeric,2) AS Cumulative_Percentage,

CASE
WHEN RunningRevenue/TotalRevenue <= 0.80 THEN 'A'
WHEN RunningRevenue/TotalRevenue <= 0.95 THEN 'B'
ELSE 'C'
END AS Inventory_Class

FROM ABC
ORDER BY Revenue DESC;

-- Q22. Loss-making products
SELECT
    "Product Name",
    ROUND(SUM("Order Profit Per Order")::numeric,2) AS Total_Profit
FROM supply_chain
GROUP BY "Product Name"
HAVING SUM("Order Profit Per Order") < 0
ORDER BY Total_Profit;

-- Q23. Best market by profit margin
SELECT
    "Market",
    ROUND(
    AVG(
    ("Order Profit Per Order"/NULLIF("Sales",0))*100
    )::numeric,2) AS Profit_Margin
FROM supply_chain
GROUP BY "Market"
ORDER BY Profit_Margin DESC;

-- Q24. Shipping delay root cause analysis
SELECT
    "Shipping Mode",
    "Market",

    COUNT(*) AS Total_Orders,

    ROUND(
    AVG("Shipping Delay")::numeric,
    2
    ) AS Avg_Delay,

    SUM(
    CASE
    WHEN "Shipping Delay">0
    THEN 1
    ELSE 0
    END
    ) AS Delayed_Orders

FROM supply_chain

GROUP BY
"Shipping Mode",
"Market"

ORDER BY Avg_Delay DESC;

-- Q25. Executive KPI report  
SELECT

COUNT(DISTINCT "Order Id") AS Total_Orders,

COUNT(DISTINCT "Customer Id") AS Total_Customers,

ROUND(SUM("Sales")::numeric,2) AS Total_Revenue,

ROUND(SUM("Order Profit Per Order")::numeric,2) AS Total_Profit,

ROUND(AVG("Sales")::numeric,2) AS Average_Order_Value,

ROUND(AVG("Days for shipping (real)")::numeric,2) AS Average_Shipping_Time,

ROUND(
(
SUM(CASE
WHEN "Late_delivery_risk"=1
THEN 1
ELSE 0
END)::numeric
/
COUNT(*)
)*100,
2
) AS Late_Delivery_Percentage

FROM supply_chain;
