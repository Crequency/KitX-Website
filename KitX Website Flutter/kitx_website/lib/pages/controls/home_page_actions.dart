import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kitx_website/utils/global.dart';
import 'package:kitx_website/utils/open_link.dart';

var themeButtonInLightMode = true.obs;
var showTextOfLinkButton = true.obs;

var actionsPadding = 5.0;
var actionsMargin = 10.0;

List<Widget> getActions(BuildContext context) => [
      IconButton(
          onPressed: () => openLink('GitHubRepo_KitX'),
          icon: Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 1),
            child: Icon(CommunityMaterialIcons.github),
          ),
          tooltip: 'GitHub'),
      SizedBox(width: actionsPadding),
      IconButton(
        onPressed: () => openLink('Docs_KitX'),
        icon: Container(
          child: Icon(CommunityMaterialIcons.file_document),
        ),
        tooltip: 'Public_Docs'.tr,
      ),
      SizedBox(width: actionsPadding),
      Obx(
        () => IconButton(
          onPressed: () => app.themeNotifier.value = context.isDarkMode ? ThemeMode.light : ThemeMode.dark,
          icon: themeButtonInLightMode.value ? const Icon(Icons.light_mode) : const Icon(Icons.dark_mode),
        ),
      ),
      SizedBox(width: actionsPadding),
      PopupMenuButton(
        tooltip: '',
        padding: EdgeInsets.all(0),
        icon: const Icon(Icons.translate),
        itemBuilder: (context) => [
          PopupMenuItem(
            child: const Text('简体中文'),
            onTap: () => app.delay(() => Get.updateLocale(Locale('zh', 'CN')), 200),
          ),
          PopupMenuItem(
            child: const Text('English (US)'),
            onTap: () => app.delay(() => Get.updateLocale(Locale('en', 'US')), 200),
          ),
        ],
      ),
      SizedBox(width: actionsMargin),
    ];
