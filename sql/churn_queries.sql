SELECT
    Churn,
    COUNT(*) AS total_customers
FROM telecom_customers
GROUP BY Churn;

SELECT
    Churn,
    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*) FROM telecom_customers),
        2
    ) AS churn_percentage
FROM telecom_customers
GROUP BY Churn;

SELECT
    Contract,
    COUNT(*) AS total_customers,
    SUM(
        CASE
            WHEN Churn = 'Yes'
            THEN 1
            ELSE 0
        END
    ) AS churned_customers
FROM telecom_customers
GROUP BY Contract
ORDER BY churned_customers DESC;

SELECT
    Churn,
    ROUND(
        AVG(MonthlyCharges),
        2
    ) AS avg_monthly_charge
FROM telecom_customers
GROUP BY Churn;

SELECT
    Churn,
    ROUND(
        AVG(tenure),
        2
    ) AS avg_tenure
FROM telecom_customers
GROUP BY Churn;

SELECT
    PaymentMethod,
    SUM(
        CASE
            WHEN Churn='Yes'
            THEN 1
            ELSE 0
        END
    ) AS churned_customers
FROM telecom_customers
GROUP BY PaymentMethod
ORDER BY churned_customers DESC;

SELECT
    customerID,
    Contract,
    MonthlyCharges,
    tenure,
    InternetService,
    PaymentMethod
FROM telecom_customers
WHERE Contract = 'Month-to-month'
AND MonthlyCharges > 70
AND tenure < 12
AND InternetService = 'Fiber optic'
AND PaymentMethod = 'Electronic check';


SELECT
    Churn,
    ROUND(
        SUM(MonthlyCharges),
        2
    ) AS monthly_revenue
FROM telecom_customers
GROUP BY Churn;