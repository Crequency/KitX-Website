import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class _Global {
  static final _Global _singleton = _Global._internal();

  var themeNotifier = ValueNotifier(ThemeMode.system);
  var themeMode = ThemeMode.system;

  final version = ''.obs;
  final versionString = ''.obs;

  var packageInfo = PackageInfo.fromPlatform();

  Future<void> init() async {
    await packageInfo.then((value) => version.value = value.version);

    versionString.value = 'v${version.value}';
  }

  void delay(Function func, int milliseconds) {
    Future.delayed(Duration(milliseconds: milliseconds)).then((value) => func.call());
  }

  factory _Global() {
    return _singleton;
  }

  _Global._internal();
}

var Global = _Global();
