import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kitx_website/pages/controls/plugin_item.dart';
import 'package:kitx_website/shared/plugin_info.dart';

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 15,
          ),
          child: Row(
            children: [
              const Icon(
                CommunityMaterialIcons.cube_outline,
                size: 32,
              ),
              Text(
                '  ${'Plugins_Title'.tr}',
                style: const TextStyle(fontSize: 32),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20, right: 15),
              child: SizedBox(
                width: MediaQuery.of(context).size.width > 600 ? 400 : MediaQuery.of(context).size.width - 38.5,
                child: TextField(
                  autofocus: true,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(),
                    labelText: 'Search plugins ...',
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Padding(
          padding: EdgeInsets.all(15),
          child: Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              PluginItem(
                info: PluginInfo(
                  name: 'Test Plugin',
                  version: 'v0.0.1',
                  author: 'Eaucooh',
                  authorLink: null,
                  publisher: 'Crequency',
                  publisherLink: null,
                  iconBase64: null,
                  lastUpdated: DateTime.now(),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
