import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kitx_website/pages/controls/controls_helper.dart';
import 'package:kitx_website/pages/controls/download_items_block.dart';
import 'package:kitx_website/pages/controls/download_list.dart';
import 'package:kitx_website/utils/open_link.dart';
import 'package:websafe_svg/websafe_svg.dart';

Widget getAndroidPage(
  BuildContext context,
  SizedBox tilesPadder,
  SizedBox downloadItemTilesPadder,
  Widget recommendedChip,
  Widget sourceSwitcher,
  List<String> runtimes,
) {
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
      tilesPadder,
      standardDownloadItem(
        title: 'Get-on-F-Droid'.tr,
        subTitle: (
          null,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Get-on-F-Droid-Details'.tr),
              tilesPadder,
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  Padding(
                    padding: EdgeInsets.all(2),
                    child: WebsafeSvg.asset(
                      'ThirdParty/fdroid-logo.svg',
                      height: 30.0,
                      placeholderBuilder: (context) => const SizedBox(
                        width: 30,
                        height: 30,
                        child: const CircularProgressIndicator(),
                      ),
                    ),
                  ),
                  recommendedChip,
                ],
              ),
              downloadItemTilesPadder,
            ],
          )
        ),
        trailing: const Icon(CommunityMaterialIcons.open_in_new),
        onTap: () => openLink('F-Droid-KitX-Mobile'),
      ),
      tilesPadder,
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
              tilesPadder,
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [recommendedChip],
              ),
              downloadItemTilesPadder,
            ],
          )
        ),
        onTap: () => beginDownload(context, 'kitx-mobile-release.apk'),
      ),
      tilesPadder,
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
              tilesPadder,
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  Chip(label: Text('CPU_ARM64'.tr)),
                  Chip(label: Text('ABIv8')),
                ],
              ),
              downloadItemTilesPadder,
            ],
          )
        ),
        onTap: () => beginDownload(context, 'kitx-mobile-arm64-v8a-release.apk'),
      ),
      tilesPadder,
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
              tilesPadder,
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  Chip(label: Text('CPU_ARM'.tr)),
                  Chip(label: Text('ABIv7')),
                ],
              ),
              downloadItemTilesPadder,
            ],
          )
        ),
        onTap: () => beginDownload(context, 'kitx-mobile-armeabi-v7a-release.apk'),
      ),
      tilesPadder,
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
              tilesPadder,
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  Chip(label: Text('CPU_x86_64'.tr)),
                ],
              ),
              downloadItemTilesPadder,
            ],
          )
        ),
        onTap: () => beginDownload(context, 'kitx-mobile-x86_64-release.apk'),
      ),
      sourceSwitcher,
    ],
  );
}
