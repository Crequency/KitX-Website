import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kitx_website/pages/controls/controls_helper.dart';
import 'package:kitx_website/pages/controls/download_items_block.dart';
import 'package:kitx_website/pages/controls/download_list.dart';

Widget getLinuxPage(
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
      tilesPadder,
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
              tilesPadder,
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  Chip(label: Text('Bits_64'.tr)),
                  Chip(label: Text('With_Runtime'.trArgs(runtimes))),
                ],
              ),
              downloadItemTilesPadder,
            ],
          )
        ),
        onTap: () => beginDownload(context, 'linux-x64-single.pubxml'),
      ),
      tilesPadder,
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
              tilesPadder,
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  Chip(label: Text('CPU_ARM'.tr)),
                  Chip(label: Text('With_Runtime'.trArgs(runtimes))),
                ],
              ),
              downloadItemTilesPadder,
            ],
          )
        ),
        onTap: () => beginDownload(context, 'linux-arm-single.pubxml'),
      ),
      tilesPadder,
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
              tilesPadder,
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  Chip(label: Text('CPU_ARM64'.tr)),
                  Chip(label: Text('With_Runtime'.trArgs(runtimes))),
                ],
              ),
              downloadItemTilesPadder,
            ],
          )
        ),
        onTap: () => beginDownload(context, 'linux-arm64-single.pubxml'),
      ),
      sourceSwitcher,
    ],
  );
}
