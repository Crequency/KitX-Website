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
          ListTile(
            leading: const Icon(Icons.home),
            title: Text('Home_Page'.tr),
            onTap: () => Global.navPageTo(0),
          ),
          ListTile(
            leading: const Icon(Icons.account_balance_rounded),
            title: Text('Plugins_Page'.tr),
            onTap: () => Global.navPageTo(1),
          ),
          ListTile(
            leading: const Icon(CommunityMaterialIcons.file_document),
            title: Text('Public_Docs'.tr),
            onTap: () => Global.navPageTo(2),
          ),
          ListTile(
            leading: const Icon(CommunityMaterialIcons.github),
            title: const Text('GitHub'),
            onTap: () => openLink('GitHubRepo_KitX'),
          ),
        ],
      ),
    );
  }
}
