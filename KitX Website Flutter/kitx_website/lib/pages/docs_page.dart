import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:ui' as ui;

class DocsPage extends StatefulWidget {
  @override
  _DocsPageState createState() => _DocsPageState();
}

class _DocsPageState extends State<DocsPage> {
  late html.IFrameElement _iFrameElement;

  @override
  void initState() {
    super.initState();
    _iFrameElement = html.IFrameElement()
      ..width = '800'
      ..height = '600'
      ..src = 'https://kitx.docs.catrol.cn/';

    // Allow the iFrame to load
    _iFrameElement.style.border = 'none';
    _iFrameElement.setAttribute('allow', 'autoplay; encrypted-media');
    _iFrameElement.setAttribute('allowFullScreen', '');
  }

  @override
  Widget build(BuildContext context) {
    return HtmlElementView(
      viewType: 'iFrameElement',
      key: UniqueKey(),
      onPlatformViewCreated: (viewId) {
        // ui.platformViewRegistry.registerViewFactory(
        //   viewId,
        //   (viewId) => _iFrameElement,
        // );
      },
    );
  }
}
