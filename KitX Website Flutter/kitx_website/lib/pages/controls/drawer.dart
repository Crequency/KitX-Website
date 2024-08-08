import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kitx_website/utils/global.dart';
import 'package:kitx_website/utils/open_link.dart';

class AppDrawer extends StatelessWidget {
  final pageOpenDelay = 200;

  void navigateTo(int pageNumber) {
    Get.back();
    app.navPageTo(pageNumber);
  }

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
            onTap: () => navigateTo(0),
          ),
          ListTile(
            leading: const Icon(CommunityMaterialIcons.cube),
            title: Text('Plugins_Page'.tr),
            onTap: () => navigateTo(1),
          ),
          // ListTile(
          //   leading: const Icon(CommunityMaterialIcons.file_document),
          //   title: Text('Docs_Page'.tr),
          //   onTap: () => app.navPageTo(2),
          // ),
          ListTile(
            leading: const Icon(Icons.timeline),
            title: Text('Milestones_Page'.tr),
            onTap: () => navigateTo(2),
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: Text('Settings_Page'.tr),
            onTap: () => navigateTo(3),
          ),
          Divider(),
          ListTile(
            leading: const Icon(CommunityMaterialIcons.github),
            title: const Text('GitHub'),
            trailing: const Icon(Icons.open_in_new),
            onTap: () => openLink('GitHubRepo_KitX'),
          ),
          ListTile(
            leading: const Icon(CommunityMaterialIcons.file_document),
            title: Text('Public_Docs'.tr),
            trailing: const Icon(Icons.open_in_new),
            onTap: () => openLink('Docs_KitX'),
          ),
        ],
      ),
    );
  }
}
