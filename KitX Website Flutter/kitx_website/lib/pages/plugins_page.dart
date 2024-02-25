import 'dart:html';

import 'package:flutter/material.dart';
import 'package:kitx_website/pages/controls/drawer.dart';

class PluginsPage extends StatefulWidget {
  const PluginsPage({super.key});

  @override
  _PluginsPageState createState() => _PluginsPageState();
}

class _PluginsPageState extends State<PluginsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PluginsPage'),
      ),
      drawer: AppDrawer(),
      drawerEnableOpenDragGesture: true,
      drawerEdgeDragWidth: (window.innerWidth ?? 300) / 2 + 50,
      body: Center(child: Text('Under developing ...')),
    );
  }
}
