import 'dart:html';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kitx_website/pages/controls/drawer.dart';

class MilestonesPage extends StatefulWidget {
  const MilestonesPage({super.key});

  @override
  _MilestonesPageState createState() => _MilestonesPageState();
}

class _MilestonesPageState extends State<MilestonesPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Milestones_Page'.tr),
      ),
      drawer: AppDrawer(),
      drawerEnableOpenDragGesture: true,
      drawerEdgeDragWidth: (window.innerWidth ?? 300) / 2 + 50,
      body: Center(child: Text('Under developing ...')),
    );
  }
}
