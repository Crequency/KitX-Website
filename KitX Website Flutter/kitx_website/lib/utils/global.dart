import 'package:flutter/material.dart';
import 'package:get/get.dart';

class _App {
  static final _App _singleton = _App._internal();

  var themeNotifier = ValueNotifier(ThemeMode.system);

  var navigationIndex = 0.obs;

  late PageController navPageController;

  void navPageTo(int index) {
    var delta = (index - app.navigationIndex.value).abs();
    app.navigationIndex.value = index;
    navPageController.animateToPage(
      index,
      duration: Duration(milliseconds: 150 + delta * 200),
      curve: Curves.easeInOutCubic,
    );
  }

  Future<void> init() async {}

  void delay(Function func, int milliseconds) {
    Future.delayed(Duration(milliseconds: milliseconds)).then((value) => func.call());
  }

  factory _App() {
    return _singleton;
  }

  _App._internal();
}

var app = _App();
