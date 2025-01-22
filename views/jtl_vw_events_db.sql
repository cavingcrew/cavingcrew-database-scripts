CREATE ALGORITHM = UNDEFINED DEFINER = `root` @`%` SQL SECURITY DEFINER VIEW `jtl_vw_events_db` AS
select
  `p`.`ID` AS `product_id`,
  `p`.`post_title` AS `product_name`,
  `p`.`post_status` AS `post_status`,
  max(
    case
      when `pm`.`meta_key` = '_price' then `pm`.`meta_value`
    end
  ) AS `price`,
  max(
    case
      when `pm`.`meta_key` = 'cost' then `pm`.`meta_value`
    end
  ) AS `cost`,
  max(
    case
      when `pm`.`meta_key` = 'total_sales' then `pm`.`meta_value`
    end
  ) AS `total_sales`,
  max(
    case
      when `pm`.`meta_key` = '_stock' then `pm`.`meta_value`
    end
  ) AS `stock`,
  coalesce(
    if(
      `p`.`post_type` = 'variable',
      (
        select
          sum(cast(`pmv_stock`.`meta_value` as unsigned))
        from
          `jtl_cavingcrew_com`.`jtl_posts` `v`
          left join `jtl_cavingcrew_com`.`jtl_postmeta` `pmv_manage` 
            on `v`.`ID` = `pmv_manage`.`post_id`
            and `pmv_manage`.`meta_key` = '_manage_stock'
          left join `jtl_cavingcrew_com`.`jtl_postmeta` `pmv_stock`
            on `v`.`ID` = `pmv_stock`.`post_id`
            and `pmv_stock`.`meta_key` = '_stock'
        where
          `v`.`post_parent` = `p`.`ID`
          and `v`.`post_type` = 'product_variation'
          and `pmv_manage`.`meta_value` = 'yes'
      ),
      case
        when (
          select meta_value 
          from `jtl_cavingcrew_com`.`jtl_postmeta` 
          where post_id = `p`.`ID`
            and meta_key = '_manage_stock'
            and meta_value = 'yes'
        ) then max(cast(`pm`.`meta_value` as unsigned))
        else 0
      end
    ),
    0
  ) AS `open_spaces`,
  (
    select
      count(distinct `oi`.`order_item_id`)
    from
      (
        (
          `jtl_cavingcrew_com`.`jtl_woocommerce_order_items` `oi`
          join `jtl_cavingcrew_com`.`jtl_woocommerce_order_itemmeta` `oim` on (
            `oi`.`order_item_id` = `oim`.`order_item_id`
            and `oim`.`meta_key` = '_product_id'
            and `oim`.`meta_value` = `p`.`ID`
          )
        )
        join `jtl_cavingcrew_com`.`jtl_posts` `o` on (
          `o`.`ID` = `oi`.`order_id`
          and `o`.`post_status` = 'wc-processing'
        )
      )
  ) AS `pending_orders`,
  max(
    case
      when `pm`.`meta_key` = '_stock_status' then `pm`.`meta_value`
    end
  ) AS `stock_status`,
  max(
    case
      when `pm`.`meta_key` = '_sku' then `pm`.`meta_value`
    end
  ) AS `sku`,
  max(
    case
      when `pm`.`meta_key` = 'wooct_time_end' then `pm`.`meta_value`
    end
  ) AS `wooct_time_end`,
  max(
    case
      when `pm`.`meta_key` = 'woocommerce_waitlist' then `pm`.`meta_value`
    end
  ) AS `woocommerce_waitlist`,
  max(
    case
      when `pm`.`meta_key` = 'event_total_places_available' then `pm`.`meta_value`
    end
  ) AS `event_total_places_available`,
  max(
    case
      when `pm`.`meta_key` = 'event_signup_opens' then `pm`.`meta_value`
    end
  ) AS `event_signup_opens`,
  max(
    case
      when `pm`.`meta_key` = 'event_start_date_time' then `pm`.`meta_value`
    end
  ) AS `event_start_date_time`,
  max(
    case
      when `pm`.`meta_key` = 'event_for_u18s' then `pm`.`meta_value`
    end
  ) AS `event_for_u18s`,
  max(
    case
      when `pm`.`meta_key` = 'event_dogs_come' then `pm`.`meta_value`
    end
  ) AS `event_dogs_come`,
  max(
    case
      when `pm`.`meta_key` = 'report_details_0_report_author' then `pm`.`meta_value`
    end
  ) AS `report_details_0_report_author`,
  max(
    case
      when `pm`.`meta_key` = 'report_details_0_report_location' then `pm`.`meta_value`
    end
  ) AS `report_details_0_report_location`,
  max(
    case
      when `pm`.`meta_key` = 'report_details_0_report_content' then `pm`.`meta_value`
    end
  ) AS `report_details_0_report_content`,
  max(
    case
      when `pm`.`meta_key` = 'report_details_0_report_photos' then `pm`.`meta_value`
    end
  ) AS `report_details_0_report_photos`,
  max(
    case
      when `pm`.`meta_key` = 'report_details' then `pm`.`meta_value`
    end
  ) AS `report_details`,
  max(
    case
      when `pm`.`meta_key` = 'short_description' then `pm`.`meta_value`
    end
  ) AS `short_description`,
  max(
    case
      when `pm`.`meta_key` = 'membership_required' then `pm`.`meta_value`
    end
  ) AS `membership_required`,
  max(
    case
      when `pm`.`meta_key` = 'event_how_it_works' then `pm`.`meta_value`
    end
  ) AS `event_how_it_works`,
  max(
    case
      when `pm`.`meta_key` = 'event_how_we_get_these' then `pm`.`meta_value`
    end
  ) AS `event_how_we_get_these`,
  max(
    case
      when `pm`.`meta_key` = 'event_when_do_we_meet' then `pm`.`meta_value`
    end
  ) AS `event_when_do_we_meet`,
  max(
    case
      when `pm`.`meta_key` = 'event_how_difficult_will_it_be' then `pm`.`meta_value`
    end
  ) AS `event_how_difficult_will_it_be`,
  max(
    case
      when `pm`.`meta_key` = 'event_volunteering_how_does_it_work' then `pm`.`meta_value`
    end
  ) AS `event_volunteering_how_does_it_work`,
  max(
    case
      when `pm`.`meta_key` = 'event_cave_name' then `pm`.`meta_value`
    end
  ) AS `event_cave_name`,
  max(
    case
      when `pm`.`meta_key` = 'event_gear_required' then `pm`.`meta_value`
    end
  ) AS `event_gear_required`,
  max(
    case
      when `pm`.`meta_key` = 'event_must_caved_with_us_before' then `pm`.`meta_value`
    end
  ) AS `event_must_caved_with_us_before`,
  max(
    case
      when `pm`.`meta_key` = 'event_skills_required' then `pm`.`meta_value`
    end
  ) AS `event_skills_required`,
  max(
    case
      when `pm`.`meta_key` = 'event_cost' then `pm`.`meta_value`
    end
  ) AS `event_cost`,
  max(
    case
      when `pm`.`meta_key` = 'event_trip_leader' then `pm`.`meta_value`
    end
  ) AS `event_trip_leader`,
  max(
    case
      when `pm`.`meta_key` = 'event_non-members_welcome' then `pm`.`meta_value`
    end
  ) AS `event_non-members_welcome`,
  max(
    case
      when `pm`.`meta_key` = 'event_why_are_only_members_allowed' then `pm`.`meta_value`
    end
  ) AS `event_why_are_only_members_allowed`,
  max(
    case
      when `pm`.`meta_key` = 'event_volunteering_required' then `pm`.`meta_value`
    end
  ) AS `event_volunteering_required`,
  max(
    case
      when `pm`.`meta_key` = 'event_u18s_come' then `pm`.`meta_value`
    end
  ) AS `event_u18s_come`,
  max(
    case
      when `pm`.`meta_key` = 'event_min_skills' then `pm`.`meta_value`
    end
  ) AS `minimum_skills`,
  max(
    case
      when `pm`.`meta_key` = 'event_min_gear' then `pm`.`meta_value`
    end
  ) AS `minimum_gear`,
  max(
    case
      when `pm`.`meta_key` = 'event_prior_experience' then `pm`.`meta_value`
    end
  ) AS `event_prior_experience`,
  max(
    case
      when `pm`.`meta_key` = 'trip_faq_19_trip_faq_title' then `pm`.`meta_value`
    end
  ) AS `trip_faq_19_trip_faq_title`,
  max(
    case
      when `pm`.`meta_key` = 'trip_faq_19_trip_faq_answer' then `pm`.`meta_value`
    end
  ) AS `trip_faq_19_trip_faq_answer`,
  max(
    case
      when `pm`.`meta_key` = 'trip_faq_20_trip_faq_title' then `pm`.`meta_value`
    end
  ) AS `trip_faq_20_trip_faq_title`,
  max(
    case
      when `pm`.`meta_key` = 'trip_faq_20_trip_faq_answer' then `pm`.`meta_value`
    end
  ) AS `trip_faq_20_trip_faq_answer`,
  max(
    case
      when `pm`.`meta_key` = 'event_how_does_this_work' then `pm`.`meta_value`
    end
  ) AS `event_how_does_this_work`,
  max(
    case
      when `pm`.`meta_key` = 'event_description' then `pm`.`meta_value`
    end
  ) AS `event_description`,
  max(
    case
      when `pm`.`meta_key` = 'trip_faq_21_trip_faq_title' then `pm`.`meta_value`
    end
  ) AS `trip_faq_21_trip_faq_title`,
  max(
    case
      when `pm`.`meta_key` = 'trip_faq_21_trip_faq_answer' then `pm`.`meta_value`
    end
  ) AS `trip_faq_21_trip_faq_answer`,
  max(
    case
      when `pm`.`meta_key` = 'event_next_week' then `pm`.`meta_value`
    end
  ) AS `event_next_week`,
  max(
    case
      when `pm`.`meta_key` = 'event_location_0_venue_name' then `pm`.`meta_value`
    end
  ) AS `event_location_0_venue_name`,
  max(
    case
      when `pm`.`meta_key` = 'event_location_0_venue_url' then `pm`.`meta_value`
    end
  ) AS `event_location_0_venue_url`,
  max(
    case
      when `pm`.`meta_key` = 'event_location_1_venue_name' then `pm`.`meta_value`
    end
  ) AS `event_location_1_venue_name`,
  max(
    case
      when `pm`.`meta_key` = 'event_location_1_venue_url' then `pm`.`meta_value`
    end
  ) AS `event_location_1_venue_url`,
  max(
    case
      when `pm`.`meta_key` = 'event_location_old' then `pm`.`meta_value`
    end
  ) AS `event_location_old`,
  max(
    case
      when `pm`.`meta_key` = 'event_type' then `pm`.`meta_value`
    end
  ) AS `event_type`,
  max(
    case
      when `pm`.`meta_key` = 'overnight_plans' then `pm`.`meta_value`
    end
  ) AS `overnight_plans`,
  max(
    case
      when `pm`.`meta_key` = 'hut_photo' then `pm`.`meta_value`
    end
  ) AS `hut_photo`,
  max(
    case
      when `pm`.`meta_key` = 'hut_facilities_description' then `pm`.`meta_value`
    end
  ) AS `hut_facilities_description`,
  max(
    case
      when `pm`.`meta_key` = 'hut_name' then `pm`.`meta_value`
    end
  ) AS `hut_name`,
  max(
    case
      when `pm`.`meta_key` = 'hut_google_maps_location' then `pm`.`meta_value`
    end
  ) AS `hut_google_maps_location`,
  max(
    case
      when `pm`.`meta_key` = 'trip_faq_11_trip_faq_title' then `pm`.`meta_value`
    end
  ) AS `trip_faq_11_trip_faq_title`,
  max(
    case
      when `pm`.`meta_key` = 'trip_faq_11_trip_faq_answer' then `pm`.`meta_value`
    end
  ) AS `trip_faq_11_trip_faq_answer`,
  max(
    case
      when `pm`.`meta_key` = 'trip_faq_12_trip_faq_title' then `pm`.`meta_value`
    end
  ) AS `trip_faq_12_trip_faq_title`,
  max(
    case
      when `pm`.`meta_key` = 'trip_faq_12_trip_faq_answer' then `pm`.`meta_value`
    end
  ) AS `trip_faq_12_trip_faq_answer`,
  max(
    case
      when `pm`.`meta_key` = 'event_paying_for' then `pm`.`meta_value`
    end
  ) AS `event_paying_for`,
  max(
    case
      when `pm`.`meta_key` = 'event_start_time' then `pm`.`meta_value`
    end
  ) AS `event_start_time`,
  max(
    case
      when `pm`.`meta_key` = 'session_start_time' then `pm`.`meta_value`
    end
  ) AS `session_start_time`,
  max(
    case
      when `pm`.`meta_key` = 'session_end_time' then `pm`.`meta_value`
    end
  ) AS `session_end_time`,
  max(
    case
      when `pm`.`meta_key` = 'who_running_event' then `pm`.`meta_value`
    end
  ) AS `who_running_event`,
  max(
    case
      when `pm`.`meta_key` = 'session_will_cover' then `pm`.`meta_value`
    end
  ) AS `session_will_cover`,
  max(
    case
      when `pm`.`meta_key` = 'event_start_date' then `pm`.`meta_value`
    end
  ) AS `event_start_date`,
  max(
    case
      when `pm`.`meta_key` = 'event_finish_date' then `pm`.`meta_value`
    end
  ) AS `event_finish_date`,
  max(
    case
      when `pm`.`meta_key` = 'event_finish_date_time' then `pm`.`meta_value`
    end
  ) AS `event_finish_date_time`,
  max(
    case
      when `pm`.`meta_key` = 'event_possible_objectives' then `pm`.`meta_value`
    end
  ) AS `event_possible_objectives`,
  max(
    case
      when `pm`.`meta_key` = 'what_is_the_minimum_skill_required_for_this_trip' then `pm`.`meta_value`
    end
  ) AS `what_is_the_minimum_skill_required_for_this_trip`,
  max(
    case
      when `pm`.`meta_key` = 'event_climbing_trip_or_other_things' then `pm`.`meta_value`
    end
  ) AS `event_climbing_trip_or_other_things`,
  max(
    case
      when `pm`.`meta_key` = 'event_accomodation_description' then `pm`.`meta_value`
    end
  ) AS `event_accomodation_description`,
  max(
    case
      when `pm`.`meta_key` = 'event_possible_location' then `pm`.`meta_value`
    end
  ) AS `event_possible_location`,
  max(
    case
      when `pm`.`meta_key` = 'event_location' then `pm`.`meta_value`
    end
  ) AS `event_location`,
  `t`.`name` AS `primary_category`
