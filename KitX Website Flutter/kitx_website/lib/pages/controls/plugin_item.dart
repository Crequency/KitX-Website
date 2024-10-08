import 'package:flutter/material.dart';
import 'package:kitx_website/pages/controls/plugin_card.dart';
import 'package:kitx_website/shared/plugin_info.dart';

class PluginItem extends StatelessWidget {
  const PluginItem({
    required this.info,
  });

  final PluginInfo info;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return size.width > size.height
        ? PluginCard(info: info)
        : Padding(
            padding: EdgeInsets.all(5),
            child: ListTile(
              title: Text(info.name),
              subtitle: Text(info.author),
              onTap: () {},
            ),
          );
  }
}
