/*====================================================
Supply Chain Analytics SQL Project
Author : Rahul Kumar
Database : supply_chain_db
Table : supply_chain_analytics
====================================================*/


CREATE DATABASE supply_chain_db;
USE supply_chain_db;
SELECT COUNT(*) AS total_orders
FROM supply_chain_analytics;

SELECT *
FROM supply_chain_analytics
LIMIT 5;

SELECT 
ROUND(SUM(Sales),2) AS total_revenue
FROM supply_chain_analytics;

SELECT 
COUNT(*) AS total_orders
FROM supply_chain_analytics;

SELECT 
ROUND(AVG(Delay),2) AS avg_delay
FROM supply_chain_analytics;

SELECT 
ROUND(
100 * AVG(Late_delivery_risk),
2
) AS late_delivery_percentage
FROM supply_chain_analytics;

-- --------------------------------------
-- Delivery Performance Analysis
-- --------------------------------------

-- Delay by Shipping Mode
SELECT 
    `Shipping Mode`,
    COUNT(*) AS total_orders,
    ROUND(AVG(Delay),2) AS avg_delay,
    ROUND(100 * AVG(Late_delivery_risk),2) AS late_delivery_percentage
FROM supply_chain_analytics
GROUP BY `Shipping Mode`
ORDER BY avg_delay DESC;

-- Delay by Region
SELECT 
    `Order Region`,
    COUNT(*) AS total_orders,
    ROUND(AVG(Delay),2) AS avg_delay,
    ROUND(100 * AVG(Late_delivery_risk),2) AS late_delivery_percentage
FROM supply_chain_analytics
GROUP BY `Order Region`
ORDER BY late_delivery_percentage DESC;

-- Profit Impact of Delays
SELECT 
    Is_Delayed,
    ROUND(AVG(`Order Profit Per Order`),2) AS avg_profit,
    ROUND(SUM(`Order Profit Per Order`),2) AS total_profit
FROM supply_chain_analytics
GROUP BY Is_Delayed;

-- Category Delay Analysis
SELECT 
    `Category Name`,
    COUNT(*) AS total_orders,
    ROUND(AVG(Delay),2) AS avg_delay,
    ROUND(100 * AVG(Late_delivery_risk),2) AS late_delivery_percentage
FROM supply_chain_analytics
GROUP BY `Category Name`
ORDER BY late_delivery_percentage DESC;

-- Shipping Mode Performance Analysis
SELECT 
    `Shipping Mode`,
    COUNT(*) AS total_orders,
    ROUND(AVG(Delay),2) AS avg_delay,
    ROUND(100 * AVG(Late_delivery_risk),2) AS late_delivery_percentage
FROM supply_chain_analytics
GROUP BY `Shipping Mode`
ORDER BY late_delivery_percentage DESC;

-- -----------------------------------
-- Profitability by Region
-- -----------------------------------

SELECT
    `Order Region`,
    COUNT(*) AS total_orders,
    ROUND(SUM(Sales),2) AS total_revenue,
    ROUND(SUM(`Order Profit Per Order`),2) AS total_profit,
    ROUND(AVG(`Order Profit Per Order`),2) AS avg_profit_per_order
FROM supply_chain_analytics
GROUP BY `Order Region`
ORDER BY total_profit DESC;

-- -----------------------------------
-- Profitability by Customer Segment
-- -----------------------------------

SELECT
    `Customer Segment`,
    COUNT(*) AS total_orders,
    ROUND(SUM(Sales),2) AS total_revenue,
    ROUND(SUM(`Order Profit Per Order`),2) AS total_profit,
    ROUND(AVG(`Order Profit Per Order`),2) AS avg_profit_per_order
FROM supply_chain_analytics
GROUP BY `Customer Segment`
ORDER BY total_profit DESC;

-- -----------------------------------
-- Profitability by Category
-- -----------------------------------

SELECT
    `Category Name`,
    COUNT(*) AS total_orders,
    ROUND(SUM(Sales),2) AS total_revenue,
    ROUND(SUM(`Order Profit Per Order`),2) AS total_profit,
    ROUND(AVG(`Order Profit Per Order`),2) AS avg_profit_per_order
FROM supply_chain_analytics
GROUP BY `Category Name`
ORDER BY total_profit DESC;

-- -----------------------------------
-- Top Revenue Products
-- -----------------------------------

SELECT
    `Product Name`,
    COUNT(*) AS total_orders,
    ROUND(SUM(Sales),2) AS total_revenue,
    ROUND(SUM(`Order Profit Per Order`),2) AS total_profit
FROM supply_chain_analytics
GROUP BY `Product Name`
ORDER BY total_revenue DESC
LIMIT 10;

-- -----------------------------------
-- Most Profitable Products
-- -----------------------------------

SELECT
    `Product Name`,
    ROUND(SUM(Sales),2) AS total_revenue,
    ROUND(SUM(`Order Profit Per Order`),2) AS total_profit
FROM supply_chain_analytics
GROUP BY `Product Name`
ORDER BY total_profit DESC
LIMIT 10;

-- -----------------------------------
-- Lowest Profit Products
-- -----------------------------------

