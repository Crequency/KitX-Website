import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:kitx_website/utils/global.dart';
import 'package:kitx_website/utils/open_link.dart';

class AppDrawer extends StatelessWidget {
  final pageOpenDelay = 200;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          ListTile(title: const Text(' ')),
          // ListTile(
          //   leading: Icon(Icons.home),
          //   title: Text('Home_Page'.tr),
          //   onTap: () => Global.navigationIndex.value = 0,
          // ),
          // ListTile(
          //   leading: Icon(Icons.account_balance_rounded),
          //   title: Text('Plugins_Page'.tr),
          //   onTap: () => Global.navigationIndex.value = 1,
          // ),
          ListTile(
            leading: Icon(CommunityMaterialIcons.file_document),
            title: Text('Public_Docs'.tr),
            onTap: () => openLink('Docs_KitX'),
          ),
          ListTile(
            leading: Icon(CommunityMaterialIcons.github),
            title: const Text('GitHub'),
            onTap: () => openLink('GitHubRepo_KitX'),
          ),
        ],
      ),
    );
  }
}
