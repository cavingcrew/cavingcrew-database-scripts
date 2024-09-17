CREATE ALGORITHM = UNDEFINED DEFINER = `root` @`%` SQL SECURITY DEFINER VIEW `jtl_vw_events_db` AS
SELECT
  `p`.`ID` AS `product_id`,
  `p`.`post_title` AS `product_name`,
  MAX(CASE WHEN `pm`.`meta_key` = '_price' THEN `pm`.`meta_value` END) AS `price`,
  MAX(CASE WHEN `pm`.`meta_key` = 'cost' THEN `pm`.`meta_value` END) AS `cost`,
  MAX(CASE WHEN `pm`.`meta_key` = 'total_sales' THEN `pm`.`meta_value` END) AS `total_sales`,
  MAX(CASE WHEN `pm`.`meta_key` = '_stock' THEN `pm`.`meta_value` END) AS `stock`,
  MAX(CASE WHEN `pm`.`meta_key` = '_stock_status' THEN `pm`.`meta_value` END) AS `stock_status`,
  MAX(CASE WHEN `pm`.`meta_key` = '_sku' THEN `pm`.`meta_value` END) AS `sku`,
  MAX(CASE WHEN `pm`.`meta_key` = 'wooct_time_end' THEN `pm`.`meta_value` END) AS `wooct_time_end`,
  MAX(CASE WHEN `pm`.`meta_key` = 'woocommerce_waitlist' THEN `pm`.`meta_value` END) AS `woocommerce_waitlist`,
  MAX(CASE WHEN `pm`.`meta_key` = 'event_total_places_available' THEN `pm`.`meta_value` END) AS `event_total_places_available`,
  MAX(CASE WHEN `pm`.`meta_key` = 'event_signup_opens' THEN `pm`.`meta_value` END) AS `event_signup_opens`,
  MAX(CASE WHEN `pm`.`meta_key` = 'event_start_date_time' THEN `pm`.`meta_value` END) AS `event_start_date_time`,
  MAX(CASE WHEN `pm`.`meta_key` = 'event_for_u18s' THEN `pm`.`meta_value` END) AS `event_for_u18s`,
  MAX(CASE WHEN `pm`.`meta_key` = 'event_dogs_come' THEN `pm`.`meta_value` END) AS `event_dogs_come`,
  MAX(CASE WHEN `pm`.`meta_key` = 'report_details_0_report_author' THEN `pm`.`meta_value` END) AS `report_details_0_report_author`,
  MAX(CASE WHEN `pm`.`meta_key` = 'report_details_0_report_location' THEN `pm`.`meta_value` END) AS `report_details_0_report_location`,
  MAX(CASE WHEN `pm`.`meta_key` = 'report_details_0_report_content' THEN `pm`.`meta_value` END) AS `report_details_0_report_content`,
  MAX(CASE WHEN `pm`.`meta_key` = 'report_details_0_report_photos' THEN `pm`.`meta_value` END) AS `report_details_0_report_photos`,
  MAX(CASE WHEN `pm`.`meta_key` = 'report_details' THEN `pm`.`meta_value` END) AS `report_details`,
  MAX(CASE WHEN `pm`.`meta_key` = 'short_description' THEN `pm`.`meta_value` END) AS `short_description`,
  MAX(CASE WHEN `pm`.`meta_key` = 'membership_required' THEN `pm`.`meta_value` END) AS `membership_required`,
  MAX(CASE WHEN `pm`.`meta_key` = 'event_how_it_works' THEN `pm`.`meta_value` END) AS `event_how_it_works`,
  MAX(CASE WHEN `pm`.`meta_key` = 'event_how_we_get_these' THEN `pm`.`meta_value` END) AS `event_how_we_get_these`,
  MAX(CASE WHEN `pm`.`meta_key` = 'event_when_do_we_meet' THEN `pm`.`meta_value` END) AS `event_when_do_we_meet`,
  MAX(CASE WHEN `pm`.`meta_key` = 'event_how_difficult_will_it_be' THEN `pm`.`meta_value` END) AS `event_how_difficult_will_it_be`,
  MAX(CASE WHEN `pm`.`meta_key` = 'event_volunteering_how_does_it_work' THEN `pm`.`meta_value` END) AS `event_volunteering_how_does_it_work`,
  MAX(CASE WHEN `pm`.`meta_key` = 'trip_faq_19_trip_faq_title' THEN `pm`.`meta_value` END) AS `trip_faq_19_trip_faq_title`,
  MAX(CASE WHEN `pm`.`meta_key` = 'trip_faq_19_trip_faq_answer' THEN `pm`.`meta_value` END) AS `trip_faq_19_trip_faq_answer`,
  MAX(CASE WHEN `pm`.`meta_key` = 'trip_faq_20_trip_faq_title' THEN `pm`.`meta_value` END) AS `trip_faq_20_trip_faq_title`,
  MAX(CASE WHEN `pm`.`meta_key` = 'trip_faq_20_trip_faq_answer' THEN `pm`.`meta_value` END) AS `trip_faq_20_trip_faq_answer`,
  MAX(CASE WHEN `pm`.`meta_key` = 'event_how_does_this_work' THEN `pm`.`meta_value` END) AS `event_how_does_this_work`,
  MAX(CASE WHEN `pm`.`meta_key` = 'event_description' THEN `pm`.`meta_value` END) AS `event_description`,
  MAX(CASE WHEN `pm`.`meta_key` = 'trip_faq_21_trip_faq_title' THEN `pm`.`meta_value` END) AS `trip_faq_21_trip_faq_title`,
  MAX(CASE WHEN `pm`.`meta_key` = 'trip_faq_21_trip_faq_answer' THEN `pm`.`meta_value` END) AS `trip_faq_21_trip_faq_answer`,
  MAX(CASE WHEN `pm`.`meta_key` = 'event_next_week' THEN `pm`.`meta_value` END) AS `event_next_week`,
  MAX(CASE WHEN `pm`.`meta_key` = 'event_location_0_venue_name' THEN `pm`.`meta_value` END) AS `event_location_0_venue_name`,
  MAX(CASE WHEN `pm`.`meta_key` = 'event_location_0_venue_url' THEN `pm`.`meta_value` END) AS `event_location_0_venue_url`,
  MAX(CASE WHEN `pm`.`meta_key` = 'event_location_1_venue_name' THEN `pm`.`meta_value` END) AS `event_location_1_venue_name`,
  MAX(CASE WHEN `pm`.`meta_key` = 'event_location_1_venue_url' THEN `pm`.`meta_value` END) AS `event_location_1_venue_url`,
  MAX(CASE WHEN `pm`.`meta_key` = 'event_location_old' THEN `pm`.`meta_value` END) AS `event_location_old`,
  MAX(CASE WHEN `pm`.`meta_key` = 'event_type' THEN `pm`.`meta_value` END) AS `event_type`,
  MAX(CASE WHEN `pm`.`meta_key` = 'overnight_plans' THEN `pm`.`meta_value` END) AS `overnight_plans`,
  MAX(CASE WHEN `pm`.`meta_key` = 'hut_photo' THEN `pm`.`meta_value` END) AS `hut_photo`,
  MAX(CASE WHEN `pm`.`meta_key` = 'hut_facilities_description' THEN `pm`.`meta_value` END) AS `hut_facilities_description`,
  MAX(CASE WHEN `pm`.`meta_key` = 'hut_name' THEN `pm`.`meta_value` END) AS `hut_name`,
  MAX(CASE WHEN `pm`.`meta_key` = 'hut_google_maps_location' THEN `pm`.`meta_value` END) AS `hut_google_maps_location`,
  MAX(CASE WHEN `pm`.`meta_key` = 'trip_faq_11_trip_faq_title' THEN `pm`.`meta_value` END) AS `trip_faq_11_trip_faq_title`,
  MAX(CASE WHEN `pm`.`meta_key` = 'trip_faq_11_trip_faq_answer' THEN `pm`.`meta_value` END) AS `trip_faq_11_trip_faq_answer`,
  MAX(CASE WHEN `pm`.`meta_key` = 'trip_faq_12_trip_faq_title' THEN `pm`.`meta_value` END) AS `trip_faq_12_trip_faq_title`,
  MAX(CASE WHEN `pm`.`meta_key` = 'trip_faq_12_trip_faq_answer' THEN `pm`.`meta_value` END) AS `trip_faq_12_trip_faq_answer`,
  MAX(CASE WHEN `pm`.`meta_key` = 'event_paying_for' THEN `pm`.`meta_value` END) AS `event_paying_for`,
  MAX(CASE WHEN `pm`.`meta_key` = 'event_start_time' THEN `pm`.`meta_value` END) AS `event_start_time`,
  MAX(CASE WHEN `pm`.`meta_key` = 'session_start_time' THEN `pm`.`meta_value` END) AS `session_start_time`,
  MAX(CASE WHEN `pm`.`meta_key` = 'session_end_time' THEN `pm`.`meta_value` END) AS `session_end_time`,
  MAX(CASE WHEN `pm`.`meta_key` = 'who_running_event' THEN `pm`.`meta_value` END) AS `who_running_event`,
  MAX(CASE WHEN `pm`.`meta_key` = 'session_will_cover' THEN `pm`.`meta_value` END) AS `session_will_cover`,
  MAX(CASE WHEN `pm`.`meta_key` = 'event_start_date' THEN `pm`.`meta_value` END) AS `event_start_date`,
  MAX(CASE WHEN `pm`.`meta_key` = 'event_finish_date' THEN `pm`.`meta_value` END) AS `event_finish_date`,
  MAX(CASE WHEN `pm`.`meta_key` = 'event_possible_location' THEN `pm`.`meta_value` END) AS `event_possible_location`,
  MAX(CASE WHEN `pm`.`meta_key` = 'event_location' THEN `pm`.`meta_value` END) AS `event_location`,
  `t`.`name` AS `primary_category`
FROM
  `jtl_posts` `p`
  LEFT JOIN `jtl_postmeta` `pm` ON (`p`.`ID` = `pm`.`post_id`)
  LEFT JOIN `jtl_term_relationships` `tr` ON (`p`.`ID` = `tr`.`object_id`)
  LEFT JOIN `jtl_term_taxonomy` `tt` ON (`tr`.`term_taxonomy_id` = `tt`.`term_taxonomy_id`)
  LEFT JOIN `jtl_terms` `t` ON (`tt`.`term_id` = `t`.`term_id`)
WHERE
  `p`.`post_type` = 'product'
  AND `tt`.`taxonomy` = 'product_cat'
GROUP BY
  `p`.`ID`
ORDER BY
  `t`.`term_id`
