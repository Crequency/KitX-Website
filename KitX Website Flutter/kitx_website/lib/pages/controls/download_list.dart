import 'dart:html';

import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kitx_website/common/build/app_build_timestamp.g.dart';
import 'package:kitx_website/pages/controls/controls_helper.dart';
import 'package:kitx_website/pages/controls/download_items_block.dart';
import 'package:kitx_website/pages/controls/download_pages/platform_android.dart';
import 'package:kitx_website/pages/controls/download_pages/platform_ios.dart';
import 'package:kitx_website/pages/controls/download_pages/platform_linux.dart';
import 'package:kitx_website/pages/controls/download_pages/platform_macos.dart';
import 'package:kitx_website/pages/controls/download_pages/platform_windows.dart';
import 'package:kitx_website/utils/global.dart';
import 'package:kitx_website/utils/open_link.dart';
import 'package:package_info_plus/package_info_plus.dart';

var downloadSource = 'GitHub'.obs;

void downloadFile(String url) {
  Future.delayed(
    Duration.zero,
    () {
      AnchorElement(href: url)
        ..download = url
        ..click();
    },
  );
}

void beginDownload(BuildContext context, String id) {
  Get.back();

  if (id.contains('.pubxml')) id = id.replaceAll('.pubxml', '');

  var fileName = 'kitx-$id.7z';

  if (id.endsWith('apk')) {
    fileName = id;
  }

  var url = '';

  switch (downloadSource.value) {
    case 'GitHub':
      url = 'https://github.com/Crequency/KitX/releases/latest/download/$fileName';
      break;
    case 'Gitee':
      // ToDo: Add Gitee download source
      break;
    case 'Crequency':
      var source = 'https://dl.catrol.cn/kitx';
      url = '$source/latest/$fileName';
      break;
  }

  Get.snackbar(
    'Download_Begin'.tr,
    url,
    icon: const Icon(Icons.download),
    shouldIconPulse: true,
    snackPosition: SnackPosition.BOTTOM,
    duration: const Duration(seconds: 3),
    margin: EdgeInsets.all(30),
  );

  downloadFile(url);
}

void showItemsDialog(BuildContext context, List<Widget> items) {
  app.delay(
    () => showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Container(
          width: MediaQuery.of(context).size.width < 600 ? MediaQuery.of(context).size.width * 0.9 : 600,
          margin: EdgeInsets.all(30),
          child: ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: items,
          ),
        ),
      ),
    ),
    100,
  );
}

var backToHome = () {};

