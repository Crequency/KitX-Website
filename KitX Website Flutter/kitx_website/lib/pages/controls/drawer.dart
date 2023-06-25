import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:community_material_icon/community_material_icon.dart';
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
            leading: Icon(Icons.home),
            title: Text('Home_Page'.tr),
            onTap: () => openLink('Home_Page'),
          ),
          ListTile(
            leading: Icon(Icons.account_balance_rounded),
            title: Text('Plugins_Page'.tr),
            onTap: () {},
          ),
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
          // DrawerHeader(
          //   decoration: BoxDecoration(
          //     // color: Colors.blue,
          //     image: const DecorationImage(
          //       alignment: Alignment.topCenter,
          //       image: AssetImage('assets/KitX-Background.png'),
          //       fit: BoxFit.cover,
          //     ),
          //   ),
          //   child: Text(
          //     '',
          //     // 'Drawer_Title'.tr,
          //     style: TextStyle(
          //       color: Colors.white,
          //       fontSize: 24,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
