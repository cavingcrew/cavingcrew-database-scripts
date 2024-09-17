CREATE ALGORITHM = UNDEFINED DEFINER = `root` @`%` SQL SECURITY DEFINER VIEW `jtl_order_product_customer_lookup` AS
select
  `a`.`order_id` AS `order_id`,
  `b`.`product_id` AS `product_id`,
  `b`.`variation_id` AS `variation_id`,
  `c`.`order_item_name` AS `order_item_name`,
  `a`.`status` AS `status`,
  (
    select
      `jtl_postmeta`.`meta_value`
    from
      `jtl_postmeta`
    where
      `jtl_postmeta`.`post_id` = `a`.`order_id`
      and `jtl_postmeta`.`meta_key` = 'cc_attendance'
  ) AS `cc_attendance`,
  coalesce(
    (
      select distinct
        `jtl_postmeta`.`meta_value`
      from
        `jtl_postmeta`
      where
        `jtl_postmeta`.`post_id` = `b`.`product_id`
        and `jtl_postmeta`.`meta_key` = 'event_start_date'
      limit
        1
    ),
    if(
      `c`.`order_item_name` regexp '[0-9]{1,2}/[0-9]{1,2} -',
      str_to_date(
        concat(
          year(`d`.`post_date`),
          '-',
          substring_index(
            substring_index(`c`.`order_item_name`, ' -', 1),
            '/',
            -1
          ),
          '-',
          substring_index(
            substring_index(
              substring_index(`c`.`order_item_name`, ' -', 1),
              ' ',
              -1
            ),
            '/',
            1
          )
        ),
        '%Y-%m-%d'
      ),
      `d`.`post_date`
    )
  ) AS `cc_start_date`,
  (
    select distinct
      `t`.`meta_value` AS `_customer_user`
    from
      `jtl_postmeta` `t`
    where
      `t`.`post_id` = `a`.`order_id`
      and `t`.`meta_key` = '_customer_user'
  ) AS `user_id`,
  `d`.`post_date` AS `order_created`
from
  (
    (
      (
        `jtl_wc_order_stats` `a`
        join `jtl_wc_order_product_lookup` `b` on (`a`.`order_id` = `b`.`order_id`)
      )
      join `jtl_woocommerce_order_items` `c` on (`a`.`order_id` = `c`.`order_id`)
    )
    join `jtl_posts` `d` on (`a`.`order_id` = `d`.`ID`)
  )
order by
  `a`.`order_id`