import 'package:flutter/material.dart';
import 'package:kitx_website/pages/controls/download_list.dart';

class DownloadItemsBlock extends StatefulWidget {
  const DownloadItemsBlock({
    super.key,
    required this.children,
    this.trailing,
  });

  final List<Widget> children;

  final Widget? trailing;

  @override
  _DownloadItemsBlockState createState() => _DownloadItemsBlockState();
}

class _DownloadItemsBlockState extends State<DownloadItemsBlock> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            TooltipVisibility(
              visible: false,
              child: BackButton(
                onPressed: backToHome,
              ),
            ),
            const Expanded(child: const SizedBox()),
            widget.trailing ?? const SizedBox(),
          ],
        ),
      ]..addAll(widget.children),
    );
  }
}
