import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:get/get.dart';
import 'package:community_material_icon/community_material_icon.dart';

import 'package:kitx_website/utils/global.dart';

var themeButtonInLightMode = true.obs;
var showTextOfLinkButton = true.obs;

var actionsPadding = 10.0;

List<Widget> getActions(BuildContext context) => [
      SizedBox(width: actionsPadding),
      Obx(
        () => showTextOfLinkButton.value
            ? ElevatedButton(
                onPressed: () => launchUrlString("https://docs.catrol.cn/apps/kitx/"),
                child: Row(
                  children: [
                    const Icon(CommunityMaterialIcons.file_document),
                    const SizedBox(width: 10),
                    const Text(
                      "Docs",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              )
            : IconButton(
                onPressed: () => launchUrlString("https://docs.catrol.cn/apps/kitx/"),
                icon: Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 1),
                  child: Icon(CommunityMaterialIcons.file_document),
                ),
              ),
      ),
      SizedBox(width: actionsPadding),
      Obx(
        () => showTextOfLinkButton.value
            ? ElevatedButton(
                onPressed: () => launchUrlString("https://github.com/Crequency/KitX"),
                child: Row(
                  children: [
                    const Icon(CommunityMaterialIcons.github),
                    const SizedBox(width: 10),
                    const Text(
                      "GitHub",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              )
            : IconButton(
                onPressed: () => launchUrlString("https://github.com/Crequency/KitX"),
                icon: Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 1),
                  child: Icon(CommunityMaterialIcons.github),
                ),
              ),
      ),
      SizedBox(width: actionsPadding),
      Obx(
        () => IconButton(
          onPressed: () {
            Global.themeMode = context.isDarkMode ? ThemeMode.light : ThemeMode.dark;
            Global.themeNotifier.value = Global.themeMode;
          },
          icon: themeButtonInLightMode.value ? const Icon(Icons.light_mode) : const Icon(Icons.dark_mode),
        ),
      ),
      SizedBox(width: actionsPadding),
      PopupMenuButton(
        tooltip: '',
        padding: EdgeInsets.all(0),
        icon: const Icon(Icons.language),
        itemBuilder: (context) => [
          PopupMenuItem(
            child: const Text("简体中文"),
          ),
          PopupMenuItem(
            child: const Text("English (US)"),
          ),
        ],
      ),
      SizedBox(width: actionsPadding),
    ];
