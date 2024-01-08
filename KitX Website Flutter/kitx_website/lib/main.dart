import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:kitx_website/pages/home_page.dart';
import 'package:kitx_website/pages/navigation_page.dart';

import 'package:kitx_website/themes/light_theme.dart';
import 'package:kitx_website/themes/dark_theme.dart';

import 'package:kitx_website/utils/global.dart';
import 'package:kitx_website/utils/translations.dart';

Future<void> main() async {
  await Global.init();

  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: Global.themeNotifier,
      builder: (context, mode, _) => GetMaterialApp(
        title: 'KitX Website',
        themeMode: mode,
        theme: lightThemeData,
        darkTheme: darkThemeData,
        debugShowCheckedModeBanner: false,
        translations: Translation(),
        locale: ui.window.locale,
        fallbackLocale: Locale('en', 'US'),
        home: const NavigationPage(),
      ),
    );
  }
}
