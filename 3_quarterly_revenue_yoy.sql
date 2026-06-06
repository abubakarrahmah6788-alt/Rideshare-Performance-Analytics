WITH revenue_summary AS (
  SELECT
    EXTRACT(YEAR FROM TO_TIMESTAMP(paid_date, 'MM/DD/YYYY HH24:MI')) AS year,
    EXTRACT(QUARTER FROM TO_TIMESTAMP(paid_date, 'MM/DD/YYYY HH24:MI')) AS quarter,
    SUM(CAST(amount AS NUMERIC)) AS total_revenue
  FROM "Payments"
  WHERE TO_TIMESTAMP(paid_date, 'MM/DD/YYYY HH24:MI')
    BETWEEN TO_TIMESTAMP('06/01/2021 00:00', 'MM/DD/YYYY HH24:MI')
    AND TO_TIMESTAMP('12/31/2024 23:59', 'MM/DD/YYYY HH24:MI')
    AND CAST(amount AS NUMERIC) > 0
  GROUP BY year, quarter
)
SELECT *,
  LAG(total_revenue) OVER (PARTITION BY quarter ORDER BY year) AS previous_year,
  ROUND((total_revenue - LAG(total_revenue) OVER (
    PARTITION BY quarter ORDER BY year)
  ) / NULLIF(LAG(total_revenue) OVER (
    PARTITION BY quarter ORDER BY year), 0) * 100, 2
  ) AS yoy_growth_percent
FROM revenue_summary
ORDER BY yoy_growth_percent DESC NULLS LAST;
