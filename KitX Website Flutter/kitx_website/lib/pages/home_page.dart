import 'dart:html';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:kitx_website/pages/controls/home_page_actions.dart';
import 'package:kitx_website/pages/controls/drawer.dart';
import 'package:kitx_website/pages/controls/download_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void checkWindowWidth() {
    var width = window.innerWidth;
    if (width != null) {
      if (width <= 500 && showTextOfLinkButton.value)
        showTextOfLinkButton.value = false;
      else if (width > 500 && !showTextOfLinkButton.value)
        showTextOfLinkButton.value = true;
    }
  }

  @override
  void initState() {
    window.onResize.listen((event) => checkWindowWidth());

    checkWindowWidth();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    themeButtonInLightMode.value = !context.isDarkMode;

    return Scaffold(
      appBar: AppBar(
        title: Obx(
          () => Text(
            showTextOfLinkButton.value ? 'KitX Website' : 'KitX',
            overflow: showTextOfLinkButton.value
                ? TextOverflow.fade
                : TextOverflow.ellipsis,
          ),
        ),
        actions: getActions(context),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: Scaffold.of(context).openDrawer,
              //   tooltip: '',
            );
          },
        ),
      ),
      drawer: AppDrawer(),
      drawerEnableOpenDragGesture: true,
      drawerEdgeDragWidth: (window.innerWidth ?? 300) / 2 + 50,
      body: Stack(
        children: [
          Center(
            child: Container(
              width: 500,
              margin: EdgeInsets.all(30),
              child: Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Container(
                  margin: EdgeInsets.all(30),
                  child: getDownloadList(context),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