SELECT
    `Product Name`,
    COUNT(*) AS total_orders,
    ROUND(SUM(Sales),2) AS total_revenue,
    ROUND(SUM(`Order Profit Per Order`),2) AS total_profit
FROM supply_chain_analytics
GROUP BY `Product Name`
ORDER BY total_profit ASC
LIMIT 10;

-- -----------------------------------
-- Revenue Impact of Delays
-- -----------------------------------

SELECT
    Is_Delayed,
    COUNT(*) AS total_orders,
    ROUND(SUM(Sales),2) AS total_revenue,
    ROUND(SUM(`Order Profit Per Order`),2) AS total_profit,
    ROUND(AVG(`Order Profit Per Order`),2) AS avg_profit
FROM supply_chain_analytics
GROUP BY Is_Delayed;

-- -----------------------------------
-- Customer Country Performance
-- -----------------------------------

SELECT
    `Customer Country`,
    COUNT(*) AS total_orders,
    ROUND(SUM(Sales),2) AS total_revenue,
    ROUND(SUM(`Order Profit Per Order`),2) AS total_profit,
    ROUND(AVG(Delay),2) AS avg_delay,
    ROUND(100 * AVG(Late_delivery_risk),2) AS late_delivery_percentage
FROM supply_chain_analytics
GROUP BY `Customer Country`
ORDER BY total_revenue DESC
LIMIT 15;

-- -----------------------------------
-- High Risk Customer Segments
-- -----------------------------------

SELECT
    `Customer Segment`,
    COUNT(*) AS total_orders,
    ROUND(AVG(Delay),2) AS avg_delay,
    ROUND(100 * AVG(Late_delivery_risk),2) AS late_delivery_percentage
FROM supply_chain_analytics
GROUP BY `Customer Segment`
ORDER BY late_delivery_percentage DESC;

-- -----------------------------------
-- Revenue Contribution by Country
-- -----------------------------------

SELECT
    `Customer Country`,
    ROUND(SUM(Sales),2) AS total_revenue,
    ROUND(
        100 * SUM(Sales) /
        (SELECT SUM(Sales)
         FROM supply_chain_analytics),
    2) AS revenue_percentage
FROM supply_chain_analytics
GROUP BY `Customer Country`
ORDER BY total_revenue DESC
LIMIT 15;

-- -----------------------------------
-- Monthly Revenue Trend
-- -----------------------------------

SELECT
   `Order Month`,
    COUNT(*) AS total_orders,
    ROUND(SUM(Sales),2) AS total_revenue,
    ROUND(SUM(`Order Profit Per Order`),2) AS total_profit
FROM supply_chain_analytics
GROUP BY `Order Month`
ORDER BY `Order Month`;

-- -----------------------------------
-- Monthly Delay Trend
-- -----------------------------------

SELECT
    `Order Month`,
    ROUND(AVG(Delay),2) AS avg_delay,
    ROUND(100 * AVG(Late_delivery_risk),2) AS late_delivery_percentage
FROM supply_chain_analytics
GROUP BY `Order Month`
ORDER BY `Order Month`;

-- -----------------------------------
-- Weekday Operational Analysis
-- -----------------------------------

SELECT
   `Order Day`,
    COUNT(*) AS total_orders,
    ROUND(AVG(Delay),2) AS avg_delay,
    ROUND(SUM(Sales),2) AS total_revenue
FROM supply_chain_analytics
GROUP BY `Order Day`
ORDER BY total_orders DESC;

-- -----------------------------------
-- Hourly Order Pattern
-- -----------------------------------

SELECT
    `Order Hour`,
    COUNT(*) AS total_orders,
    ROUND(SUM(Sales),2) AS total_revenue
FROM supply_chain_analytics
GROUP BY `Order Hour`
ORDER BY `Order Hour`;

-- -----------------------------------
-- Hourly Delay Analysis
-- -----------------------------------

SELECT
    `Order Hour`,
    ROUND(AVG(Delay),2) AS avg_delay,
    ROUND(100 * AVG(Late_delivery_risk),2) AS late_delivery_percentage
FROM supply_chain_analytics
GROUP BY `Order Hour`
ORDER BY late_delivery_percentage DESC;

-- -----------------------------------
-- Delay Impact by Region
-- -----------------------------------

SELECT
    `Order Region`,
    COUNT(*) AS total_orders,
    ROUND(AVG(Delay),2) AS avg_delay,
    ROUND(SUM(`Order Profit Per Order`),2) AS total_profit,
    ROUND(100 * AVG(Late_delivery_risk),2) AS late_delivery_percentage
FROM supply_chain_analytics
GROUP BY `Order Region`
ORDER BY late_delivery_percentage DESC;

-- -----------------------------------
-- Shipping Mode Profitability
-- -----------------------------------

SELECT
    `Shipping Mode`,
    COUNT(*) AS total_orders,
    ROUND(SUM(Sales),2) AS total_revenue,
    ROUND(SUM(`Order Profit Per Order`),2) AS total_profit,
    ROUND(AVG(Delay),2) AS avg_delay
FROM supply_chain_analytics
GROUP BY `Shipping Mode`
ORDER BY total_profit DESC;