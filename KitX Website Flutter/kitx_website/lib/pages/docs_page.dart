import 'dart:html';
import 'dart:ui_web';

import 'package:flutter/material.dart';
import 'package:kitx_website/utils/global.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class DocsPage extends StatefulWidget {
  const DocsPage({super.key});

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

    const actionsPadding = SizedBox(width: 8.0);

    return Scaffold(
      appBar: AppBar(
        title: Text('Docs Inside'),
        actions: [
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () => app.navPageTo(0),
          ),
          actionsPadding,
          IconButton(
            icon: const Icon(Icons.account_balance_rounded),
            onPressed: () => app.navPageTo(1),
          ),
          actionsPadding,
          IconButton(
            icon: const Icon(Icons.open_in_new),
            onPressed: () {
              window.open('https://kitx.docs.catrol.cn/', 'KitX Docs');
            },
          ),
          actionsPadding,
        ],
      ),
      drawerEnableOpenDragGesture: false,
      body: Stack(children: [
        Center(
          child: LoadingAnimationWidget.staggeredDotsWave(
            color: Colors.white,
            size: 200,
          ),
        ),
        SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: HtmlElementView(
            viewType: 'iframe-webview',
            onPlatformViewCreated: (int id) {},
          ),
        ),
      ]),
    );
  }
}