Widget getDownloadList(BuildContext context) {
  var runtimes = ['dotnet 8'];

  const tilesPadding = 15.0;

  const heroIconSize = 168.0;

  const hideIconColor = true;

  const downloadItemTileBottomPadding = 6.5;

  var pageController = PageController();

  var index = 0.obs;

  var navigateTo = (int x) {
    if (x != 0) index.value = x;

    pageController.animateToPage(
      x > 0 ? 1 : 0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOutCubic,
    );
  };

  backToHome = () => navigateTo(0);

  var downloadSourceController = TextEditingController();

  downloadSourceController.addListener(() {
    var text = downloadSourceController.text;
    var available = ['GitHub', 'Crequency'];
    var valid = false;

    for (var element in available) {
      if (element.startsWith(text)) {
        valid = true;
        downloadSourceController.text = element;
        continue;
      }
    }

    if (valid == false) {
      downloadSourceController.text = 'GitHub';
    }
  });

  var sourceSwitcher = Padding(
    padding: EdgeInsets.only(top: tilesPadding),
    child: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Download_SelectDownloadSource'.tr),
          const SizedBox(width: 20),
          Obx(
            () => DropdownMenu(
              initialSelection: downloadSource.value,
              leadingIcon: const Icon(Icons.cloud_download_rounded),
              controller: downloadSourceController,
              enableFilter: false,
              enableSearch: false,
              onSelected: (value) => downloadSource.value = value!,
              dropdownMenuEntries: [
                DropdownMenuEntry(value: 'GitHub', label: 'GitHub'),
                DropdownMenuEntry(value: 'Crequency', label: 'Crequency'),
              ],
            ),
          ),
        ],
      ),
    ),
  );

  var recommendedChip = Chip(
    avatar: const Icon(Icons.recommend_rounded),
    label: Text('Public_Recommended'.tr),
  );

  return PageView(
    controller: pageController,
    physics: const NeverScrollableScrollPhysics(),
    scrollDirection: Axis.horizontal,
    children: [
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            borderRadius: BorderRadius.all(Radius.elliptical(15, 15)),
            splashColor: context.iconColor?.withOpacity(0.3),
            onTap: () {},
            child: const Image(
              width: heroIconSize,
              height: heroIconSize,
              alignment: Alignment.center,
              image: const AssetImage('assets/KitX-Icon-192x-margin-2x.png'),
              fit: BoxFit.fitWidth,
            ),
          ),
          const Column(
            children: [
              const Text('KitX', style: const TextStyle(fontSize: 46)),
              const Text('v3.23.04'),
            ],
          ),
          const SizedBox(height: 15),
          const Divider(),
          const SizedBox(height: 15),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: [
                standardPlatformItem(
                  title: 'Windows',
                  subTitle: ('Download_Supported'.trParams({'content': 'Windows 10/11'}), null),
                  // ignore: dead_code
                  leading: const Icon(CommunityMaterialIcons.microsoft_windows, color: hideIconColor ? null : Colors.blue),
                  onTap: () => navigateTo(1),
                ),
                const SizedBox(height: tilesPadding),
                standardPlatformItem(
                  title: 'GNU/Linux',
                  subTitle: ('Download_Tested'.trParams({'content': 'Ubuntu 20.04+, Deepin ...'}), null),
                  // ignore: dead_code
                  leading: const Icon(CommunityMaterialIcons.linux, color: hideIconColor ? null : Colors.amberAccent),
                  onTap: () => navigateTo(2),
                ),
                const SizedBox(height: tilesPadding),
                standardPlatformItem(
                  title: 'MacOS',
                  subTitle: ('Download_Tested'.trParams({'content': 'MacOS Monterey'}), null),
                  // ignore: dead_code
                  leading: const Icon(CommunityMaterialIcons.apple, color: hideIconColor ? null : Colors.white70),
                  onTap: () => navigateTo(3),
                ),
                const SizedBox(height: tilesPadding),
                standardPlatformItem(
                  title: 'Android',
                  subTitle: (
                    'Download_Supported'.trParams({
                      'content': 'Android 5.0+',
                    }),
                    null
                  ),
                  // ignore: dead_code
                  leading: const Icon(CommunityMaterialIcons.android, color: hideIconColor ? null : Colors.greenAccent),
                  onTap: () => navigateTo(4),
                ),
                const SizedBox(height: tilesPadding),
                standardPlatformItem(
                  enabled: false,
                  title: 'iOS',
                  subTitle: ('Download_NoTest'.tr, null),
                  leading: const Icon(CommunityMaterialIcons.apple_ios),
                  onTap: () {},
                ),
                const SizedBox(height: tilesPadding),
                Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: IconButton.outlined(
                      icon: const Icon(Icons.more_horiz_rounded),
                      onPressed: () {
                        showItemsDialog(
                          context,
                          [
                            listTileItem(
                              title: 'Download_ElderVersions'.tr,
                              subTitle: ('Download_LookingForElderVersions'.tr, null),
                              leading: const Icon(CommunityMaterialIcons.view_list),
                              trailing: const Icon(CommunityMaterialIcons.open_in_new),
                              onTap: () {
                                Get.back();
                                openLink('GitHubRepo_KitX_Releases');
                              },
                            ),
                            const SizedBox(height: tilesPadding),
                            listTileItem(
                              title: 'View_AboutPage'.tr,
                              subTitle: ('View_AboutPage_Tip'.tr, null),
                              leading: const Icon(Icons.info),
                              trailing: const Icon(CommunityMaterialIcons.open_in_new),
                              onTap: () {
                                var appName = ''.obs;
                                var packageName = ''.obs;
                                var version = ''.obs;
                                var buildNumber = ''.obs;

                                Future.sync(() async {
                                  var packageInfo = await PackageInfo.fromPlatform();

                                  appName.value = packageInfo.appName;
                                  packageName.value = packageInfo.packageName;
                                  version.value = packageInfo.version;
                                  buildNumber.value = packageInfo.buildNumber;
                                });

                                var content = Center(
                                  child: Container(
                                    width: 500,
                                    margin: EdgeInsets.all(30),
                                    child: Card(
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      child: Container(
                                        margin: EdgeInsets.all(30),
                                        child: Column(
                                          children: [
                                            Text(
                                              'About',
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(height: 20),
                                            Obx(
                                              () => Text(
                                                'App Name: ${appName.value}',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                            Obx(
                                              () => Text(
                                                'Package Name: ${packageName.value}',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                            Obx(
                                              () => Text(
                                                'Version: ${version.value}',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                            Obx(
                                              () => Text(
                                                'Build Number: ${buildNumber.value}',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              'Build timestamp: $lastAppBuildTimestamp',
                                              style: TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );

                                Get.back();
                                Get.to(
                                  () => Scaffold(
                                    appBar: AppBar(
                                      title: Text('About_Page'.tr),
                                    ),
                                    body: content,
                                  ),
                                );
                              },
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
                // sourceSwitcher,
              ],
            ),
          ),
        ],
      ),
      Obx(
        () {
          switch (index.value) {
            case 1:
              return getWindowsPage(
                context,
                const SizedBox(height: tilesPadding),
                const SizedBox(height: downloadItemTileBottomPadding),
                recommendedChip,
                sourceSwitcher,
                runtimes,
              );
            case 2:
              return getLinuxPage(
                context,
                const SizedBox(height: tilesPadding),
                const SizedBox(height: downloadItemTileBottomPadding),
                recommendedChip,
                sourceSwitcher,
                runtimes,
              );
            case 3:
              return getMacOsPage(
                context,
                const SizedBox(height: tilesPadding),
                const SizedBox(height: downloadItemTileBottomPadding),
                recommendedChip,
                sourceSwitcher,
                runtimes,
              );
            case 4:
              return getAndroidPage(
                context,
                const SizedBox(height: tilesPadding),
                const SizedBox(height: downloadItemTileBottomPadding),
                recommendedChip,
                sourceSwitcher,
                runtimes,
              );
            case 5:
              return getIosPage(
                context,
                const SizedBox(height: tilesPadding),
                const SizedBox(height: downloadItemTileBottomPadding),
                recommendedChip,
                sourceSwitcher,
                runtimes,
              );
          }

          return DownloadItemsBlock(children: []);
        },
      ),
    ],
  );
}
