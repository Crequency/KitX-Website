import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:kitx_website/pages/controls/download_items_block.dart';

Widget getIosPage(
  BuildContext context,
  SizedBox tilesPadder,
  SizedBox downloadItemTilesPadder,
  Widget recommendedChip,
  Widget sourceSwitcher,
  List<String> runtimes,
) {
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
