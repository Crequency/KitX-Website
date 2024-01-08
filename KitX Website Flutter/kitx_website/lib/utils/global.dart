import 'package:flutter/material.dart';
import 'package:get/get.dart';

class _Global {
  static final _Global _singleton = _Global._internal();

  var themeNotifier = ValueNotifier(ThemeMode.system);

  var navigationIndex = 0.obs;

  Future<void> init() async {}

  void delay(Function func, int milliseconds) {
    Future.delayed(Duration(milliseconds: milliseconds))
        .then((value) => func.call());
  }

  factory _Global() {
    return _singleton;
  }

  _Global._internal();
}

var Global = _Global();
