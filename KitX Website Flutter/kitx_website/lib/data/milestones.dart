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
    "KitX 初代起航 (v1.1.0)",
    "这个版本是 KitX 第一个拿得出手的版本， 至于为什么没有记录 KitX 开发立项的时间，是因为主创也记不清了（",
    DateTime.parse("2021-02-10"),
  ),
  Milestone(
    "连接 ！ (v1.2.0)",
    "KitX 第一次与服务器连接，提供用户服务",
    DateTime.parse("2021-02-25"),
  ),
  Milestone(
    "安装 ！ (v1.2.7)",
    "KitX 拥有安装包了！",
    DateTime.parse("2021-05-04"),
  ),
  Milestone(
    "停更 QAQ (v2.0.5 pre)",
    "主创去搞信竞去了，KitX 陷入一段时日的停更",
    DateTime.parse("2021-06-27"),
  ),
  Milestone(
    "KitX 3 立项 ！",
    "主创终于想起了这个项目，并计划往跨平台的方向发展，正式开始重做 KitX 3",
    DateTime.parse("2022-07-25"),
  ),
  Milestone(
    "宣传口大成功 ！",
    "主创随便剪了一个视频 (powered by PPT)，竟然获得了十几万播放量，并成功吸引许多志同道合的小伙伴加入，KitX Project 正式启动",
    DateTime.parse("2022-08-18"),
  ),
];

List<Milestone> getMilestones(Locale currentLocale) {
  switch (currentLocale.countryCode) {
    case "CN":
      return milestonesCn;
  }

  return milestonesCn;
}
