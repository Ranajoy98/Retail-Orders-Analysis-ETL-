-- Creating orders table

CREATE TABLE orders (
    order_id INT NOT NULL,
    order_date DATE NOT NULL,
    ship_mode VARCHAR(255),
    segment VARCHAR(255),
    country VARCHAR(255),
    city VARCHAR(255),
    state VARCHAR(255),
    postal_code INT,
    region VARCHAR(255),
    category VARCHAR(255),
    sub_category VARCHAR(255),
    product_id VARCHAR(255),
    cost_price INT,
    list_price INT,
    quantity INT,
    discount_percent INT,
    discount FLOAT,
    sale_price FLOAT,
    profit FLOAT,
    PRIMARY KEY (order_id)
);


select* from orders;

--Top 5 Categories by Total Profit
SELECT TOP 5
    category, 
    SUM(profit) AS total_profit
FROM 
    orders
GROUP BY 
    category
ORDER BY 
    total_profit DESC;


-- Region-Wise Revenue Breakdown

SELECT 
    region, 
    SUM(sale_price) AS total_revenue
FROM 
    orders
GROUP BY 
    region
ORDER BY 
    total_revenue DESC;

-- Most Profitable Sub-Categories

SELECT TOP 5
    sub_category, 
    SUM(profit) AS total_profit
FROM 
    orders
GROUP BY 
    sub_category
ORDER BY 
    total_profit DESC;

-- Average Discount Percent by Segment

SELECT 
    segment, 
    AVG(discount_percent) AS avg_discount_percent
FROM 
    orders
GROUP BY 
    segment
ORDER BY 
    avg_discount_percent DESC;


-- Monthly Sales Trend

SELECT 
    FORMAT(order_date, 'yyyy-MM') AS year_month, 
    SUM(sale_price) AS total_sales
FROM 
    orders
GROUP BY 
    FORMAT(order_date, 'yyyy-MM')
ORDER BY 
    year_month ASC;

-- Products with the Highest Discounts

WITH RankedProducts AS (
    SELECT 
        product_id, 
        sub_category, 
        AVG(discount) AS avg_discount,
        ROW_NUMBER() OVER (ORDER BY AVG(discount) DESC) AS rank
    FROM 
        orders
    GROUP BY 
        product_id, sub_category
)
SELECT 
    product_id, 
    sub_category, 
    avg_discount
FROM 
    RankedProducts
WHERE 
    rank <= 10;

-- State-Wise Profitability

SELECT TOP 10
    state, 
    SUM(profit) AS total_profit
FROM 
    orders
GROUP BY 
    state
ORDER BY 
    total_profit DESC;

-- Low-Margin Sales
SELECT 
    order_id, 
    product_id, 
    sale_price, 
    profit
FROM 
    orders
WHERE 
    profit <= 0
ORDER BY 
    profit ASC;

-- Impact of Discounts on Profit

SELECT 
    discount_percent, 
    SUM(profit) AS total_profit
FROM 
    orders
GROUP BY 
    discount_percent
ORDER BY 
    discount_percent ASC;

-- Top Customers Locations by Total Spend

SELECT TOP 10
    CONCAT(city, ', ', state) AS customer_location, 
    SUM(sale_price) AS total_spend
FROM 
    orders
GROUP BY 
    CONCAT(city, ', ', state)
ORDER BY 
    total_spend DESC;

-- Top 10 products with the most revenue

SELECT TOP 10
    product_id,
    sub_category,
    SUM(sale_price) AS total_revenue
FROM 
    orders
GROUP BY 
    product_id, sub_category
ORDER BY 
    total_revenue DESC;
