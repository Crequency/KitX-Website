import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kitx_website/pages/controls/controls_helper.dart';
import 'package:kitx_website/pages/controls/download_items_block.dart';
import 'package:kitx_website/pages/controls/download_list.dart';

Widget getWindowsPage(
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
      tilesPadder,
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
              tilesPadder,
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  recommendedChip,
                  Chip(label: Text('Bits_64'.tr)),
                  Chip(label: Text('With_Runtime'.trArgs(runtimes))),
                ],
              ),
              downloadItemTilesPadder,
            ],
          )
        ),
        onTap: () => beginDownload(context, 'win-x64-single.pubxml'),
      ),
      tilesPadder,
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
              tilesPadder,
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  Chip(label: Text('Bits_32'.tr)),
                  Chip(label: Text('With_Runtime'.trArgs(runtimes))),
                ],
              ),
              downloadItemTilesPadder,
            ],
          )
        ),
        onTap: () => beginDownload(context, 'win-x86-single.pubxml'),
      ),
      sourceSwitcher,
    ],
  );
}
