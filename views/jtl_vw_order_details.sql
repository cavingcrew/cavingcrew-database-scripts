CREATE ALGORITHM = UNDEFINED DEFINER = `root` @`%` SQL SECURITY DEFINER VIEW `jtl_vw_order_details` AS
select
  `o`.`order_id` AS `order_id`,
  `m`.`first_name` AS `first_name`,
  `m`.`last_name` AS `last_name`,
  `o`.`order_item_name` AS `order_item_name`,
  `o`.`order_created` AS `order_created`
from
  (
    `jtl_order_product_customer_lookup` `o`
    join `jtl_member_db` `m` on (`o`.`user_id` = `m`.`id`)
  )