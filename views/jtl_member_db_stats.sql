CREATE ALGORITHM = UNDEFINED DEFINER = `root` @`%` SQL SECURITY DEFINER VIEW `jtl_member_db_stats` AS
select
  `u`.`id` AS `user_id`,
  count(
    distinct case
      when `o`.`cc_attendance` in ('attended', 'no-register-show', 'noregistershow')
      and `o`.`status` = 'wc-completed' then `o`.`order_item_name`
    end
  ) AS `attendance_attended`,
  count(
    distinct case
      when `o`.`cc_attendance` = 'attended'
      and (
        `o`.`order_item_name` like '%Tuesday%'
        or `o`.`order_item_name` like '%Evening%'
      ) then `o`.`order_item_name`
    end
  ) AS `attendance_tuesday_evening_attended`,
  count(
    distinct case
      when `o`.`cc_attendance` = 'attended'
      and `o`.`order_item_name` like '%Saturday%' then `o`.`order_item_name`
    end
  ) AS `attendance_saturday_attended`,
  count(
    distinct case
      when `o`.`cc_attendance` = 'attended'
      and (
        `o`.`order_item_name` like '%Thursday%'
        or `o`.`order_item_name` like '%Saturday%'
        or `o`.`order_item_name` like '%Horizontal%'
      ) then `o`.`order_item_name`
    end
  ) AS `attendance_day_attended`,
    count(
    distinct case
      when `o`.`cc_attendance` = 'attended'
      and (
        `o`.`order_item_name` like '%Week%'
        or `o`.`order_item_name` like '%New Year%'
      ) then `o`.`order_item_name`
    end
  ) AS `attendance_overnight_attended`,
  count(
    distinct case
      when `o`.`cc_attendance` = 'attended'
      and (
        `o`.`order_item_name` like '%Training%'
        or `o`.`order_item_name` like '%Skill Sharing%'
      ) then `o`.`order_item_name`
    end
  ) AS `attendance_training_attended`,
  count(
    distinct case
      when `o`.`cc_attendance` = 'attended'
      and `o`.`order_item_name` like '%Social%' then `o`.`order_item_name`
    end
  ) AS `attendance_social_attended`,
  count(
    distinct case
      when `o`.`cc_attendance` is not null
      and `o`.`cc_attendance` <> 'duplicate' then `o`.`order_item_name`
    end
  ) AS `attendance_signups`,
  count(
    distinct case
      when `o`.`cc_attendance` in (
        'bail',
        'cancelled',
        'cancel',
        'cancelled in advance'
      ) then `o`.`order_item_name`
    end
  ) AS `attendance_cancelled`,
  count(
    distinct case
      when `o`.`cc_attendance` in (
        'noregistershow',
        'no-register-show',
        'did not register and showed up'
      ) then `o`.`order_item_name`
    end
  ) AS `attendance_noregistershow`,
  count(
    distinct case
      when `o`.`cc_attendance` in (
        'noshow',
        'no-show',
        'did not show up and did not let us know'
      ) then `o`.`order_item_name`
    end
  ) AS `attendance_noshow`,
  count(
    distinct case
      when `o`.`cc_attendance` in ('late-bail', 'latebail') then `o`.`order_item_name`
    end
  ) AS `attendance_latebail`,
  count(
    distinct case
      when `o`.`cc_attendance` = 'duplicate' then `o`.`order_item_name`
    end
  ) AS `attendance_duplicate`,
  count(
    distinct case
      when `o`.`cc_attendance` = 'pending'
      and (
        `o`.`cc_attendance` <> 'duplicate'
        or `o`.`cc_attendance` is not null
        or `o`.`cc_attendance` <> 'not_applicable'
      ) then `o`.`order_item_name`
    end
  ) AS `attendance_inprogress`
from
  (
    `jtl_member_db` `u`
    left join `jtl_order_product_customer_lookup` `o` on (`u`.`id` = `o`.`user_id`)
  )
where
  `o`.`status` in (
    'wc-completed',
    'wc-processing',
    'wc-onhold',
    'wc-on-hold'
  )
group by
  `u`.`id`
