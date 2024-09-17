CREATE ALGORITHM = UNDEFINED DEFINER = `root` @`%` SQL SECURITY DEFINER VIEW `jtl_vw_order_details` AS
select
  `o`.`order_id` AS `order_id`,
  `m`.`first_name` AS `first_name`,
  `m`.`last_name` AS `last_name`,
  `o`.`order_item_name` AS `order_item_name`,
  `o`.`status` AS `status`,
  `o`.`cc_attendance` AS `cc_attendance`,
  `o`.`cc_volunteer` AS `cc_volunteer`,
  `o`.`cc_volunteer_attendance` AS `cc_volunteer_attendance`,
  `o`.`cc_location` AS `cc_location`,
  `o`.`memberbot_order_category` AS `memberbot_order_category`,
  `o`.`cc_start_date` AS `cc_start_date`,
  `o`.`user_id` AS `user_id`,
  `o`.`order_created` AS `order_created`,
  `o`.`cc_attendance_sim` AS `cc_attendance_sim`,
  `o`.`cc_volunteer_attendance_sim` AS `cc_volunteer_attendance_sim`,
  `o`.`cc_volunteer_sim` AS `cc_volunteer_sim`,
  `m`.`billing_email` AS `billing_email`,
  `m`.`billing_phone` AS `billing_phone`
from
  (
    `jtl_order_product_customer_lookup` `o`
    join `jtl_member_db` `m` on (`o`.`user_id` = `m`.`id`)
  )
