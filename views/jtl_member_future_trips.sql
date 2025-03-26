CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `jtl_member_future_trips` AS
SELECT
  m.ID AS user_id,
  CONCAT(m.first_name, ' ', m.last_name) AS member_name,
  MAX(CASE WHEN o1.rn = 1 THEN o1.order_item_name END) AS next_trip_1,
  MAX(CASE WHEN o1.rn = 1 THEN o1.cc_start_date END) AS trip_1_date,
  MAX(CASE WHEN o1.rn = 2 THEN o1.order_item_name END) AS next_trip_2,
  MAX(CASE WHEN o1.rn = 2 THEN o1.cc_start_date END) AS trip_2_date,
  MAX(CASE WHEN o1.rn = 3 THEN o1.order_item_name END) AS next_trip_3,
  MAX(CASE WHEN o1.rn = 3 THEN o1.cc_start_date END) AS trip_3_date
FROM (
  -- Combine members and recent attendees
  SELECT ID
  FROM jtl_member_db
  WHERE cc_member = 'yes'
  UNION
  SELECT DISTINCT user_id
  FROM jtl_order_product_customer_lookup
  WHERE cc_start_date >= DATE_SUB(NOW(), INTERVAL 1 YEAR) AND cc_member <> 'yes' AND cc_member <> 'expired' and ()cc_membership_cancellation_intent_date == null OR cc_membership_cancellation_intent_date == "")
) AS eligible_users
JOIN jtl_member_db m ON eligible_users.ID = m.ID
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
) AS o1 ON eligible_users.ID = o1.user_id
GROUP BY m.ID
