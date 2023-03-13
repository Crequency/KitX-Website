import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  final pageOpenDelay = 200;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
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
          // ListTile(
          //   leading: Icon(Icons.devices),
          //   title: Text('Drawer_Devices'.tr),
          //   onTap: () => Global.delay(() {
          //     Get.back();
          //     Get.to(() => DevicePage());
          //   }, pageOpenDelay),
          // ),
        ],
      ),
    );
  }
}
