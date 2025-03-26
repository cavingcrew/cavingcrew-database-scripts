CREATE ALGORITHM = UNDEFINED DEFINER = `root` @`%` SQL SECURITY DEFINER VIEW `jtl_member_future_trips` AS
select
  `m`.`ID` AS `user_id`,
  concat(`m`.`first_name`, ' ', `m`.`last_name`) AS `member_name`,
  count(`o1`.`order_item_name`) AS `total_upcoming_trips`,
  max(
    case
      when `o1`.`rn` = 1 then substring_index(`o1`.`order_item_name`, ' - ', 1)
    end
  ) AS `next_trip_1`,
  max(
    case
      when `o1`.`rn` = 1 then `o1`.`cc_start_date`
    end
  ) AS `trip_1_date`,
  max(
    case
      when `o1`.`rn` = 2 then substring_index(`o1`.`order_item_name`, ' - ', 1)
    end
  ) AS `next_trip_2`,
  max(
    case
      when `o1`.`rn` = 2 then `o1`.`cc_start_date`
    end
  ) AS `trip_2_date`,
  max(
    case
      when `o1`.`rn` = 3 then substring_index(`o1`.`order_item_name`, ' - ', 1)
    end
  ) AS `next_trip_3`,
  max(
    case
      when `o1`.`rn` = 3 then `o1`.`cc_start_date`
    end
  ) AS `trip_3_date`
from
  (
    `jtl_cavingcrew_com`.`jtl_member_db` `m`
    left join (
      select
        `jtl_order_product_customer_lookup`.`user_id` AS `user_id`,
        `jtl_order_product_customer_lookup`.`order_item_name` AS `order_item_name`,
        `jtl_order_product_customer_lookup`.`cc_start_date` AS `cc_start_date`,
        row_number() over (
          partition by
            `jtl_order_product_customer_lookup`.`user_id`
          order by
            `jtl_order_product_customer_lookup`.`cc_start_date`
        ) AS `rn`
      from
        `jtl_cavingcrew_com`.`jtl_order_product_customer_lookup`
      where
        `jtl_order_product_customer_lookup`.`cc_start_date` > current_timestamp()
        and `jtl_order_product_customer_lookup`.`status` = 'wc-processing'
        and `jtl_order_product_customer_lookup`.`cc_attendance` = 'pending'
    ) `o1` on (`m`.`ID` = `o1`.`user_id`)
  )
where
  `m`.`cc_member` = 'yes'
  or `m`.`ID` in (
    select distinct
      `jtl_order_product_customer_lookup`.`user_id`
    from
      `jtl_cavingcrew_com`.`jtl_order_product_customer_lookup` `lookup`
    where
      `lookup`.`cc_start_date` >= current_timestamp() - interval 6 month
      and `lookup`.`user_id` = `m`.`ID`
      and (
        `m`.`cc_membership_cancellation_intent_date` is null
        or `m`.`cc_membership_cancellation_intent_date` = ''
      )
  )
group by
  `m`.`ID`
order by
  case
    when `m`.`cc_member` = 'yes' then 0
    else 1
  end,
  count(`o1`.`order_item_name`) desc
