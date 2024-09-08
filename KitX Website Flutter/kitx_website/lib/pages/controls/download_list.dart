import 'dart:html';

import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kitx_website/pages/controls/controls_helper.dart';
import 'package:kitx_website/pages/controls/download_items_block.dart';
import 'package:kitx_website/utils/global.dart';
import 'package:kitx_website/utils/open_link.dart';
import 'package:websafe_svg/websafe_svg.dart';

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
              //   inputDecorationTheme: const InputDecorationTheme(filled: true),
              onSelected: (value) => downloadSource.value = value!,
              dropdownMenuEntries: [
                DropdownMenuEntry(value: 'GitHub', label: 'GitHub'),
                DropdownMenuEntry(value: 'Crequency', label: 'Crequency'),
              ],
            ),
            // DropdownButton<String>(
            //   value: downloadSource.value,
            //   icon: const Icon(Icons.arrow_downward),
            //   isExpanded: true,
            //   onChanged: (String? value) {
            //     if (value == null) return;

            //     downloadSource.value = value;
            //   },
            //   items: const [
            //     const DropdownMenuItem(
            //       child: const Text('GitHub'),
            //       value: 'GitHub',
            //     ),
            //     // ToDo: Add Gitee download source

            //     // const DropdownMenuItem(
            //     //   child: const Text('Gitee'),
            //     //   value: 'Gitee',
            //     // ),
            //     const DropdownMenuItem(
            //       child: const Text('Crequency'),
            //       value: 'Crequency',
            //     ),
            //   ],
            // ),
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
                              onTap: () => openLink('GitHubRepo_KitX_Releases'),
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
              return DownloadItemsBlock(
                trailing: ElevatedButton.icon(
                  onPressed: null,
                  icon: const Icon(CommunityMaterialIcons.microsoft_windows, color: Colors.white),
                  label: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    child: Text('Windows', style: TextStyle(color: Colors.white)),
                  ),
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.blue),
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(color: Colors.blue),
                      ),
                    ),
                  ),
                ),
                children: [
                  const SizedBox(height: tilesPadding),
                  standardDownloadItem(
                    title: 'Download_ApplyTo'.trParams({
                      'content': 'Windows ${'Bits_64'.tr}',
                    }),
                    subTitle: (
                      null,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('win-x64-single.pubxml'),
                          const SizedBox(height: tilesPadding),
                          Wrap(
                            spacing: 10,
                            runSpacing: 10,
                            children: [
                              recommendedChip,
                              Chip(label: Text('Bits_64'.tr)),
                              Chip(label: Text('With_Runtime'.trArgs(runtimes))),
                            ],
                          ),
                          const SizedBox(height: downloadItemTileBottomPadding),
                        ],
                      )
                    ),
                    onTap: () => beginDownload(context, 'win-x64-single.pubxml'),
                  ),
                  const SizedBox(height: tilesPadding),
                  standardDownloadItem(
                    title: 'Download_ApplyTo'.trParams({
                      'content': 'Windows ${'Bits_32'.tr}',
                    }),
                    subTitle: (
                      null,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('win-x86-single.pubxml'),
                          const SizedBox(height: tilesPadding),
                          Wrap(
                            spacing: 10,
                            runSpacing: 10,
                            children: [
                              Chip(label: Text('Bits_32'.tr)),
                              Chip(label: Text('With_Runtime'.trArgs(runtimes))),
                            ],
                          ),
                          const SizedBox(height: downloadItemTileBottomPadding),
                        ],
                      )
                    ),
                    onTap: () => beginDownload(context, 'win-x86-single.pubxml'),
                  ),
                  sourceSwitcher,
                ],
              );
            case 2:
              return DownloadItemsBlock(
                trailing: ElevatedButton.icon(
                  onPressed: null,
                  icon: const Icon(CommunityMaterialIcons.linux, color: Colors.white),
                  label: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    child: Text('GNU/Linux', style: TextStyle(color: Colors.white)),
                  ),
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.amber),
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(color: Colors.amber),
                      ),
                    ),
                  ),
                ),
                children: [
                  const SizedBox(height: tilesPadding),
                  standardDownloadItem(
                    title: 'Download_ApplyTo'.trParams({
                      'content': 'Linux ${'Bits_64'.tr}',
                    }),
                    subTitle: (
                      null,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('linux-x64-single.pubxml'),
                          const SizedBox(height: tilesPadding),
                          Wrap(
                            spacing: 10,
                            runSpacing: 10,
                            children: [
                              Chip(label: Text('Bits_64'.tr)),
                              Chip(label: Text('With_Runtime'.trArgs(runtimes))),
                            ],
                          ),
                          const SizedBox(height: downloadItemTileBottomPadding),
                        ],
                      )
                    ),
                    onTap: () => beginDownload(context, 'linux-x64-single.pubxml'),
                  ),
                  const SizedBox(height: tilesPadding),
                  standardDownloadItem(
                    title: 'Download_ApplyTo'.trParams({
                      'content': 'Linux ${'CPU_ARM'.tr}',
                    }),
                    subTitle: (
                      null,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('linux-arm-single.pubxml'),
                          const SizedBox(height: tilesPadding),
                          Wrap(
                            spacing: 10,
                            runSpacing: 10,
                            children: [
                              Chip(label: Text('CPU_ARM'.tr)),
                              Chip(label: Text('With_Runtime'.trArgs(runtimes))),
                            ],
                          ),
                          const SizedBox(height: downloadItemTileBottomPadding),
                        ],
                      )
                    ),
                    onTap: () => beginDownload(context, 'linux-arm-single.pubxml'),
                  ),
                  const SizedBox(height: tilesPadding),
                  standardDownloadItem(
                    title: 'Download_ApplyTo'.trParams({
                      'content': 'Linux ${'CPU_ARM64'.tr}',
                    }),
                    subTitle: (
                      null,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('linux-arm64-single.pubxml'),
                          const SizedBox(height: tilesPadding),
                          Wrap(
                            spacing: 10,
                            runSpacing: 10,
                            children: [
                              Chip(label: Text('CPU_ARM64'.tr)),
                              Chip(label: Text('With_Runtime'.trArgs(runtimes))),
                            ],
                          ),
                          const SizedBox(height: downloadItemTileBottomPadding),
                        ],
                      )
                    ),
                    onTap: () => beginDownload(context, 'linux-arm64-single.pubxml'),
                  ),
                  sourceSwitcher,
                ],
              );
            case 3:
              return DownloadItemsBlock(
                trailing: ElevatedButton.icon(
                  onPressed: null,
                  icon: const Icon(CommunityMaterialIcons.apple, color: Colors.white),
                  label: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    child: Text('MacOS', style: TextStyle(color: Colors.white)),
                  ),
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.black87),
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(color: Colors.black87),
                      ),
                    ),
                  ),
                ),
                children: [
                  const SizedBox(height: tilesPadding),
                  standardDownloadItem(
                    title: 'Download_ApplyTo'.trParams({
                      'content': 'MacOS ${'Bits_64'.tr} (${'CPU_Apple'.tr})',
                    }),
                    subTitle: (
                      null,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('osx-arm64-single.pubxml'),
                          const SizedBox(height: tilesPadding),
                          Wrap(
                            spacing: 10,
                            runSpacing: 10,
                            children: [
                              Chip(label: Text('Bits_64'.tr)),
                              Chip(label: Text('CPU_Apple'.tr)),
                              Chip(label: Text('With_Runtime'.trArgs(runtimes))),
                            ],
                          ),
                          const SizedBox(height: downloadItemTileBottomPadding),
                        ],
                      )
                    ),
                    onTap: () => beginDownload(context, 'osx-arm64-single.pubxml'),
                  ),
                  const SizedBox(height: tilesPadding),
                  standardDownloadItem(
                    title: 'Download_ApplyTo'.trParams({
                      'content': 'MacOS ${'Bits_64'.tr} (${'CPU_Intel'.tr})',
                    }),
                    subTitle: (
                      null,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('osx-x64-single.pubxml'),
                          const SizedBox(height: tilesPadding),
                          Wrap(
                            spacing: 10,
                            runSpacing: 10,
                            children: [
                              Chip(label: Text('Bits_64'.tr)),
                              Chip(label: Text('CPU_Intel'.tr)),
                              Chip(label: Text('With_Runtime'.trArgs(runtimes))),
                            ],
                          ),
                          const SizedBox(height: downloadItemTileBottomPadding),
                        ],
                      )
                    ),
                    onTap: () => beginDownload(context, 'osx-x64-single.pubxml'),
                  ),
                  sourceSwitcher,
                ],
              );
            case 4:
              return DownloadItemsBlock(
                trailing: ElevatedButton.icon(
                  onPressed: null,
                  icon: const Icon(CommunityMaterialIcons.android, color: Colors.white),
                  label: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    child: Text('Android', style: TextStyle(color: Colors.white)),
                  ),
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.green),
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(color: Colors.green),
                      ),
                    ),
                  ),
                ),
                children: [
                  const SizedBox(height: tilesPadding),
                  standardDownloadItem(
                    title: 'Get-on-F-Droid'.tr,
                    subTitle: (
                      null,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Get-on-F-Droid-Details'.tr),
                          const SizedBox(height: tilesPadding),
                          Wrap(
                            spacing: 10,
                            runSpacing: 10,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(2),
                                child: WebsafeSvg.asset('ThirdParty/fdroid-logo.svg', height: 30.0),
                              ),
                              recommendedChip,
                            ],
                          ),
                          const SizedBox(height: downloadItemTileBottomPadding),
                        ],
                      )
                    ),
                    trailing: const Icon(CommunityMaterialIcons.open_in_new),
                    onTap: () => openLink('F-Droid-KitX-Mobile'),
                  ),
                  const SizedBox(height: tilesPadding),
                  standardDownloadItem(
                    title: 'Download_ApplyTo'.trParams({
                      'content': 'Android (${'MultiArchSupport'.tr})',
                    }),
                    subTitle: (
                      null,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('kitx-mobile-release.apk'),
                          const SizedBox(height: tilesPadding),
                          Wrap(
                            spacing: 10,
                            runSpacing: 10,
                            children: [recommendedChip],
                          ),
                          const SizedBox(height: downloadItemTileBottomPadding),
                        ],
                      )
                    ),
                    onTap: () => beginDownload(context, 'kitx-mobile-release.apk'),
                  ),
                  const SizedBox(height: tilesPadding),
                  standardDownloadItem(
                    title: 'Download_ApplyTo'.trParams({
                      'content': 'Android ${'CPU_ARM64'.tr}',
                    }),
                    subTitle: (
                      null,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('kitx-mobile-arm64-v8a-release.apk'),
                          const SizedBox(height: tilesPadding),
                          Wrap(
                            spacing: 10,
                            runSpacing: 10,
                            children: [
                              Chip(label: Text('CPU_ARM64'.tr)),
                              Chip(label: Text('ABIv8')),
                            ],
                          ),
                          const SizedBox(height: downloadItemTileBottomPadding),
                        ],
                      )
                    ),
                    onTap: () => beginDownload(context, 'kitx-mobile-arm64-v8a-release.apk'),
                  ),
                  const SizedBox(height: tilesPadding),
                  standardDownloadItem(
                    title: 'Download_ApplyTo'.trParams({
                      'content': 'Android ${'CPU_ARM'.tr}',
                    }),
                    subTitle: (
                      null,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('kitx-mobile-armeabi-v7a-release.apk'),
                          const SizedBox(height: tilesPadding),
                          Wrap(
                            spacing: 10,
                            runSpacing: 10,
                            children: [
                              Chip(label: Text('CPU_ARM'.tr)),
                              Chip(label: Text('ABIv7')),
                            ],
                          ),
                          const SizedBox(height: downloadItemTileBottomPadding),
                        ],
                      )
                    ),
                    onTap: () => beginDownload(context, 'kitx-mobile-armeabi-v7a-release.apk'),
                  ),
                  const SizedBox(height: tilesPadding),
                  standardDownloadItem(
                    title: 'Download_ApplyTo'.trParams({
                      'content': 'Android ${'CPU_x86_64'.tr}',
                    }),
                    subTitle: (
                      null,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('kitx-mobile-x86_64-release.apk'),
                          const SizedBox(height: tilesPadding),
                          Wrap(
                            spacing: 10,
                            runSpacing: 10,
                            children: [
                              Chip(label: Text('CPU_x86_64'.tr)),
                            ],
                          ),
                          const SizedBox(height: downloadItemTileBottomPadding),
                        ],
                      )
                    ),
                    onTap: () => beginDownload(context, 'kitx-mobile-x86_64-release.apk'),
                  ),
                  sourceSwitcher,
                ],
              );
            case 5:
              return DownloadItemsBlock(
                trailing: Padding(
                  padding: EdgeInsets.only(right: 5),
                  child: const Icon(CommunityMaterialIcons.apple_ios),
                ),
                children: [
                  sourceSwitcher,
                ],
              );
          }

          return DownloadItemsBlock(children: []);
        },
      ),
    ],
  );
}