from
  (
    (
      (
        (
          (
            `jtl_cavingcrew_com`.`jtl_posts` `p`
            left join `jtl_cavingcrew_com`.`jtl_postmeta` `pm` on (`p`.`ID` = `pm`.`post_id`)
          )
          left join `jtl_cavingcrew_com`.`jtl_term_relationships` `tr` on (`p`.`ID` = `tr`.`object_id`)
        )
        left join `jtl_cavingcrew_com`.`jtl_term_taxonomy` `tt` on (`tr`.`term_taxonomy_id` = `tt`.`term_taxonomy_id`)
      )
      left join `jtl_cavingcrew_com`.`jtl_terms` `t` on (`tt`.`term_id` = `t`.`term_id`)
    )
    left join (
      select
        `oi`.`order_item_id` AS `order_item_id`,
        `oim`.`meta_value` AS `product_id`,
        count(0) AS `pending_attendees`
      from
        (
          (
            `jtl_cavingcrew_com`.`jtl_woocommerce_order_items` `oi`
            join `jtl_cavingcrew_com`.`jtl_woocommerce_order_itemmeta` `oim` on (
              `oi`.`order_item_id` = `oim`.`order_item_id`
              and `oim`.`meta_key` = '_product_id'
            )
          )
          join `jtl_cavingcrew_com`.`jtl_posts` `o` on (
            `o`.`ID` = `oi`.`order_id`
            and `o`.`post_status` in ('wc-pending', 'wc-on-hold')
          )
        )
      group by
        `oim`.`meta_value`
    ) `pending_counts` on (`pending_counts`.`product_id` = `p`.`ID`)
  )
where
  `p`.`post_type` = 'product'
  and `tt`.`taxonomy` = 'product_cat'
group by
  `p`.`ID`
order by
  `t`.`term_id`
