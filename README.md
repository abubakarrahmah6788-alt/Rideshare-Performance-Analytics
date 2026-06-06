# Rideshare-Performance-Analytics
SQL analysis of ride-sharing platform data covering revenue trends, driver performance, rider retention and cancellation rates using PostgreSQL on Supabase
# Rideshare Performance Analytics

## Overview
This project analyses ride, driver, and payment data from a rideshare 
platform covering June 2021 to December 2024. Using PostgreSQL on Supabase, 
eight SQL analyses were conducted to uncover operational insights, revenue 
trends, and performance gaps.

## Dataset
- Source: Provided by HNG Tech Internship Programme
- Tables: Rides, Drivers, Riders, Payments
- Period: June 2021 – December 2024

## Tools
- PostgreSQL, Supabase, SQL Window Functions, CTEs

## Analyses Conducted
| # | Analysis | Key Finding |
|---|----------|-------------|
| 1 | Top 10 Longest Rides | Longest ride was 69 mins, Montreal to Vancouver |
| 2 | Rider Retention 2021–2024 | Only 2 riders retained over 3 years |
| 3 | Quarterly Revenue & YoY Growth | +200.44% spike in Q2 2022 |
| 4 | Driver Consistency | Driver_537 led with 0.83 rides/month |
| 5 | Cancellation Rate by City | Toronto 19.02%, Vancouver 17.86% |
| 6 | Riders Excluding Cash Payments | Only 2 riders used exclusively digital payments |
| 7 | Top Earning Drivers by City | Driver 1980 (Calgary) led with $476.91 |
| 8 | Bonus Qualified Drivers | Only 2 of all drivers met bonus criteria |

## Key Recommendations
- Investigate Q2 2022 revenue surge for replication
- Address high cancellation rates in Toronto and Vancouver
- Launch retention programmes to improve multi-year rider engagement
- Reward high-performing drivers and review bonus criteria

## Conclusion
The platform shows strong operational potential but faces challenges in 
retention and consistency. Targeted interventions in rider loyalty, driver 
incentives, and city-level operations can unlock sustainable growth.
