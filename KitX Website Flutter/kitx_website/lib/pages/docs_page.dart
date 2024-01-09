import 'dart:html';
import 'dart:ui_web';

import 'package:flutter/material.dart';

class DocsPage extends StatefulWidget {
  @override
  _DocsPageState createState() => _DocsPageState();
}

class _DocsPageState extends State<DocsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    platformViewRegistry.registerViewFactory('iframe-webview', (_) {
      return IFrameElement()
        ..style.height = '100%'
        ..style.width = '100%'
        ..src = 'https://kitx.docs.catrol.cn/'
        ..style.border = 'none';
    });

    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: HtmlElementView(
        viewType: 'iframe-webview',
        onPlatformViewCreated: (int id) {},
      ),
    );
  }
}
