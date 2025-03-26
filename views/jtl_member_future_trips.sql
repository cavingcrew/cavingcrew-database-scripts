CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `jtl_member_future_trips` AS
SELECT
  m.ID AS user_id,
  CONCAT(m.first_name, ' ', m.last_name) AS member_name,
  COUNT(o1.order_item_name) AS total_upcoming_trips,
  MAX(CASE WHEN o1.rn = 1 THEN o1.order_item_name END) AS next_trip_1,
  MAX(CASE WHEN o1.rn = 1 THEN o1.cc_start_date END) AS trip_1_date,
  MAX(CASE WHEN o1.rn = 2 THEN o1.order_item_name END) AS next_trip_2,
  MAX(CASE WHEN o1.rn = 2 THEN o1.cc_start_date END) AS trip_2_date,
  MAX(CASE WHEN o1.rn = 3 THEN o1.order_item_name END) AS next_trip_3,
  MAX(CASE WHEN o1.rn = 3 THEN o1.cc_start_date END) AS trip_3_date
FROM jtl_member_db m
LEFT JOIN (
  -- Get future trips with row numbers
  SELECT
    user_id,
    order_item_name,
    cc_start_date,
    ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY cc_start_date) AS rn
  FROM jtl_order_product_customer_lookup
  WHERE
    cc_start_date > NOW() AND
    status = 'wc-processing' AND
    cc_attendance = 'pending'
) AS o1 ON m.ID = o1.user_id
WHERE m.cc_member = 'yes' 
   OR m.ID IN (
     SELECT DISTINCT user_id
     FROM jtl_order_product_customer_lookup
     WHERE 
       cc_start_date >= DATE_SUB(NOW(), INTERVAL 1 YEAR) AND
       (cc_membership_cancellation_intent_date IS NULL 
        OR cc_membership_cancellation_intent_date = '')
   )
GROUP BY m.ID
ORDER BY 
  CASE WHEN m.cc_member = 'yes' THEN 0 ELSE 1 END,  -- Members first
  total_upcoming_trips DESC  -- Most trips first
