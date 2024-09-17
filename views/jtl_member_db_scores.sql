CREATE ALGORITHM = UNDEFINED DEFINER = `root` @`%` SQL SECURITY DEFINER VIEW `jtl_member_db_scores` AS
select
  `u`.`id` AS `user_id`,
  floor(
    coalesce(`s`.`volunteer_for_numerator`, 0) / (
      coalesce(`s`.`volunteer_for_numerator`, 0) + coalesce(`s`.`volunteer_for_but_no_attend`, 0) + coalesce(`s`.`volunteer_for_but_no_volunteer`, 0)
    ) * 100
  ) AS `volunteer_reliability_score`,
  floor(
    coalesce(`s`.`attendance_attended`, 0) / (
      coalesce(`s`.`attendance_attended`, 0) + coalesce(`s`.`attendance_latebail`, 0) + coalesce(`s`.`attendance_noshow`, 0)
    ) * 100
  ) AS `attendance_reliability_score`,
  floor(
    coalesce(`s`.`volunteer_for_numerator`, 0) / nullif(coalesce(`s`.`volunteer_for_denominator`, 0), 0) * 100
  ) AS `volunteer_receptiveness`,
  floor(
    coalesce(`s`.`volunteer_for_numerator`, 0) / nullif(coalesce(`s`.`volunteer_for_denominator`, 0), 0) * 100
  ) AS `volunteer_score`,
  floor(
    (
      100 * (
        coalesce(`s`.`volunteer_for_numerator`, 0) / nullif(coalesce(`s`.`volunteer_for_denominator`, 0), 0)
      ) - 2 * coalesce(`s`.`volunteer_for_but_no_attend`, 0)
    ) * coalesce(`s`.`volunteer_for_denominator`, 0)
  ) AS `volunteer_value`,
  floor(
    100 * (
      coalesce(`s`.`volunteer_for_numerator`, 0) / nullif(coalesce(`s`.`volunteer_for_denominator`, 0), 0)
    ) - 2 * coalesce(`s`.`volunteer_for_but_no_attend`, 0)
  ) AS `volunteer_score_old`,
  floor(
    100 - 1 * coalesce(`s`.`attendance_cancelled`, 0) - 7 * coalesce(`s`.`attendance_noshow`, 0) - 3 * coalesce(`s`.`attendance_latebail`, 0) + 2 * coalesce(`s`.`attendance_noregistershow`, 0) + 5 * coalesce(`s`.`attendance_attended`, 0)
  ) AS `attendance_score`
from
  `jtl_member_db` `u`
left join `jtl_member_db_stats` `s` on `u`.`id` = `s`.`user_id`
