import 'package:flutter/material.dart';

class Milestone {
  const Milestone(
    this.title,
    this.event,
    this.dateTime,
  );

  final String title;

  final String event;

  final DateTime dateTime;
}

List<Milestone> milestonesCn = [
  Milestone(
    "KitX 初代起航 (v1.1.0 正式发布)",
    "这个版本是 KitX 第一个拿得出手的版本， 至于为什么没有记录 KitX 开发立项的时间，是因为主创也记不清了（",
    DateTime.parse("2021-02-10 04:10"),
  ),
];

List<Milestone> getMilestones(Locale currentLocale) {
  switch (currentLocale.countryCode) {
    case "CN":
      return milestonesCn;
  }

  return milestonesCn;
}
