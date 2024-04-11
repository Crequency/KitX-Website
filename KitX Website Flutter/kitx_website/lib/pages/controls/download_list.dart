import 'dart:html';

import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kitx_website/pages/controls/controls_helper.dart';
import 'package:kitx_website/utils/global.dart';
import 'package:kitx_website/utils/open_link.dart';

var downloadSource = 'GitHub'.obs;

void downloadFile(String url) {
  AnchorElement(href: url)
    ..download = url
    ..click();
}

void beginDownload(BuildContext context, String id) {
  Get.back();

  var latestVersion = 'v3.23.04.6488';

  var baseUrl = 'https://source.catrol.cn/download/apps/kitx';

  if (id.contains('.pubxml')) id = id.replaceAll('.pubxml', '');

  var url = '$baseUrl/desktop/$latestVersion/kitx-$id.7z';

  var canDownload = false;

  if (id.startsWith('win')) {
    url = url.replaceAll('desktop', 'win');
    canDownload = true;
  }

  if (id.startsWith('osx')) {
    url = url.replaceAll('desktop', 'osx');
    canDownload = true;
  }

  if (id.startsWith('linux')) {
    url = url.replaceAll('desktop', 'linux');
    canDownload = true;
  }

  if (id.endsWith('apk')) {
    url = '$baseUrl/android/$latestVersion/$id';
    canDownload = true;
  }

  if (canDownload) downloadFile(url);
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

Widget getDownloadList(BuildContext context) {
  var runtimes = ['dotnet 8'];

  const tilesPadding = 15.0;

  const heroIconSize = 168.0;

  const hideIconColor = true;

  return Column(
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
              subTitle: 'Download_Supported'.trParams({'content': 'Windows 10/11'}),
              // ignore: dead_code
              leading: const Icon(CommunityMaterialIcons.microsoft_windows, color: hideIconColor ? null : Colors.blue),
              onTap: () => showItemsDialog(
                context,
                [
                  standardDownloadItem(
                    title: 'Download_ApplyTo'.trParams({
                      'content': 'Windows ${'Bits_64'.tr} (${'With_Runtime'.trArgs(runtimes)})',
                    }),
                    subTitle: 'win-x64-single.pubxml',
                    onTap: () => beginDownload(context, 'win-x64-single.pubxml'),
                  ),
                  const SizedBox(height: tilesPadding),
                  standardDownloadItem(
                    title: 'Download_ApplyTo'.trParams({
                      'content': 'Windows ${'Bits_32'.tr} (${'With_Runtime'.trArgs(runtimes)})',
                    }),
                    subTitle: 'win-x86-single.pubxml',
                    onTap: () => beginDownload(context, 'win-x86-single.pubxml'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: tilesPadding),
            standardPlatformItem(
              title: 'GNU/Linux',
              subTitle: 'Download_Tested'.trParams({'content': 'Ubuntu 20.04+, Deepin ...'}),
              // ignore: dead_code
              leading: const Icon(CommunityMaterialIcons.linux, color: hideIconColor ? null : Colors.amberAccent),
              onTap: () => showItemsDialog(
                context,
                [
                  standardDownloadItem(
                    title: 'Download_ApplyTo'.trParams({
                      'content': 'Linux ${'Bits_64'.tr} (${'With_Runtime'.trArgs(runtimes)})',
                    }),
                    subTitle: 'linux-x64-single.pubxml',
                    onTap: () => beginDownload(context, 'linux-x64-single.pubxml'),
                  ),
                  const SizedBox(height: tilesPadding),
                  standardDownloadItem(
                    title: 'Download_ApplyTo'.trParams({
                      'content': 'Linux ${'CPU_ARM'.tr} (${'With_Runtime'.trArgs(runtimes)})',
                    }),
                    subTitle: 'linux-arm-single.pubxml',
                    onTap: () => beginDownload(context, 'linux-arm-single.pubxml'),
                  ),
                  const SizedBox(height: tilesPadding),
                  standardDownloadItem(
                    title: 'Download_ApplyTo'.trParams({
                      'content': 'Linux ${'CPU_ARM64'.tr} (${'With_Runtime'.trArgs(runtimes)})',
                    }),
                    subTitle: 'linux-arm64-single.pubxml',
                    onTap: () => beginDownload(context, 'linux-arm64-single.pubxml'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: tilesPadding),
            standardPlatformItem(
              title: 'MacOS',
              subTitle: 'Download_Tested'.trParams({'content': 'MacOS Monterey'}),
              // ignore: dead_code
              leading: const Icon(CommunityMaterialIcons.apple, color: hideIconColor ? null : Colors.white70),
              onTap: () => showItemsDialog(
                context,
                [
                  standardDownloadItem(
                    title: 'Download_ApplyTo'.trParams({
                      'content': 'MacOS ${'Bits_64'.tr} (${'CPU_Apple'.tr}) (${'With_Runtime'.trArgs(runtimes)})',
                    }),
                    subTitle: 'osx-arm64-single.pubxml',
                    onTap: () => beginDownload(context, 'osx-arm64-single.pubxml'),
                  ),
                  const SizedBox(height: tilesPadding),
                  standardDownloadItem(
                    title: 'Download_ApplyTo'.trParams({
                      'content': 'MacOS ${'Bits_64'.tr} (${'CPU_Intel'.tr}) (${'With_Runtime'.trArgs(runtimes)})',
                    }),
                    subTitle: 'osx-x64-single.pubxml',
                    onTap: () => beginDownload(context, 'osx-x64-single.pubxml'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: tilesPadding),
            standardPlatformItem(
              title: 'Android',
              subTitle: 'Download_Supported'.trParams({
                'content': 'Android 5.0+',
              }),
              // ignore: dead_code
              leading: const Icon(CommunityMaterialIcons.android, color: hideIconColor ? null : Colors.greenAccent),
              onTap: () => showItemsDialog(
                context,
                [
                  standardDownloadItem(
                    title: 'Download_ApplyTo'.trParams({
                      'content': 'Android (${'MultiArchSupport'.tr})',
                    }),
                    subTitle: 'kitx-mobile-release.apk',
                    onTap: () => beginDownload(context, 'kitx-mobile-release.apk'),
                  ),
                  const SizedBox(height: tilesPadding),
                  standardDownloadItem(
                    title: 'Download_ApplyTo'.trParams({
                      'content': 'Android ${'CPU_ARM64'.tr} (ABIv8)',
                    }),
                    subTitle: 'kitx-mobile-arm64-v8a-release.apk',
                    onTap: () => beginDownload(context, 'kitx-mobile-arm64-v8a-release.apk'),
                  ),
                  const SizedBox(height: tilesPadding),
                  standardDownloadItem(
                    title: 'Download_ApplyTo'.trParams({
                      'content': 'Android ${'CPU_ARM'.tr} (ABIv7)',
                    }),
                    subTitle: 'kitx-mobile-armeabi-v7a-release.apk',
                    onTap: () => beginDownload(context, 'kitx-mobile-armeabi-v7a-release.apk'),
                  ),
                  const SizedBox(height: tilesPadding),
                  standardDownloadItem(
                    title: 'Download_ApplyTo'.trParams({
                      'content': 'Android ${'CPU_x86_64'.tr}',
                    }),
                    subTitle: 'kitx-mobile-x86_64-release.apk',
                    onTap: () => beginDownload(context, 'kitx-mobile-x86_64-release.apk'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: tilesPadding),
            standardPlatformItem(
              enabled: false,
              title: 'iOS',
              subTitle: 'Download_NoTest'.tr,
              leading: const Icon(CommunityMaterialIcons.apple_ios),
              onTap: () {},
            ),
            const SizedBox(height: tilesPadding),
            listTileItem(
              title: 'Download_ElderVersions'.tr,
              subTitle: 'Download_LookingForElderVersions'.tr,
              leading: const Icon(CommunityMaterialIcons.view_list),
              trailing: const Icon(CommunityMaterialIcons.open_in_new),
              onTap: () => openLink('GitHubRepo_KitX-Mobile_Releases'),
            ),
            const SizedBox(height: tilesPadding),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Download_SelectDownloadSource'.tr),
                const SizedBox(width: 20),
                Container(
                  width: 120,
                  child: Obx(
                    () => DropdownButton<String>(
                      value: downloadSource.value,
                      icon: const Icon(Icons.arrow_downward),
                      isExpanded: true,
                      onChanged: (String? value) {
                        if (value == null) return;

                        downloadSource.value = value;
                      },
                      items: const [
                        const DropdownMenuItem(
                          child: const Text('GitHub'),
                          value: 'GitHub',
                        ),
                        const DropdownMenuItem(
                          child: const Text('Gitee'),
                          value: 'Gitee',
                        ),
                        const DropdownMenuItem(
                          child: const Text('Crequency'),
                          value: 'Crequency',
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ],
  );
}
