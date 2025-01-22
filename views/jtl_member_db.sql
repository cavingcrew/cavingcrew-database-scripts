CREATE ALGORITHM = UNDEFINED DEFINER = `root` @`%` SQL SECURITY DEFINER VIEW `jtl_member_db` AS
select
  `u`.`ID` AS `ID`,
  `u`.`user_login` AS `user_login`,
  max(
    case
      when `um`.`meta_key` = 'nickname' then `um`.`meta_value`
    end
  ) AS `nickname`,
  max(
    case
      when `um`.`meta_key` = 'first_name' then `um`.`meta_value`
    end
  ) AS `first_name`,
  max(
    case
      when `um`.`meta_key` = 'last_name' then `um`.`meta_value`
    end
  ) AS `last_name`,
  max(
    case
      when `um`.`meta_key` = 'billing_first_name' then `um`.`meta_value`
    end
  ) AS `billing_first_name`,
  max(
    case
      when `um`.`meta_key` = 'billing_last_name' then `um`.`meta_value`
    end
  ) AS `billing_last_name`,
  max(
    case
      when `um`.`meta_key` = 'billing_email' then `um`.`meta_value`
    end
  ) AS `billing_email`,
  max(
    case
      when `um`.`meta_key` = 'billing_address_1' then `um`.`meta_value`
    end
  ) AS `billing_address_1`,
  max(
    case
      when `um`.`meta_key` = 'billing_address_2' then `um`.`meta_value`
    end
  ) AS `billing_address_2`,
  max(
    case
      when `um`.`meta_key` = 'billing_city' then `um`.`meta_value`
    end
  ) AS `billing_city`,
  max(
    case
      when `um`.`meta_key` = 'billing_postcode' then `um`.`meta_value`
    end
  ) AS `billing_postcode`,
  max(
    case
      when `um`.`meta_key` = 'billing_country' then `um`.`meta_value`
    end
  ) AS `billing_country`,
  max(
    case
      when `um`.`meta_key` = 'admin-emergency-contact-name' then `um`.`meta_value`
    end
  ) AS `admin-emergency-contact-name`,
  max(
    case
      when `um`.`meta_key` = 'admin-emergency-contact-phone' then `um`.`meta_value`
    end
  ) AS `admin-emergency-contact-phone`,
  max(
    case
      when `um`.`meta_key` = 'admin-first-timer-question' then `um`.`meta_value`
    end
  ) AS `admin-first-timer-question`,
  max(
    case
      when `um`.`meta_key` = 'admin-covid-agreement' then `um`.`meta_value`
    end
  ) AS `admin-covid-agreement`,
  max(
    case
      when `um`.`meta_key` = 'admin-covid-cautious' then `um`.`meta_value`
    end
  ) AS `admin-covid-cautious`,
  max(
    case
      when `um`.`meta_key` = 'admin-no-insurance-disclaimer' then `um`.`meta_value`
    end
  ) AS `admin-no-insurance-disclaimer`,
  max(
    case
      when `um`.`meta_key` = 'admin-insurance-status' then `um`.`meta_value`
    end
  ) AS `admin-insurance-status`,
  max(
    case
      when `um`.`meta_key` = 'admin-participation-statement-one' then `um`.`meta_value`
    end
  ) AS `admin-participation-statement-one`,
  max(
    case
      when `um`.`meta_key` = 'admin-participation-statement-two' then `um`.`meta_value`
    end
  ) AS `admin-participation-statement-two`,
  max(
    case
      when `um`.`meta_key` = 'admin-diet-allergies-health-extra-info' then `um`.`meta_value`
    end
  ) AS `admin-diet-allergies-health-extra-info`,
  max(
    case
      when `um`.`meta_key` = 'admin-dietary-requirements' then `um`.`meta_value`
    end
  ) AS `admin-dietary-requirements`,
  max(
    case
      when `um`.`meta_key` = 'skills-horizontal' then `um`.`meta_value`
    end
  ) AS `skills-horizontal`,
  max(
    case
      when `um`.`meta_key` = 'skills-leading-srt' then `um`.`meta_value`
    end
  ) AS `skills-leading-srt`,
  max(
    case
      when `um`.`meta_key` = 'skills-srt' then `um`.`meta_value`
    end
  ) AS `skills-srt`,
  max(
    case
      when `um`.`meta_key` = 'skills-leading-horizontal' then `um`.`meta_value`
    end
  ) AS `skills-leading-horizontal`,
  max(
    case
      when `um`.`meta_key` = 'caving-horizontal-happy-to-second-or-lead' then `um`.`meta_value`
    end
  ) AS `caving-horizontal-happy-to-second-or-lead`,
  max(
    case
      when `um`.`meta_key` = 'gear-bringing-evening-or-day-trip' then `um`.`meta_value`
    end
  ) AS `gear-bringing-evening-or-day-trip`,
  max(
    case
      when `um`.`meta_key` = 'transport-need-lift' then `um`.`meta_value`
    end
  ) AS `transport-need-lift`,
  max(
    case
      when `um`.`meta_key` = 'transport-will-you-give-lift' then `um`.`meta_value`
    end
  ) AS `transport-will-you-give-lift`,
  max(
    case
      when `um`.`meta_key` = 'transport-depature-time' then `um`.`meta_value`
    end
  ) AS `transport-depature-time`,
  max(
    case
      when `um`.`meta_key` = 'transport-leaving-location' then `um`.`meta_value`
    end
  ) AS `transport-leaving-location`,
  max(
    case
      when `um`.`meta_key` = 'admin-phone-number' then `um`.`meta_value`
    end
  ) AS `admin-phone-number`,
  max(
    case
      when `um`.`meta_key` = 'gear-rope-length' then `um`.`meta_value`
    end
  ) AS `gear-rope-length`,
  max(
    case
      when `um`.`meta_key` = 'gear-walking-equipment-weekend' then `um`.`meta_value`
    end
  ) AS `gear-walking-equipment-weekend`,
  max(
    case
      when `um`.`meta_key` = 'last_update' then `um`.`meta_value`
    end
  ) AS `last_update`,
  max(
    case
      when `um`.`meta_key` = 'wc_last_active' then `um`.`meta_value`
    end
  ) AS `wc_last_active`,
  max(
    case
      when `um`.`meta_key` = 'billing_phone' then `um`.`meta_value`
    end
  ) AS `billing_phone`,
  max(
    case
      when `um`.`meta_key` = 'admin-will-you-not-flake-please' then `um`.`meta_value`
    end
  ) AS `admin-will-you-not-flake-please`,
  max(
    case
      when `um`.`meta_key` = 'shipping_address_1' then `um`.`meta_value`
    end
  ) AS `shipping_address_1`,
  max(
    case
      when `um`.`meta_key` = 'shipping_address_2' then `um`.`meta_value`
    end
  ) AS `shipping_address_2`,
  max(
    case
      when `um`.`meta_key` = 'shipping_city' then `um`.`meta_value`
    end
  ) AS `shipping_city`,
  max(
    case
      when `um`.`meta_key` = 'shipping_postcode' then `um`.`meta_value`
    end
  ) AS `shipping_postcode`,
  max(
    case
      when `um`.`meta_key` = 'shipping_country' then `um`.`meta_value`
    end
  ) AS `shipping_country`,
  max(
    case
      when `um`.`meta_key` = 'payment_customer_id' then `um`.`meta_value`
    end
  ) AS `payment_customer_id`,
  max(
    case
      when `um`.`meta_key` = 'payment_customer_email' then `um`.`meta_value`
    end
  ) AS `payment_customer_email`,
  max(
    case
      when `um`.`meta_key` = 'caving-srt-or-horizontal-preference' then `um`.`meta_value`
    end
  ) AS `caving-srt-or-horizontal-preference`,
  max(
    case
      when `um`.`meta_key` = 'admin-club-constitution-acceptance' then `um`.`meta_value`
    end
  ) AS `admin-club-constitution-acceptance`,
  max(
    case
      when `um`.`meta_key` = 'bca_member' then `um`.`meta_value`
    end
  ) AS `_legacy_info_bca_member`,
  max(
    case
      when `um`.`meta_key` = 'bca_club' then `um`.`meta_value`
    end
  ) AS `_legacy_info_bca_club`,
  max(
    case
      when `um`.`meta_key` = 'admin-over18' then `um`.`meta_value`
    end
  ) AS `admin-over18`,
  max(
    case
      when `um`.`meta_key` = 'admin_dob' then `um`.`meta_value`
    end
  ) AS `admin_dob`,
  max(
    case
      when `um`.`meta_key` = 'admin-personal-year-of-birth' then `um`.`meta_value`
    end
  ) AS `admin-personal-year-of-birth`,
  max(
    case
      when `um`.`meta_key` = 'admin-personal-pronouns' then `um`.`meta_value`
    end
  ) AS `admin-personal-pronouns`,
  max(
    case
      when `um`.`meta_key` = 'admin-car-registration' then `um`.`meta_value`
    end
  ) AS `admin-car-registration`,
  max(
    case
      when `um`.`meta_key` = 'admin-health-shoulder' then `um`.`meta_value`
    end
  ) AS `admin-health-shoulder`,
  max(
    case
      when `um`.`meta_key` = 'admin-health-asthma' then `um`.`meta_value`
    end
  ) AS `admin-health-asthma`,
  max(
    case
      when `um`.`meta_key` = 'admin-health-missing-dose' then `um`.`meta_value`
    end
  ) AS `admin-health-missing-dose`,
  max(
    case
      when `um`.`meta_key` = 'admin-other-club-name' then `um`.`meta_value`
    end
  ) AS `admin-other-club-name`,
  max(
    case
      when `um`.`meta_key` = 'admin-bca-number' then `um`.`meta_value`
    end
  ) AS `admin-bca-number`,
  max(
    case
      when `um`.`meta_key` = 'misc-any-other-requests' then `um`.`meta_value`
    end
  ) AS `misc-any-other-requests`,
  max(
    case
      when `um`.`meta_key` = 'admin_can_you_help_evenings' then `um`.`meta_value`
    end
  ) AS `admin_can_you_help_evenings`,
  max(
    case
      when `um`.`meta_key` = 'admin_can_you_help_overnight' then `um`.`meta_value`
    end
  ) AS `admin_can_you_help_overnight`,
  max(
    case
      when `um`.`meta_key` = 'admin_can_you_help_daytrip' then `um`.`meta_value`
    end
  ) AS `admin_can_you_help_daytrip`,
  max(
    case
      when `um`.`meta_key` = 'admin-can-you-help-organisation' then `um`.`meta_value`
    end
  ) AS `admin-can-you-help-organisation`,
  max(
    case
      when `um`.`meta_key` = 'admin-can-you-help-social' then `um`.`meta_value`
    end
  ) AS `admin-can-you-help-social`,
  max(
    case
      when `um`.`meta_key` = 'admin-can-you-help-training' then `um`.`meta_value`
    end
  ) AS `admin-can-you-help-training`,
  max(
    case
      when `um`.`meta_key` = 'admin_can_you_help_ew' then `um`.`meta_value`
    end
  ) AS `admin_can_you_help_ew`,
  max(
    case
      when `um`.`meta_key` = 'cc_member' then `um`.`meta_value`
    end
  ) AS `cc_member`,
  max(
    case
      when `um`.`meta_key` = 'skills-leading-coaching' then `um`.`meta_value`
    end
  ) AS `skills-leading-coaching`,
  max(
    case
      when `um`.`meta_key` = 'membership_managed' then `um`.`meta_value`
    end
  ) AS `membership_managed`,
  max(
    case
      when `um`.`meta_key` = 'membership_renewal_date' then `um`.`meta_value`
    end
  ) AS `membership_renewal_date`,
  max(
    case
      when `um`.`meta_key` = 'caving-srt-happy-to-second-or-lead' then `um`.`meta_value`
    end
  ) AS `caving-srt-happy-to-second-or-lead`,
  max(
    case
      when `um`.`meta_key` = 'committee_current' then `um`.`meta_value`
    end
  ) AS `committee_current`,
  max(
    case
      when `um`.`meta_key` = 'membership_leaving_date' then `um`.`meta_value`
    end
  ) AS `membership_leaving_date`,
  max(
    case
      when `um`.`meta_key` = 'membership_cancellation_date' then `um`.`meta_value`
    end
  ) AS `membership_cancellation_date`,
  max(
    case
      when `um`.`meta_key` = 'cc_membership_cancellation_intent_date' then `um`.`meta_value`
    end
  ) AS `cc_membership_cancellation_intent_date`,
  max(
    case
      when `um`.`meta_key` = 'admin-membership-type' then `um`.`meta_value`
    end
  ) AS `admin-membership-type`,
  max(
    case
      when `um`.`meta_key` = 'admin_agm_voting_code_2024' then `um`.`meta_value`
    end
  ) AS `admin_agm_voting_code_2024`,
  max(
    case
      when `um`.`meta_key` = 'admin_agm_voting_code_2023' then `um`.`meta_value`
    end
  ) AS `admin_agm_voting_code_2023`,
  max(
    case
      when `um`.`meta_key` = 'membership_joining_date' then `um`.`meta_value`
    end
  ) AS `membership_joining_date`,
  max(
    case
      when `um`.`meta_key` = 'cc_membership_join_date' then `um`.`meta_value`
    end
  ) AS `cc_membership_join_date`,
  max(
    case
      when `um`.`meta_key` = 'admin-club-constitution-acceptance-noted-date' then `um`.`meta_value`
    end
  ) AS `admin-club-constitution-acceptance-noted-date`,
  max(
    case
      when `um`.`meta_key` = 'admin-code-of-conduct-accepted-noted-date' then `um`.`meta_value`
    end
  ) AS `admin-code-of-conduct-accepted-noted-date`,
  max(
    case
      when `um`.`meta_key` = 'admin-code-of-conduct-accepted' then `um`.`meta_value`
    end
  ) AS `admin-code-of-conduct-accepted`,
  max(
    case
      when `um`.`meta_key` = 'admin_evening_requests_notes' then `um`.`meta_value`
    end
  ) AS `admin_evening_requests_notes`,
  max(
    case
      when `um`.`meta_key` = 'admin_day_requests_notes' then `um`.`meta_value`
    end
  ) AS `admin_day_requests_notes`,
  max(
    case
      when `um`.`meta_key` = 'admin_overnight_requests_notes' then `um`.`meta_value`
    end
  ) AS `admin_overnight_requests_notes`,
  max(
    case
      when `um`.`meta_key` = 'admin_training_requests_notes' then `um`.`meta_value`
    end
  ) AS `admin_training_requests_notes`,
  max(
    case
      when `um`.`meta_key` = 'admin_social_requests_notes' then `um`.`meta_value`
    end
  ) AS `admin_social_requests_notes`,
  max(
    case
      when `um`.`meta_key` = 'admin-social-facebook-url' then `um`.`meta_value`
    end
  ) AS `admin-social-facebook-url`,
  max(
    case
      when `um`.`meta_key` = 'admin-social-instagram-handle' then `um`.`meta_value`
    end
  ) AS `admin-social-instagram-handle`,
  max(
    case
      when `um`.`meta_key` = 'admin-uninsured-cavers-alert-1' then `um`.`meta_value`
    end
  ) AS `admin-uninsured-climbers-alert-1`,
  max(
    case
      when `um`.`meta_key` = 'admin-no-personal-insurance-disclaimer' then `um`.`meta_value`
    end
  ) AS `admin-no-personal-insurance-disclaimer`,
  max(
    case
      when `um`.`meta_key` = 'stats_volunteer_for_numerator_cached' then `um`.`meta_value`
    end
  ) AS `stats_volunteer_for_numerator_cached`,
  max(
    case
      when `um`.`meta_key` = 'stats_volunteer_for_but_no_attend_cached' then `um`.`meta_value`
    end
  ) AS `stats_volunteer_for_but_no_attend_cached`,
  max(
    case
      when `um`.`meta_key` = 'stats_volunteer_for_denominator_cached' then `um`.`meta_value`
    end
  ) AS `stats_volunteer_for_denominator_cached`,
  max(
    case
      when `um`.`meta_key` = 'stats_attendance_attended_cached' then `um`.`meta_value`
    end
  ) AS `stats_attendance_attended_cached`,
  max(
    case
      when `um`.`meta_key` = 'stats_attendance_daytrip_attended_cached' then `um`.`meta_value`
    end
  ) AS `stats_attendance_outdoor_day_attended_cached`,
  max(
    case
      when `um`.`meta_key` = 'stats_attendance_extrawelcoming_attended_cached' then `um`.`meta_value`
    end
  ) AS `stats_attendance_outdoor_saturday_attended_cached`,
  max(
    case
      when `um`.`meta_key` = 'stats_attendance_evening_attended_cached' then `um`.`meta_value`
    end
  ) AS `stats_attendance_indoor_wednesday_attended_cached`,
  max(
    case
      when `um`.`meta_key` = 'stats_attendance_overnight_attended_cached' then `um`.`meta_value`
    end
  ) AS `stats_attendance_overnight_attended_cached`,
  max(
    case
      when `um`.`meta_key` = 'stats_attendance_training_attended_cached' then `um`.`meta_value`
    end
  ) AS `stats_attendance_training_attended_cached`,
  max(
    case
      when `um`.`meta_key` = 'stats_attendance_social_attended_cached' then `um`.`meta_value`
    end
  ) AS `stats_attendance_social_attended_cached`,
  max(
    case
      when `um`.`meta_key` = 'stats_attendance_signups_cached' then `um`.`meta_value`
    end
  ) AS `stats_attendance_signups_cached`,
  max(
    case
      when `um`.`meta_key` = 'stats_attendance_cancelled_cached' then `um`.`meta_value`
    end
  ) AS `stats_attendance_cancelled_cached`,
  max(
    case
      when `um`.`meta_key` = 'stats_attendance_noregistershow_cached' then `um`.`meta_value`
    end
  ) AS `stats_attendance_noregistershow_cached`,
  max(
    case
      when `um`.`meta_key` = 'stats_attendance_noshow_cached' then `um`.`meta_value`
    end
  ) AS `stats_attendance_noshow_cached`,
  max(
    case
      when `um`.`meta_key` = 'stats_attendance_latebail_cached' then `um`.`meta_value`
    end
  ) AS `stats_attendance_latebail_cached`,
  max(
    case
      when `um`.`meta_key` = 'stats_attendance_duplicate_cached' then `um`.`meta_value`
    end
  ) AS `stats_attendance_duplicate_cached`,
  max(
    case
      when `um`.`meta_key` = 'stats_attendance_inprogress_cached' then `um`.`meta_value`
    end
  ) AS `stats_attendance_inprogress_cached`,
  max(
    case
      when `um`.`meta_key` = 'stats_volunteer_for_but_no_volunteer_cached' then `um`.`meta_value`
    end
  ) AS `stats_volunteer_for_but_no_volunteer_cached`,
  max(
    case
      when `um`.`meta_key` = 'scores_volunteer_reliability_score_cached' then `um`.`meta_value`
    end
  ) AS `scores_volunteer_reliability_score_cached`,
  max(
    case
      when `um`.`meta_key` = 'scores_attendance_reliability_score_cached' then `um`.`meta_value`
    end
  ) AS `scores_attendance_reliability_score_cached`,
  max(
    case
      when `um`.`meta_key` = 'scores_volunteer_value_cached' then `um`.`meta_value`
    end
  ) AS `scores_volunteer_value_cached`,
  max(
    case
      when `um`.`meta_key` = 'scores_attendance_score_cached' then `um`.`meta_value`
    end
  ) AS `scores_attendance_score_cached`,
  max(
    case
      when `um`.`meta_key` = 'scores_volunteer_score_cached' then `um`.`meta_value`
    end
  ) AS `scores_volunteer_score_cached`,
  max(
    case
      when `um`.`meta_key` = 'scores_and_stats_cache_last_updated' then `um`.`meta_value`
    end
  ) AS `scores_and_stats_cache_last_updated`,
  max(
    case
      when `um`.`meta_key` = 'cc_attendance_noted_date' then `um`.`meta_value`
    end
  ) AS `cc_attendance_noted_date`,
  max(
    case
      when `um`.`meta_key` = 'cc_compliance_last_date_of_caving' then `um`.`meta_value`
    end
  ) AS `cc_compliance_last_date_of_caving`,
  max(
    case
      when `um`.`meta_key` = 'milestones_3_badge' then `um`.`meta_value`
    end
  ) AS `milestones_3_badge`,
  max(
    case
      when `um`.`meta_key` = 'milestones_3_badge_marked_given_at' then `um`.`meta_value`
    end
  ) AS `milestones_3_badge_marked_given_at`,
  max(
    case
      when `um`.`meta_key` = 'milestones_3_badge_marked_given_by' then `um`.`meta_value`
    end
  ) AS `milestones_3_badge_marked_given_by`,
  max(
    case
      when `um`.`meta_key` = 'milestones_5_band' then `um`.`meta_value`
    end
  ) AS `milestones_5_band`,
  max(
    case
      when `um`.`meta_key` = 'milestones_5_band_marked_given_at' then `um`.`meta_value`
    end
  ) AS `milestones_5_band_marked_given_at`,
  max(
    case
      when `um`.`meta_key` = 'milestones_5_band_marked_given_by' then `um`.`meta_value`
    end
  ) AS `milestones_5_band_marked_given_by`,
  max(
    case
      when `um`.`meta_key` = 'cc_compliance_first_date_of_caving' then `um`.`meta_value`
    end
  ) AS `cc_compliance_first_date_of_caving`,
  max(
    case
      when `um`.`meta_key` = 'competency_evening_trip_director' then `um`.`meta_value`
    end
  ) AS `competency_evening_trip_director`,
  max(
    case
      when `um`.`meta_key` = 'competency_horizontal_trip_leader' then `um`.`meta_value`
    end
  ) AS `competency_horizontal_trip_leader`,
  max(
    case
      when `um`.`meta_key` = 'competency_evening_trip_tacklemanager' then `um`.`meta_value`
    end
  ) AS `competency_evening_trip_tacklemanager`,
  max(
    case
      when `um`.`meta_key` = 'competency_evening_trip_lift_coordinator' then `um`.`meta_value`
    end
  ) AS `competency_evening_trip_lift_coordinator`,
  max(
    case
      when `um`.`meta_key` = 'competency_vertical_trip_leader' then `um`.`meta_value`
    end
  ) AS `competency_vertical_trip_leader`,
  max(
    case
      when `um`.`meta_key` = 'competency_trip_buddy_friend' then `um`.`meta_value`
    end
  ) AS `competency_trip_buddy_friend`,
  max(
    case
      when `um`.`meta_key` = 'competency_overnight_trip_tacklemanager' then `um`.`meta_value`
    end
  ) AS `competency_overnight_trip_director`,
  max(
    case
      when `um`.`meta_key` = 'competency_overnight_evening_meal' then `um`.`meta_value`
    end
  ) AS `competency_overnight_evening_meal`,
  max(
    case
      when `um`.`meta_key` = 'competency_overnight_caving_coordinator' then `um`.`meta_value`
    end
  ) AS `competency_overnight_caving_coordinator`,
  max(
    case
      when `um`.`meta_key` = 'competency_overnight_lift_coordinator' then `um`.`meta_value`
    end
  ) AS `competency_overnight_lift_coordinator`,
  max(
    case
      when `um`.`meta_key` = 'competency_overnight_breakfast_coordinator' then `um`.`meta_value`
    end
  ) AS `competency_overnight_breakfast_coordinator`,
  max(
    case
      when `um`.`meta_key` = 'competency_training_training_organiser' then `um`.`meta_value`
    end
  ) AS `competency_training_training_organiser`,
  max(
    case
      when `um`.`meta_key` = 'competency_training_skillsharer' then `um`.`meta_value`
    end
  ) AS `competency_training_skillsharer`,
  max(
    case
      when `um`.`meta_key` = 'competency_social_social_organiser' then `um`.`meta_value`
    end
  ) AS `competency_social_social_organiser`,
  max(
    case
      when `um`.`meta_key` = 'admin_evening_join_admin_team' then `um`.`meta_value`
    end
  ) AS `admin_evening_join_admin_team`,
  max(
    case
      when `um`.`meta_key` = 'admin_overnight_join_admin_team' then `um`.`meta_value`
    end
  ) AS `admin_overnight_join_admin_team`,
  max(
    case
      when `um`.`meta_key` = 'caving_trip_leaving_postcode' then `um`.`meta_value`
    end
  ) AS `caving_trip_leaving_postcode`,
  max(
    case
      when `um`.`meta_key` = 'caving_trip_leaving_postcode_geocoded' then `um`.`meta_value`
    end
  ) AS `caving_trip_leaving_postcode_geocoded`,
  max(
    case
      when `um`.`meta_key` = 'caving_trip_leaving_postcode_geocoded_last_updated' then `um`.`meta_value`
    end
  ) AS `caving_trip_leaving_postcode_geocoded_last_updated`,
  max(
    case
      when `um`.`meta_key` = 'gear_wellies_size' then `um`.`meta_value`
    end
  ) AS `gear_wellies_size`,
  max(
    case
      when `um`.`meta_key` = 'admin_training_join_admin_team' then `um`.`meta_value`
    end
  ) AS `admin_training_join_admin_team`,
  (
    select
      `jtl_wc_customer_lookup`.`customer_id`
    from
      `jtl_wc_customer_lookup`
    where
      `jtl_wc_customer_lookup`.`user_id` = `u`.`ID`
  ) AS `customer_id`,
  `u`.`user_email` AS `user_email`
from
  (
    `jtl_users` `u`
    left join `jtl_usermeta` `um` on (`u`.`ID` = `um`.`user_id`)
  )
group by
  `u`.`ID`