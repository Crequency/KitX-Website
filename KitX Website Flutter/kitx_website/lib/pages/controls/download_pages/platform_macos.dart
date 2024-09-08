import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kitx_website/pages/controls/controls_helper.dart';
import 'package:kitx_website/pages/controls/download_items_block.dart';
import 'package:kitx_website/pages/controls/download_list.dart';

Widget getMacOsPage(
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
      tilesPadder,
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
              tilesPadder,
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  Chip(label: Text('Bits_64'.tr)),
                  Chip(label: Text('CPU_Apple'.tr)),
                  Chip(label: Text('With_Runtime'.trArgs(runtimes))),
                ],
              ),
              downloadItemTilesPadder,
            ],
          )
        ),
        onTap: () => beginDownload(context, 'osx-arm64-single.pubxml'),
      ),
      tilesPadder,
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
              tilesPadder,
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  Chip(label: Text('Bits_64'.tr)),
                  Chip(label: Text('CPU_Intel'.tr)),
                  Chip(label: Text('With_Runtime'.trArgs(runtimes))),
                ],
              ),
              downloadItemTilesPadder,
            ],
          )
        ),
        onTap: () => beginDownload(context, 'osx-x64-single.pubxml'),
      ),
      sourceSwitcher,
    ],
  );
}
