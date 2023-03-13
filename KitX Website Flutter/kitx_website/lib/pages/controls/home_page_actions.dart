import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:community_material_icon/community_material_icon.dart';

import 'package:kitx_website/utils/global.dart';
import 'package:kitx_website/utils/open_link.dart';

var themeButtonInLightMode = true.obs;
var showTextOfLinkButton = true.obs;

var actionsPadding = 5.0;
var actionsMargin = 10.0;

var kitx_docs_key = 'Docs_KitX';
var kitx_github_repo_key = 'GitHubRepo_KitX';

List<Widget> getActions(BuildContext context) => [
      Obx(
        () => showTextOfLinkButton.value
            ? ElevatedButton(
                onPressed: () => openLink(kitx_docs_key),
                child: Row(
                  children: [
                    const Icon(CommunityMaterialIcons.file_document),
                    const SizedBox(width: 10),
                    Text(
                      'Public_Docs'.tr,
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              )
            : IconButton(
                onPressed: () => openLink(kitx_docs_key),
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
                onPressed: () => openLink(kitx_github_repo_key),
                child: Row(
                  children: [
                    const Icon(CommunityMaterialIcons.github),
                    const SizedBox(width: 10),
                    const Text(
                      'GitHub',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              )
            : IconButton(
                onPressed: () => openLink(kitx_github_repo_key),
                icon: Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 1),
                  child: Icon(CommunityMaterialIcons.github),
                ),
              ),
      ),
      SizedBox(width: actionsPadding),
      Obx(
        () => IconButton(
          onPressed: () => Global.themeNotifier.value = context.isDarkMode ? ThemeMode.light : ThemeMode.dark,
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
            onTap: () => Global.delay(() => Get.updateLocale(Locale('zh', 'CN')), 200),
          ),
          PopupMenuItem(
            child: const Text('English (US)'),
            onTap: () => Global.delay(() => Get.updateLocale(Locale('en', 'US')), 200),
          ),
        ],
      ),
      SizedBox(width: actionsMargin),
    ];
